class Article < ActiveRecord::Base
# shirt type options for dropdown
	SHIRT_TYPES = ['tshirt', 'v-neck', 'sweatshirt', 'sweatpants', 'blanket', 'zip-up']
	SHIRT_SIZES = ['small', 'medium', 'large', 'x-large', '2xl', '3xl']
	LETTER_OPTIONS = [
		'alpha',
		'beta',
		'gamma',
		'delta',
		'epsilon',
		'zeta',
		'eta',
		'theta',
		'iota',
		'kappa',
		'lambda',
		'mu',
		'nu',
		'xi',
		'omicron',
		'pi',
		'rho',
		'sigma',
		'tau',
		'upsilon',
		'phi',
		'chi',
		'psi',
		'omega',
	]

	POSITION_OPTIONS = ['top', 'bottom']
end