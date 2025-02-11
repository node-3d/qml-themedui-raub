.import ThemedUi as TUI


const utils = TUI.TuiContext.themeUtils;
const defaultTheme = TUI.TuiContext.defaultTheme;
const colors = defaultTheme.colors.spec;

const fonts = {
	regular: {
		family: 'Open Sans',
		weight: 400,
	},
	semi: {
		family: 'Open Sans',
		weight: 600,
	},
	bold: {
		family: 'Montserrat',
		weight: 700,
	},
	mono: {
		family: 'Droid Sans Mono',
		weight: 400,
	},
};

const colorSets = Object.assign(
	utils.createStateColorsetTriplet('success'),
	utils.createStateColorsetTriplet('warning'),
	utils.createStateColorsetTriplet('error'),
	{
		none: utils.createTextColorset('transparent', 'transparent', 'transparent'),
		primary: utils.createFlatColorset(
			'text.primary',
			'text.primaryplus',
			'text.primaryminus',
			'bg.primaryalt',
			'bg.primaryaltplus',
			'bg.primaryaltminus',
		),
		primaryghost: {
			text: 'text.primary',
			textHover: 'text.primaryplus',
			textActive: 'text.primaryminus',
			bg: 'bg.primaryalt',
			bgHover: 'bg.primaryaltplus',
			bgActive: 'bg.primaryaltminus',
			border: 'bg.secondary',
			borderHover: 'bg.secondaryplus',
			borderActive: 'bg.secondaryminus',
		},
		primarytext: utils.createTextColorset(
			'text.primary',
			'text.primaryplus',
			'text.primaryminus',
		),
		secondary: utils.createFlatColorset(
			'text.primary',
			'text.primaryplus',
			'text.primaryminus',
			'bg.secondary',
			'bg.secondaryplus',
			'bg.secondaryminus',
		),
		secondaryghost: {
			text: 'text.secondary',
			textHover: 'text.secondaryplus',
			textActive: 'text.secondaryminus',
			bg: 'bg.primaryalt',
			bgHover: 'bg.primaryaltplus',
			bgActive: 'bg.primaryaltminus',
			border: 'bg.secondary',
			borderHover: 'bg.secondaryplus',
			borderActive: 'bg.secondaryminus',
		},
		secondarytext: utils.createTextColorset(
			'text.secondary',
			'text.secondaryplus',
			'text.secondaryminus',
		),
		tertiary: utils.createFlatColorset(
			'spec.grey10',
			'white',
			'spec.grey30',
			'bg.tertiary',
			'bg.tertiaryplus',
			'bg.tertiaryminus',
		),
		tertiaryghost: utils.createGhostColorset(
			'bg.tertiary',
			'bg.tertiaryplus',
			'bg.tertiaryminus',
		),
		tertiarytext: utils.createTextColorset(
			'bg.tertiary',
			'bg.tertiaryplus',
			'bg.tertiaryminus',
		),
		accent: utils.createTextColorset(
			'text.accent',
			'text.accentplus',
			'text.accentminus',
		),
		accentghost: {
			text: 'text.primary',
			textHover: 'text.primaryplus',
			textActive: 'text.primaryminus',
			bg: 'bg.primaryalt',
			bgHover: 'bg.primaryaltplus',
			bgActive: 'bg.primaryaltminus',
			border: 'bg.accent',
			borderHover: 'bg.accentplus',
			borderActive: 'bg.accentminus',
		},
		accenttext: utils.createTextColorset(
			'bg.accent',
			'bg.accentplus',
			'bg.accentminus',
		),
		light: utils.createFlatColorset(
			'spec.grey80',
			'spec.grey90',
			'spec.grey70',
			'spec.grey10',
			'white',
			'spec.grey30',
		),
		lightghost: utils.createGhostColorset(
			'spec.grey10',
			'white',
			'spec.grey30',
		),
		lighttext: utils.createTextColorset(
			'spec.grey10',
			'white',
			'spec.grey30',
		),
		grey: utils.createFlatColorset(
			'spec.white',
			'spec.white',
			'spec.white',
			'spec.grey50',
			'spec.grey40',
			'spec.grey60',
		),
		greyghost: utils.createGhostColorset(
			'spec.grey50',
			'spec.grey40',
			'spec.grey60',
		),
		greytext: utils.createTextColorset(
			'spec.grey50',
			'spec.grey40',
			'spec.grey60',
		),
		dark: utils.createFlatColorset(
			'spec.grey10',
			'white',
			'spec.grey30',
			'spec.grey90',
			'spec.grey80',
			'spec.grey70',
		),
		darkghost: utils.createGhostColorset(
			'spec.grey90',
			'spec.grey80',
			'spec.grey70',
		),
		darktext: utils.createTextColorset(
			'spec.grey90',
			'spec.grey80',
			'spec.grey70',
		),
		white: utils.createFlatColorset(
			'spec.grey90',
			'spec.grey80',
			'spec.grey70',
			'spec.white',
			'spec.white',
			'spec.white',
		),
		whiteghost: utils.createGhostColorset(
			'spec.white',
			'spec.white',
			'spec.white',
		),
		whitetext: utils.createTextColorset(
			'spec.white',
			'spec.white',
			'spec.white',
		),
	},
);

const colorsPartial = {
	success: colors['green40'],
	successplus: colors['green30'],
	successminus: colors['green50'],
	warning: colors['yellow40'],
	warningplus: colors['yellow30'],
	warningminus: colors['yellow50'],
	error: colors['red50'],
};

/**
 * The default app theme with light blue colors.
 */
const grey = {
	name: 'Grey',
	colors: {
		spec: colors,
		text: Object.assign(
			{},
			colorsPartial,
			{
				primary: colors['grey80'],
				primaryplus: colors['grey90'],
				primaryminus: colors['grey70'],
				primaryalt: colors['black'],
				primaryaltplus: colors['black'],
				primaryaltminus: colors['grey90'],
				secondary: colors['grey60'],
				secondaryplus: colors['grey70'],
				secondaryminus: colors['grey50'],
				tertiary: colors['grey10'],
				tertiaryplus: colors['white'],
				tertiaryminus: colors['grey20'],
				accent: colors['blue30'],
				accentplus: colors['blue20'],
				accentminus: colors['blue40'],
				errorplus: colors['red30'],
				errorminus: colors['red80'],
				contrast: colors['white'],
			},
		),
		bg: Object.assign(
			{},
			colorsPartial,
			{
				primary: colors['grey10'],
				primaryplus: colors['white'],
				primaryminus: colors['grey20'],
				primaryalt: colors['grey20'],
				primaryaltplus: colors['grey10'],
				primaryaltminus: colors['grey30'],
				secondary: colors['grey30'],
				secondaryplus: colors['grey20'],
				secondaryminus: colors['grey40'],
				tertiary: colors['blue60'],
				tertiaryplus: colors['blue50'],
				tertiaryminus: colors['blue80'],
				accent: colors['yellow40'],
				accentplus: colors['yellow10'],
				accentminus: colors['yellow70'],
				errorplus: colors['red40'],
				errorminus: colors['red70'],
				contrast: colors['grey10'],
			},
		),
	},
	fonts,
	sizes: defaultTheme.sizes,
	shapes: defaultTheme.shapes,
	shadowsText: defaultTheme.shadowsText,
	shadows: defaultTheme.shadows,
	borders: defaultTheme.borders,
	colorSets,
};
