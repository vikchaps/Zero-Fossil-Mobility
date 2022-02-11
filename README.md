
# Mobility and Climate Change

ISAE-SUPAERO Course Physics of Order of Magnitude in a transition world : https://lms.isae.fr/course/view.php?id=2978

ISAE-SUPAERO Zero Fossil-Fuel Mobility Project : SolarBoost Web Site : www.solarboost.fr

Energetic performances of various vehicles obtained with this simple software is given in the Figure below:

<img width="1048" alt="OdG_MT" src="https://user-images.githubusercontent.com/18681171/115713843-bef30c80-a376-11eb-8494-61eeb8528bc5.png">

# Aim of OdG.m

To compute order of magnitude of energy, power, battery size, ... for any Terrestrial Vehicles (Cars, Bikes, Velomobile, ...) to move at a given speed.

# Running

To use this code, you just need to have MATLAB or an opensource version like Octave.

# Example

You want to compute the energy and power needed on a flat road (slope =0%) without wind (Vw=0km/h) for a vehicle of mass 1000 kg :

OdG(0,0,1000);

The first 0 is the flat road slope in % (a road of length 1000 meters and climbing 100 meters will have a slope p=10%=0.1).
The second 0 is the wind speed in km/h.
The third parameter is the vehicle mass in kg.
Other parameters are typical values for thermal vehicle.

2 Figures are generated :

Fig1 : The power needed versus the speed in km/h

Fig2 : The energy used per unit of distance Ef/d versus the speed in km/h

Hence, a typical thermal vehicle of mass 1000 kg needs 500Wh/km of energy or 5L/100km of fuel at 100km/h and a power of 15000 Watt.

<img width="300" alt="OdG_MT" src="https://user-images.githubusercontent.com/18681171/115712458-14c6b500-a375-11eb-8f61-bcd449094c12.png"> <img width="300" alt="OdG_MT" src="https://user-images.githubusercontent.com/18681171/115712480-1bedc300-a375-11eb-8d27-cb92293b85c8.png">

#If you want to compare a thermal car and an electric car :

OdG(0,0,1000,1,0.013,0.3); OdG(0,0,1300,1,0.013,0.9);

Thermal car : m=1000kg, SCd=1m2, mu=0.013, eta=0.3
EV car      : m=1300kg, SCd=1m2, mu=0.013, eta=0.9

Both cars have same aerodynamic and rolling friction parameters (SCd,mu) but a higher mass is typical for EV (battery heavier than fuel) and the engine efficiency is typically 0.3 for thermal cars and 0.9 for EV.

The power needed is a little higher on EV because it is heavier here but the energy consumption is nearly 3 times lower with 200Wh/km for the EV and 550Wh/km for a thermal vehicle (5.5L/100km) because its engine efficiency is higher. EV consumes less energy and produce very low CO2 emissions compared to a thermal car.

<img width="300" alt="OdG_MT" src="https://user-images.githubusercontent.com/18681171/115712954-b9e18d80-a375-11eb-9bbe-3122fa06c10a.png"> <img width="300" alt="OdG_MT" src="https://user-images.githubusercontent.com/18681171/115712967-bf3ed800-a375-11eb-9c65-5bb8c94907f5.png">

#To compare an electric car with a 40kWh or 60kWh batteries knowing that the specific weight of Li-Ion battery is 200Wh/kg :

OdG(0,0,1500,1,0.013,0.9,40000); OdG(0,0,1600,1,0.013,0.9,60000);

EV 40kWh : m=1500kg, SCd=1m2, mu=0.013, eta=0.9
EV 60kWh : m=1600kg, SCd=1m2, mu=0.013, eta=0.9

Both cars have same aerodynamic and rolling friction parameters (SCd,mu).

At 100km/h, the EV with 40kWh has a range 200km and the other one with 60kWh has 290km.

<img width="300" alt="OdG_MT" src="https://github.com/vikchaps/Zero-Fossil-Mobility/blob/main/EV_2batt.png">

