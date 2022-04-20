
# Mobility and Climate Change

OdG.m is a Matlab code to compute power consumption and energy use of various terrestrial mobility systems like (bike, vae, stand-up scooter, cars, trucks, ...). It has been developed for the course : V.G. Chapin & C. Leonard, Order of Magnitude Physics in a transition world, ISAE-SUPAERO Course : https://lms.isae.fr/course/view.php?id=2978

SolarBoost, a Zero Fossil-Fuel Mobility Project, ISAE-SUPAERO, www.solarboost.fr

Energetic performances of various vehicles obtained with this software are given in the Figure below:

<img width="1048" alt="OdG_MT" src="https://user-images.githubusercontent.com/18681171/115713843-bef30c80-a376-11eb-8494-61eeb8528bc5.png">

# Aim of OdG.m

To compute order of magnitude of energy, power, battery size, ... for any Terrestrial Vehicles (Cars, Bikes, Velomobile, ...) to move at a given speed.

# Running

To run this code, you just need to have MATLAB or an opensource version of it like Octave. Syntax is as follow:

**[Efsd,P] = OdG(p,m,SCd,mu,eta,eb,Ppv,Vmax,Pmax,name)**

With :
**Efsd**  the energy efficiency [Wh/km]

**P**     the power consumption [W]

**p**     the road slope [%]

**m**     the mass [kg]

**SCd**   the aerodynamic area [m2]

**mu**    the friction coefficient (tire on road)

**eta**   the engine efficiency

**eb**    the energy contained in the reservoir [Wh]

**Ppv**   the power of photovoltaïc cells installed [W]

**Vmax**  the range of speed considered for figures [km/h]

**Pmax**  the range of power considered for figures [W]

**name**  the name for legends on figures

# Example

You want to compute the energy and power needed on a flat road (slope =0%) for a typical car of mass 1000 kg :

OdG(0,1000);

The first number is the flat road slope in % (a road of length 1000 meters and climbing 100 meters will have a slope p=10%=0.1).
The second number is the vehicle mass in kg. Other unspecified parameters will have typical values for thermal car (default values).

2 Figures are generated :

Fig1 : The power needed versus the speed in km/h

Fig2 : The energy used per unit of distance Ef/d versus the speed in km/h

Hence, a typical thermal car of mass 1000 kg needs 500Wh/km of energy or 5L/100km of fuel at 100km/h and a power of 15 000 Watt.

<img width="300" alt="OdG_MT" src="https://user-images.githubusercontent.com/18681171/115712458-14c6b500-a375-11eb-8f61-bcd449094c12.png"> <img width="300" alt="OdG_MT" src="https://user-images.githubusercontent.com/18681171/115712480-1bedc300-a375-11eb-8d27-cb92293b85c8.png">

#If you want to compare a thermal and electric cars :

OdG(0,1000,1,0.013,0.3); OdG(0,1300,1,0.013,0.9);

**Thermal car** : m=1000kg, SCd=1m2, mu=0.013, eta=0.3

**EV car**      : m=1300kg, SCd=1m2, mu=0.013, eta=0.9

Both cars have same aerodynamic and rolling friction parameters (SCd,mu) but a higher mass is typical for EV (battery are heavier than fossil fuel) and the engine efficiency is typically 0.3 for thermal cars and 0.9 for EV.

The power needed is a little higher on EV because it is heavier but the final energy consumption is nearly 3 times lower with 200Wh/km for the EV and 550Wh/km for a thermal vehicle (5.5L/100km) because engine efficiency is higher.

<img width="300" alt="OdG_MT" src="https://user-images.githubusercontent.com/18681171/115712954-b9e18d80-a375-11eb-9bbe-3122fa06c10a.png"> <img width="300" alt="OdG_MT" src="https://user-images.githubusercontent.com/18681171/115712967-bf3ed800-a375-11eb-9c65-5bb8c94907f5.png">

**To compare an electric car with a 40kWh or 60kWh batteries** knowing that the specific weight of Li-Ion battery is 200Wh/kg :

OdG(0,1500,1,0.013,0.9,40000); OdG(0,1600,1,0.013,0.9,60000);

EV 40kWh : m=1500kg, SCd=1m2, mu=0.013, eta=0.9

EV 60kWh : m=1600kg, SCd=1m2, mu=0.013, eta=0.9

Both cars have same aerodynamic and rolling friction parameters (SCd,mu).

At 100km/h, the EV with 40kWh has a range 200km and the other one with 60kWh has 290km.

<img width="300" alt="OdG_MT" src="https://github.com/vikchaps/Zero-Fossil-Mobility/blob/main/EV_2batt.png">

** Evaluate VAE range at 25km/h with a 500Wh battery on a flat road (p=0%) or on a road of slope (p=3%)**

OdG(0,80+20,0.4,0.006,0.9,500);OdG(0.03,80+20,0.4,0.006,0.9,500);

A VAE with a 500Wh battery will have a range of 90km on a flat road (p=0%).

A VAE with a 500Wh battery will have a range of 30km on a road of slope p=3%



