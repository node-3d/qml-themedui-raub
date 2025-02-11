pragma ComponentBehavior: Bound
import ThemedUi


TuiFlex {
	id: _root
	
	h: 72
	required property string shapeSize
	direction: "row"
	padding: "0 15"
	justify: "stretch"
	
	TuiFlex {
		h: _root.h
		w: 100
		padding: "15"
		
		TuiButton {
			label: _root.shapeSize
			colors: "primarytext"
			fontName: "bold"
			shadow: "none"
		}
	}
	
	Repeater {
		model: ["all", "top", "bottom", "left", "right"]
		Layout.fillWidth: true
		Layout.horizontalStretchFactor: 3
		TuiFlex {
			id: _panel
			required property string modelData
			
			h: _root.h
			align: "center"
			flex: 1
			padding: "15"
			
			TuiButton {
				isPressable: false
				label: ""
				w: 100
				colors: "tertiary"
				shape: `${_root.shapeSize}.${_panel.modelData}`
			}
		}
	}
}
