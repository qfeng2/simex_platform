from SimEx import PhysicalQuantity, ureg
from scipy.constants import e,c,hbar
from math import pi

# Base units.
meter           = PhysicalQuantity(1.0, 'meter')
second          = PhysicalQuantity(1.0, 'second')
kilogram        = PhysicalQuantity(1.0, 'kilogram')
ampere          = PhysicalQuantity(1.0, 'ampere')
volt            = PhysicalQuantity(1.0, 'volt')
joule           = PhysicalQuantity(1.0, 'joule')
newton          = PhysicalQuantity(1.0, 'newton')
kelvin          = PhysicalQuantity(1.0, 'kelvin')
radian          = PhysicalQuantity(1.0, 'radian')
degree          = PhysicalQuantity(pi/180., 'radian')
electronvolt    = PhysicalQuantity(1.0, 'eV')
coulomb         = PhysicalQuantity(1.0, 'C')

# Prefixes
zepto   =   1.0e-21
atto    =   1.0e-18
femto   =   1.0e-15
pico    =   1.0e-12
nano    =   1.0e-9
micro   =   1.0e-6
milli   =   1.0e-3
centi   =   1.0e-2
deci    =   1.0e-1
kilo    =   1.0e+3
mega    =   1.0e+6
giga    =   1.0e+9
tera    =   1.0e+12
peta    =   1.0e+15
exa     =   1.0e+18


# Non standard SI units
gram = milli*kilogram

