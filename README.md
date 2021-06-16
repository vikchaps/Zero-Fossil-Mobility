
# Mobility and Climate Change

ISAE-SUPAERO Course Physics of Order of Magnitude in a transition world : https://lms.isae.fr/course/view.php?id=2978

ISAE-SUPAERO Zero Fossil-Fuel Mobility Project : SolarBoost Web Site : www.solarboost.fr

Energetic performances of various mobility systems obtained with this very simple software is given in the Figure below:

<img width="1048" alt="OdG_MT" src="https://user-images.githubusercontent.com/18681171/115713843-bef30c80-a376-11eb-8494-61eeb8528bc5.png">

# Aim of OdG.m

To compute order of magnitude of energy, power, battery size, ... for any Terrestrial Vehicles (Cars, Bikes, Velomobile, ...) to move at a given speed.

# Running

To use this code, you just need to have MATLAB or an opensource version like Octave.

# Example

You want to compute the energy and power needed on a flat road (slope =0%) without wind (Vw=0km/h) for a vehicle of mass 1000 kg :

OdG(0,0,1000);

The first 0 is for road slope in % (a road of length 1000 meters and climbing 100 meters will have a slope p=10%=0.1).
The second 0 is for wind speed in km/h if any.
The third parameter is the vehicle mass in kg.

2 Figures are generated :

Fig1 : The energy used per unit of distance Ef/d versus the speed in km/h

Fig2 : The power needed versus the speed in km/h

On this first example you will obtain that a typical vehicle (thermal one) of mass 1000 kg needs 500Wh/km or 5L/100km of fuel at 100km/h and a power of 15000 W.

![P](https://user-images.githubusercontent.com/18681171/115712458-14c6b500-a375-11eb-8f61-bcd449094c12.png)
![P2](https://user-images.githubusercontent.com/18681171/115712480-1bedc300-a375-11eb-8d27-cb92293b85c8.png)

If you want to compare a typical thermal car and an electric car :

OdG(0,0,1000,1,0.013,0.3);
OdG(0,0,1300,1,0.013,0.9);

Thermal car : m=1000kg, SCd=1m2, mu=0.013, eta=0.3

EV car      : m=1300kg, SCd=1m2, mu=0.013, eta=0.9

Both cars have same aerodynamic and rolling friction parameters (SCd,mu) but a higher mass is typical for EV (battery heavier than fuel) and the engine efficiency is typically 0.3 for thermal cars and 0.9 for EV.

Hence you see that the power needed is a little higher on EV but the energy consumption is nearly 3 times lower.

![E12](https://user-images.githubusercontent.com/18681171/115712954-b9e18d80-a375-11eb-9bbe-3122fa06c10a.png)
![E11](https://user-images.githubusercontent.com/18681171/115712967-bf3ed800-a375-11eb-9c65-5bb8c94907f5.png)
