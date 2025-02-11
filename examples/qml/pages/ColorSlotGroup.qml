pragma ComponentBehavior: Bound
import ThemedUi


TuiFlex {
	id: _root
	
	direction: "row"
	
	property string prefix: "bg" // "text"
	
	property list<string> _sourceKeys: Object.keys(TuiContext.theme.colors[prefix])
	
	Repeater {
		model: [
			'primary', 'primaryalt', 'secondary', 'tertiary',
			'accent', 'success', 'warning', 'error', 'contrast',
		]
		
		ColumnColors {
			id: _item
			required property string modelData
			
			fixedWidth: 92
			base: modelData
			colorList: {
				return _root._sourceKeys.filter(
					key => (
						_item.modelData === key ||
						`${_item.modelData}plus` === key ||
						`${_item.modelData}minus` === key
					),
				).map(
					name => ({ name, color: `${prefix}.${name}` })
				);
			}
		}
	}
}
