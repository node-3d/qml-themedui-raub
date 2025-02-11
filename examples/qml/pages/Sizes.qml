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
			restTitles: ["Text", "Icon", "Button", "Divider", "ListItem"]
		}
		
		Repeater {
			model: ["auto", "xxsm", "xsm", "sm", "md", "lg", "xlg", "xxlg"]
			RowSizes {
				required property string modelData
				sizeName: modelData
			}
		}
	}
}
