import ThemedUi

PageScrollable {
	id: _root
	contentHeight: _content.childrenRect.height
	
	TuiFlex {
		id: _content
		
		align: "stretch"
		width: _root.availableWidth
		height: Layout.minimumHeight
		
		Repeater {
			model: ["sm", "md", "lg", "xlg"]
			RowBorders {
				required property string modelData
				shapeSize: "none"
				borderSize: modelData
			}
		}
		
		TuiDivider {
			size: "md"
			colors: "greytext"
			margin: "15"
		}
		
		Repeater {
			model: ["sm", "md", "lg", "xlg"]
			RowBorders {
				required property string modelData
				shapeSize: "round"
				borderSize: modelData
			}
		}
	}
}
