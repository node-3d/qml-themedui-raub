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
		flex: 1
		direction: "row"
		padding: "10 0"
		
		TuiFlex {
			flex: 1
			justify: "center"
			align: "center"
			TuiText {
				colors: "tertiarytext"
				size: _root.sizeName
				text: "Text"
			}
		}
		TuiFlex {
			flex: 1
			justify: "center"
			align: "center"
			TuiIcon {
				colors: "tertiary"
				size: _root.sizeName
				name: "fa_sun"
			}
		}
		TuiFlex {
			flex: 1
			justify: "center"
			align: "center"
			TuiButton {
				padding: "0 15"
				colors: "tertiary"
				size: _root.sizeName
				isPressable: false
				label: "Button"
			}
		}
		TuiFlex {
			flex: 1
			justify: "center"
			align: "center"
			TuiDivider {
				colors: "tertiary"
				size: _root.sizeName
				w: 60
			}
		}
		TuiFlex {
			flex: 1
			justify: "center"
			align: "center"
			TuiListItem {
				padding: "0 15"
				colors: "tertiary"
				size: _root.sizeName
				label: "ListItem"
			}
		}
	}
}
