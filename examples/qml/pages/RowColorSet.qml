pragma ComponentBehavior: Bound
import ThemedUi


TuiFlex {
	id: _root
	
	h: 72
	required property string colorSetName
	direction: "row"
	padding: "0 15"
	justify: "stretch"
	
	TuiFlex {
		h: _root.h
		w: 200
		padding: "15"
		
		TuiButton {
			label: _root.colorSetName
			colors: "primarytext"
			shadow: "none"
		}
	}
	
	Repeater {
		model: ["", "Hover", "Active"]
		
		TuiFlex {
			id: _panel
			required property string modelData
			
			h: _root.h
			align: "center"
			flex: 1
			padding: "15"
			
			TuiButton {
				isPressable: false
				label: _panel.modelData || "Normal"
				colors: _root.colorSetName
				state: _panel.modelData.toLowerCase()
				padding: "15"
				border: "md"
			}
		}
	}
}
