import ThemedUi


TuiFlex {
	id: _root
	
	required property string page
	
	flex: 1
	
	abs: Loader {
		width: _root.width
		height: _root.height
		source: `pages/${_root.page}.qml`
	}
}
