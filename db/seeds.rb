# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Front
alpha = Letter.create(name: 'alpha' , position: 'top', color: 'black')
alpha1 = Letter.create(name: 'alpha' , position: 'top', color: 'white')
alpha2 = Letter.create(name: 'alpha' , position: 'top', color: 'shark_teal')
alpha3 = Letter.create(name: 'alpha' , position: 'top', color: 'orange')
alpha4 = Letter.create(name: 'alpha' , position: 'top', color: 'gold glitter')
alpha5 = Letter.create(name: 'alpha' , position: 'top', color: 'silver glitter')
alpha6 = Letter.create(name: 'alpha' , position: 'top', color: 'pink glitter')

beta = Letter.create(name: 'beta' , position: 'top', color: 'black')
beta1 = Letter.create(name: 'beta' , position: 'top', color: 'white')
beta2 = Letter.create(name: 'beta' , position: 'top', color: 'shark_teal')
beta3 = Letter.create(name: 'beta' , position: 'top', color: 'orange')
beta4 = Letter.create(name: 'beta' , position: 'top', color: 'gold glitter')
beta5 = Letter.create(name: 'beta' , position: 'top', color: 'silver glitter')
beta6 = Letter.create(name: 'beta' , position: 'top', color: 'pink glitter')

gamma = Letter.create(name: 'gamma' , position: 'top', color: 'black')
gamma1 = Letter.create(name: 'gamma' , position: 'top', color: 'white')
gamma2 = Letter.create(name: 'gamma' , position: 'top', color: 'shark_teal')
gamma3 = Letter.create(name: 'gamma' , position: 'top', color: 'orange')
gamma4 = Letter.create(name: 'gamma' , position: 'top', color: 'gold glitter')
gamma5 = Letter.create(name: 'gamma' , position: 'top', color: 'silver glitter')
gamma6 = Letter.create(name: 'gamma' , position: 'top', color: 'pink glitter')

delta = Letter.create(name: 'delta' , position: 'top', color: 'black')
delta1 = Letter.create(name: 'delta' , position: 'top', color: 'white')
delta2 = Letter.create(name: 'delta' , position: 'top', color: 'shark_teal')
delta3 = Letter.create(name: 'delta' , position: 'top', color: 'orange')
delta4 = Letter.create(name: 'delta' , position: 'top', color: 'gold glitter')
delta5 = Letter.create(name: 'delta' , position: 'top', color: 'silver glitter')
delta6 = Letter.create(name: 'delta' , position: 'top', color: 'pink glitter')




beta = Letter.create(name: 'beta' , position: 'top', color: 'gold glitter')
gamma = Letter.create(name: 'gamma' , position: 'top', color: 'black')
delta = Letter.create(name: 'delta', position: 'top', color: 'gold glitter')
epsilon = Letter.create(name: 'epsilon' , position: 'top', color: 'black')
zeta = Letter.create(name: 'zeta' , position: 'top', color: 'white')
eta = Letter.create(name: 'eta' , position: 'bottom', color: 'white')
theta = Letter.create(name: 'theta' , position: 'top', color: 'black')
iota = Letter.create(name: 'iota' , position: 'top', color: 'pink glitter')
kappa = Letter.create(name: 'kappa' , position: 'bottom', color: 'white')
lambda = Letter.create(name: 'lambda' , position: 'top', color: 'gold glitter')
mu = Letter.create(name: 'mu' , position: 'top', color: 'white')
nu = Letter.create(name: 'nu' , position: 'top', color: 'pink glitter')
xi = Letter.create(name: 'xi' , position: 'top', color: 'gold glitter')
omicron = Letter.create(name: 'omicron' , position: 'top', color: 'black')
pi = Letter.create(name: 'pi' , position: 'bottom', color: 'navy')
rho = Letter.create(name: 'rho' , position: 'top', color: 'white')
sigma = Letter.create(name: 'sigma' , position: 'top', color: 'navy')
tau = Letter.create(name: 'tau' , position: 'top', color: '')
upsilon = Letter.create(name: 'upsilon' , position: 'top', color: 'white')
phi = Letter.create(name: 'phi' , position: 'top', color: 'white')
chi = Letter.create(name: 'chi' , position: 'bottom', color: 'navy')
psi = Letter.create(name: 'psi' , position: 'top', color: 'pink glitter')
omega = Letter.create(name: 'omega' , position: 'top', color: 'pink glitter')

delta = Letter.create(name: 'delta', position: 'bottom', color: 'gold glitter')
epsilon = Letter.create(name: 'epsilon' , position: 'bottom', color: 'black')
zeta = Letter.create(name: 'zeta' , position: 'bottom', color: 'white')
theta = Letter.create(name: 'theta' , position: 'bottom', color: 'black')
tau = Letter.create(name: 'tau' , position: 'bottom', color: '')
upsilon = Letter.create(name: 'upsilon' , position: 'bottom', color: 'white')
phi = Letter.create(name: 'phi' , position: 'bottom', color: 'white')

chi = Letter.create(name: 'chi' , position: 'top', color: 'navy')
eta = Letter.create(name: 'eta' , position: 'top', color: 'white')


# Items
Item.create(item_type: 'tshirt', color: 'black', size: 'small' )
Item.create(item_type: 'tshirt', color: 'black', size: 'medium' )
Item.create(item_type: 'tshirt', color: 'black', size: 'large' )
Item.create(item_type: 'vneck', color: 'white', size: 'large' )
Item.create(item_type: 'vneck', color: 'white', size: 'medium' )


