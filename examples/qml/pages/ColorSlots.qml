import ThemedUi


PageScrollable {
	id: _root
	contentHeight: _content.height
	
	TuiFlex {
		id: _content
		
		width: Layout.minimumWidth
		height: Layout.minimumHeight
		
		padding: "15"
		
		TuiText {
			text: "Background"
			fontName: "bold"
		}
		
		ColorSlotGroup {
			prefix: "bg"
		}
		
		TuiText {
			text: "Text"
			fontName: "bold"
			margin: "42 0 0 0"
		}
		
		ColorSlotGroup {
			prefix: "text"
		}
	}
}
