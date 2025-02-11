pragma ComponentBehavior: Bound
import ThemedUi


TuiFlex {
	id: _root
	
	required property string shadowSize
	direction: "row"
	padding: "0 15"
	justify: "stretch"
	
	TuiFlex {
		w: 100
		padding: "15"
		
		TuiButton {
			label: _root.shadowSize
			colors: "primarytext"
			fontName: "bold"
			shadow: "none"
		}
	}
	TuiFlex {
		flex: 1
		direction: "row"
		
		TuiFlex {
			align: "stretch"
			flex: 1
			padding: "15"
			
			TuiFlex {
				justify: "center"
				align: "center"
				
				TuiButton {
					isPressable: false
					w: 100
					label: ""
					colors: "light"
					shadow: _root.shadowSize
					shape: "md"
				}
			}
		}
		TuiFlex {
			align: "stretch"
			flex: 1
			padding: "15"
			
			TuiFlex {
				justify: "stretch"
				align: "center"
				direction: "row"
				
				TuiText {
					flex: 1
					colors: "tertiarytext"
					text: "The quick brown fox jumps over the lazy dog?! 1234567890 @ -"
					visible: _root.shadowSize !== "lg"
					shadow: _root.shadowSize !== "lg" ? _root.shadowSize : "none"
				}
			}
		}
	}
}
