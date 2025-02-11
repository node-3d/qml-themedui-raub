import ThemedUi

PageScrollable {
	id: _root
	contentHeight: _content.height
	
	TuiFlex {
		id: _content
		
		align: "stretch"
		width: _root.availableWidth
		height: Layout.minimumHeight
		
		RowTableHeader {
			firstTitle: "Size"
			restTitles: ["Box", "Text"]
		}
		
		Repeater {
			model: ["none", "sm", "md", "lg"]
			RowShadows {
				required property string modelData
				shadowSize: modelData
			}
		}
	}
}
