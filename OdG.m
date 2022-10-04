function [Efsd,P]= OdG(p,m,SCd,mu,eta,eb,Ppv,Vmax,Pmax,name)


% p     [%]     road slope
% m     [kg]    total mass of the mobility system
% SCd   [m2]    frontal area * Drag coeff. of the mobility system
% mu            or Cr : coeff. of ground friction on the road
% eta           engine efficiency
% eb    [Wh]    battery energy
% Ppv   [W]     power of solar panels
% Vmax  [km/h]  generate V = [0,..,Vmax]
% Pmax  [W]     generate V = [0,..,Pmax]

% Efsd  [Wh/km] energy efficiency
% P     [W]     power consumption

if nargin == 1 % typical thermal car
    m=1500;SCd=1.8*1.6*0.3;mu=0.013;eta=0.3;eb=0;Ppv=0;Vmax=130;Pmax=inf;name='';
end
if nargin == 2
    SCd=1.8*1.6*0.3;mu=0.013;eta=0.3;eb=0;Ppv=0;Vmax=130;Pmax=inf;name='Typical Thermal car';
end
if nargin == 3
    mu=0.013;eta=0.3;eb=0;Ppv=0;Vmax=130;Pmax=inf;name='Typical Thermal car';
end
if nargin == 4
    eta=0.3;eb=0;Ppv=0;Vmax=130;Pmax=inf;name='Typical Thermal car';
end
if nargin == 5
    eb=0;Ppv=0;Vmax=130;Pmax=inf;name='Typical Thermal car';
end
if nargin == 6
    Ppv=0;Vmax=130;Pmax=inf;name='Typical Thermal car';
end
if nargin == 7
    Vmax=130;Pmax=inf;name='Typical Thermal car';
end
if nargin == 8
    Pmax=inf;name='Typical Thermal car';
end
if nargin == 9
    name='Typical Thermal car';
end

g   = 9.8;      % [m/s2]    gravitational constant on earth
rho = 1.2;      % [kg/m3]   air density
Epsb = 200;     % [Wh/kg]   specific energy in Li-Ion battery

%V       = [1 5 10 15 20 25 30 35 40 45 50 ]/3.6; % [m/s] Low Speed
%V       = [1 5 10 15 20 25 30 35 40 45 50 52 55 60 65 70 75 80 90 100 110 120 130]/3.6; % [m/s] Speed
%V       = [1 5 10 15 20 25 30 35 40 45 50 52 55 60 65 70 75 80 90 100 110 120 130 150 180 210 240]/3.6; % [m/s] Speed
V = linspace(0,Vmax,2*(Vmax+1))/3.6; % [m/s]

t       = 1./(V.*3.6); % V in m/s, t in hours

Ppvv    = Ppv .* ones(1,length(V));

Ppvv    = 0.8*Ppvv;    % Pertes electriques

for i = 1 : length(V)
    Pr     = mu*m*g.*V;                 % Rolling     Power
    Pa     = 0.5*rho*V.^3.*SCd;         % Aerodynamic Power
    Pg     = p*m*g.*V;                  % Gravity     Power
    P      = Pr + Pa + Pg;              % Mechanical  Power consumption
    Pe     = P/eta;                     % Effective   Power consumption
    Ph     = Pe - Ppvv;                 % Human       Power consumption
    Efsd   = max(Pe,0).*t;              % Total       Energy consumption (stock-flux)
    Efhsd  = max(Ph,0).*t;              % Human       Energy consumption (stock-flux)
    Range  = eb ./ Efsd;                % Autonomie
    %if eta>0.7 then % EV si eta>0.7
    kg     = eb/Epsb ./ Range * 100;    % kg batt. / 100km
    %else            % Th si eta<0.7
    %    L100   = eb/12000 ./ Range * 100;   % L/100km
    %end
end

% Take only elements that have P<Pmax
iend  = max(find(Ph<Pmax));
Ph    = mink(Ph    ,iend);
V     = mink(V     ,iend);
Efhsd = mink(Efhsd ,iend);
Range = maxk(Range ,iend);
kg    = mink(kg    ,iend);

% Plot Fig P/pass = f(V)
%if nargout == 2 % Power fig is required
figure(1);plot(V*3.6,Ph,'linewidth',2);hold on;xlabel('V [km/h]');ylabel('Ph [W]');grid on;
%end

% Plot Fig Ef/d   = f(V)
x=V*3.6; y=Efhsd;
figure(2);plot(x,y,'linewidth',2);hold on;xlabel('V [km/h]');ylabel('Efh/d [Wh/km]');text(x(end),y(end),name);grid on;%legend(name);

% Plot Fig Range = f(V)
if not(eb==0) % eb is given, Range may be computed
figure(3);plot(V*3.6,Range,'linewidth',2);hold on;xlabel('V [km/h]');ylabel('Range [km]');
end
