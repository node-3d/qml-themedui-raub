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
			restTitles: ["regular", "semi", "bold", "mono"]
		}
		
		Repeater {
			model: ["xxsm", "xsm", "sm", "md", "lg", "xlg", "xxlg"]
			RowFonts {
				required property string modelData
				sizeName: modelData
			}
		}
	}
}
