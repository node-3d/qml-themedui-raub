pragma ComponentBehavior: Bound
import ThemedUi


TuiFlex {
	id: _root
	
	h: 72
	property real widthFirst: 100
	required property string firstTitle
	required property list<string> restTitles
	
	direction: "row"
	padding: "0 15"
	justify: "stretch"
	colors: "tertiary"
	
	TuiFlex {
		h: _root.h
		w: _root.widthFirst
		padding: "15"
		
		TuiButton {
			label: _root.firstTitle
			colors: "whitetext"
			fontName: "bold"
			shadow: "none"
		}
	}
	
	Repeater {
		model: _root.restTitles
		
		TuiFlex {
			id: _panel
			required property string modelData
			
			h: _root.h
			align: "center"
			flex: 1
			padding: "15"
			
			TuiButton {
				isPressable: false
				label: _panel.modelData
				w: 100
				colors: "whitetext"
				shadow: "none"
			}
		}
	}
}
