pragma ComponentBehavior: Bound
import ThemedUi


TuiFlex {
	id: _root
	
	required property string sizeName
	
	direction: "row"
	padding: "0 15"
	justify: "stretch"
	
	TuiFlex {
		w: 100
		padding: "15"
		
		TuiText {
			text: _root.sizeName
			colors: "primarytext"
			fontName: "bold"
		}
	}
	
	TuiFlex {
		id: _row
		
		flex: 1
		direction: "row"
		
		Repeater {
			model: ["regular", "semi", "bold", "mono"]
			
			TuiFlex {
				id: _panel
				required property string modelData
				
				w: _row.width / 4
				justify: "stretch"
				padding: "15"
				direction: "row"
				
				TuiText {
					colors: "tertiarytext"
					flex: 1
					size: _root.sizeName
					text: "The quick brown fox jumps over the lazy dog?! 1234567890 @ -"
					fontName: _panel.modelData
				}
			}
		}
	}
}
