import ThemedUi


PageScrollable {
	id: _root
	contentHeight: _content.height
	
	TuiFlex {
		id: _content
		
		abs: Image {
			anchors.fill: parent
			source: "../images/pattern_33.png"
			fillMode: Image.Tile
			horizontalAlignment: Image.AlignLeft
			verticalAlignment: Image.AlignTop
			opacity: 0.1
			sourceSize.width: 32
			sourceSize.height: 32
			asynchronous: true
		}
		
		padding: "15"
		align: "stretch"
		height: Layout.minimumHeight
		width: _root.availableWidth
		
		Repeater {
			model: Object.keys(TuiContext.theme.colorSets)
			RowColorSet {
				required property string modelData
				colorSetName: modelData
			}
		}
	}
}
