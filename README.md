# Mobility-Climate-Change

ISAE-SUPAERO Course related to these developmements : https://lms.isae.fr/course/view.php?id=2978

ISAE-SUPAERO Zero Fossil-Fuel Mobility Project : SolarBoost Web Site : www.solarboost.fr

# Aim of OdG.m

To compute order of magnitude of energy, power, battery size, etc is needed for any Terrestrial Vehicles (Cars, Bikes, Velomobile, ...) to move at a given speed.

# Running

To use this code, you just need to have MATLAB or an opensource version like Octave.

# Example

You want to compute the order of magnitude energy and power of a vehicle of mass 1000 kg :

OdG(0,0,1000);

The first 0 is for road slope in % (a road of length 1000 meters and climbing 100 meters will have a slope p=10%=0.1).
The second 0 is for wind speed if any.
The third parameter is the vehicle mass.

2 Figures are generated :

Fig1 : The energy used per unit of distance Ef/d versus the speed in km/h
Fig2 : The power needed versus the speed in km/h

On this first example you will obtain that a typical vehicle (thermal one) of mass 1000 kg needs 500Wh/km or 5L/100km of fuel at 100km/h and a power of 15000 W.

