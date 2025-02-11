import ThemedUi

import "themes/themes.js" as Themes


Item {
	id: _root
	anchors.fill: parent
	
	property string themeName: "grey"
	property string page: "SpecColors"
	
	FontLoader {
		id: _mono
		source: "./fonts/DroidSansMono.ttf"
	}
	FontLoader {
		id: _bold
		source: "./fonts/Montserrat-Bold.ttf"
	}
	FontLoader {
		id: _regular
		source: "./fonts/OpenSans-Regular.ttf"
	}
	FontLoader {
		id: _semi
		source: "./fonts/OpenSans-Semibold.ttf"
	}
	
	Component.onCompleted: {
		TuiContext.theme = Themes[themeName];
		TuiContext.iconDelegate = Qt.createComponent("Icon.qml");
	}
	
	TuiFlex {
		anchors.fill: parent
		
		colors: "white"
		align: "stretch"
		justify: "stretch"
		direction: "row"
		
		PanelMenu {
			page: _root.page
			onNavigated: name => { _root.page = name; }
		}
		
		PanelPage { page: _root.page }
	}
}
