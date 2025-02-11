import ThemedUi


PageScrollable {
	contentHeight: _content.height
	
	TuiFlex {
		id: _content
		
		width: Layout.minimumWidth
		height: Layout.minimumHeight
		
		direction: "row"
		padding: "15"
		
		Repeater {
			model: {
				return Object.keys(
					TuiContext.theme.colors.spec,
				).map(
					key => key.replace(/\d+/g, ''),
				).filter(
					(k, i, a) => (a.indexOf(k) === i),
				);
			}
			
			ColumnColors {
				id: _item
				required property string modelData
				
				base: modelData
				colorList: Object.keys(
					TuiContext.theme.colors.spec,
				).filter(
					key => key.startsWith(_item.modelData),
				).map(
					name => ({ name, color: `spec.${name}` })
				)
			}
		}
	}
}
