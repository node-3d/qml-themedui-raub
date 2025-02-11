import ThemedUi


TuiButton {
	label: "Menu Item"
	isActive: false
	property string iconName: "fa_book"
	
	justify: "flex-start"
	padding: "10"
	colors: "lighttext"
	colorsActive: "tertiary"
	name: "ColorSlots"
	shape: "none"
	shadow: "none"
	icons: [{ name: iconName }]
}
