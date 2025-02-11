pragma ComponentBehavior: Bound
import ThemedUi


TuiFlex {
	id: _root
	
	signal navigated(page: string)
	required property string page
	
	w: 250
	padding: "15 0"
	colors: "dark"
	
	ScrollView {
		id: _scroll
		Layout.preferredHeight: _root.height
		Layout.preferredWidth: _root.width
		
		ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
		
		ScrollBar.horizontal.interactive: false
		ScrollBar.vertical.interactive: true
		
		contentWidth: availableWidth
		contentHeight: _content.height
		clip: true
		
		TuiFlex {
			id: _content
			
			width: _scroll.availableWidth
			height: Layout.minimumHeight
			
			align: "stretch"
			
			Repeater {
				model: [
					"Spec Colors", "Color Slots", "Color Sets",
					"Shapes", "Borders", "Shadows", "Sizes", "Fonts"
				]
				ButtonMenuItem {
					required property string modelData
					property string _name: modelData.replace(' ', '')
					
					label: modelData
					isActive: _root.page === _name
					name: _name
					onClicked: name => _root.navigated(_name)
				}
			}
		}
	}
}
