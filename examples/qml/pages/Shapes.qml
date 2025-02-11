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
			restTitles: ["", ".top", ".bottom", ".left", ".right"]
		}
		
		Repeater {
			model: ["round", "sm", "md", "lg", "xlg"]
			RowShapes {
				required property string modelData
				shapeSize: modelData
			}
		}
	}
}
