% Example of use of function [Efsd,P]= OdG(p,m,SCd,mu,eta,eb,Ppv,Vmax,Pmax,name)


% Objective : compute energy use and power required for a mobility at a given speed

% Energy by unit distance Ef/d will be expressed in [Wh/km]
% For useful comparisons remenber that 100Wh/km = 1L/100km

cas = 3;

switch cas
    case 1
        OdG(0,1000);                    % select a flat road p=0%, a typical thermal car of mass m = 1000kg (by default S=1.8*1.6m2, Cd=0.3, Cr=0.013, eta=0.3)
    case 2
        OdG(0,1000,3*0.33,0.013,0.9);   % select a flat road, a typical electric car of mass = 1000kg SCd=3*0.33m2, Cr=0.013, eta=0.9
    case 3 % compare both cars
        OdG(0,1000);                    % select a flat road p=0%, a typical thermal car of mass m = 1000kg (by default S=1.8*1.6m2, Cd=0.3, Cr=0.013, eta=0.3)
        OdG(0,1000,3*0.33,0.013,0.9);   % select a flat road, a typical electric car of mass = 1000kg SCd=3*0.33m2, Cr=0.013, eta=0.9
end