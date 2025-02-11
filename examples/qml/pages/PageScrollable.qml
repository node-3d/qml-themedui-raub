import ThemedUi

ScrollView {
	Layout.preferredHeight: parent.height
	Layout.preferredWidth: parent.width
	
	ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
	ScrollBar.vertical.policy: ScrollBar.AlwaysOn
	
	ScrollBar.horizontal.interactive: false
	ScrollBar.vertical.interactive: true
	
	contentWidth: availableWidth
	clip: true
}
