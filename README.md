# PanelView

To create a simple panel use methods from the `PanelFactory`

```
let image = UIImage(named: "star")
var panel: PanelView
panel = PanelFactory.panel(title: "Header", image: image)
panel = PanelFactory.panel(title: "Header", subtitle: "Subheader", image: image)
```

Here you can specify title, subtitle and image.

Bottom button can be set up accessing `button` property, like so:
```
panel.button.setTitle("Button", for: .normal)
```

To create panel with image on the left side, there is a dedicated factory method:
```
leftImagePanel(_ title: String, _ subtitle: String, _ image: UIImage?, _ shadow: Bool)
```

# CardView
CardView is a view, that can represent group of items. To fill cardView invoke `addItem` method specifiying title, subtitle and image:
```
let cardView = CardView()
cardView.addItem("Title", "Description", image)
```
You can access `headerLabel`, `rightButton`, `button` properties to customize the header of the group, button displayed on the right and at tthe bottom.

# RollView
RollView allows to group items with horizontal scroll. The method signature for adding items is the same as CardView's:
```
let rollView = RollView()
rollView.addItem("Title", "Subtitle", image)
```

# Button
There is also factory for creating buttons with predefined style:
```
let btn = ButtonFactory.getButton("Button")
let btnhighlighted = ButtonFactory.getButtonHighlighted("Button highlighted")
```
