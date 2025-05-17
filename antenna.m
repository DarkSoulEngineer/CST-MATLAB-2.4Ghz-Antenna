% Antenna Design for 2.4 GHz
% Author: xdarksoulEngineer
% Date: 16.05.2025

% === Add CST Studio to MATLAB Path ===
addpath('./CST-MATLAB-API');

addpath('./CST-MATLAB-API/Postprocessing');
addpath('./CST-MATLAB-API/Simulation')    ;
addpath('./CST-MATLAB-API/Materials')     ;
addpath('./CST-MATLAB-API/Modeling')      ;
addpath('./CST-MATLAB-API/Home')          ;

% === Simulation Parameters === 
startFreq  = 2.4   ; % 2.4Ghz
endFreq    = 2.4835; % 2.4835 Ghz
samples    = 201   ; % 201 frequency points

% === Antenna Dimensions ===
L1 = 3940;
L2 = 2700;
L3 = 5000;
L4 = 2640;
L5 = 2000;
L6 = 4900;
W1 =  900;
W2 =  500;
D1 =  500;
D2 =  300;
D3 =  300;
D4 =  500;
D5 = 1400;
D6 = 1700; 

Antenna_Height = 160  ;
PCB_Height     = 20000;
DPos_Z         = 200  ;
Zero           = 0    ;

% === Create CST Studio ===
cst = actxserver('CSTStudio.application');
mws = cst.invoke('NewMWS')               ;

% === Units ===
TemperatureUnit  = 'Celsius';
Capacitance      = 'PikoF'  ;
Inductance       = 'NanoH'  ;
Conductance      = 'S'      ;
Resistance       = 'Ohm'    ;
Frequency        = 'GHz'    ;
Geometry         = 'um'     ;
Voltage          = 'V'      ;
Current          = 'A'      ;
Time             = 'ns'     ;

CstDefineUnits(mws, Geometry, Frequency, Time, TemperatureUnit, Voltage, Current, Resistance, Conductance, Capacitance, Inductance);

ComponentList = 'component1'             ;
CstDefineFrequencyRange(mws, 2.4, 2.4835); % (2.4-2.4835 GHz) ISM Band
CstMeshInitiator(mws)                    ;

% === Boundary Conditions ===
min_frequency = 2.4;

Xmin =     'open'  ;
Xmax =     'open'  ;
Ymin = 'electric'  ;
Ymax = 'electric'  ;
Zmin =     'open'  ;
Zmax =     'open'  ;

CstDefineOpenBoundary(mws, min_frequency, Xmin, Xmax, Ymin, Ymax, Zmin, Zmax);

% === Antenna Description ===
CstCopperAnnealedLossy(mws)    ;    % Constant
component = 'Antenna_component';    % Constant
material = 'Copper (annealed)' ;    % Constant

Name = 'Part1_Antenna';

Xrange = [Zero   W1                   ];
Yrange = [Zero   L6-D4                ];
Zrange = [DPos_Z DPos_Z+Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Antenna Part

Name = 'Part2_Antenna';

Xrange = [Zero   L3                   ];
Yrange = [L6-D4  L6-D4+W2             ];
Zrange = [DPos_Z DPos_Z+Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Antenna Part

Name = 'Part3_Antenna';

Xrange = [W1+D5  W1+D5+W2             ];
Yrange = [Zero   L6-D4                ];
Zrange = [DPos_Z DPos_Z+Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Antenna Part

Name = 'Part4_Antenna';

Xrange = [L3-W2  L3                   ];
Yrange = [L6-D4  L6-D4-L4             ];
Zrange = [DPos_Z DPos_Z+Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Antenna Part

Name = 'Part5_Antenna';

Xrange = [L3       L3+L5                ];
Yrange = [L6-D4-L4 L6-D4-L4+W2          ];
Zrange = [DPos_Z   DPos_Z+Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Antenna Part

Name = 'Part6_Antenna';

Xrange = [L3+L5 L3+L5+W2];
Yrange = [L6-D4-L4 L6-D4];
Zrange = [DPos_Z DPos_Z+Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Antenna Part

Name = 'Part7_Antenna';

Xrange = [L3+L5  L3+L5+L2             ];
Yrange = [L6-D4  L6-D4+W2             ];
Zrange = [DPos_Z DPos_Z+Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Antenna Part

Name = 'Part8_Antenna';

Xrange = [L3+L5+L2-W2 L3+L5+L2             ];
Yrange = [L6-D4-L4    L6-D4                ];
Zrange = [DPos_Z      DPos_Z+Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Antenna Part

Name = 'Part9_Antenna';

Xrange = [L3+L5+L2 L3+2*L5+L2           ];
Yrange = [L6-D4-L4 L6-D4-L4+W2          ];
Zrange = [DPos_Z   DPos_Z+Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Antenna Part

Name = 'Part10_Antenna';

Xrange = [L3+2*L5+L2 L3+2*L5+L2+W2        ];
Yrange = [L6-D4-L4   L6-D4                ];
Zrange = [DPos_Z     DPos_Z+Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Antenna Part

Name = 'Part11_Antenna';

Xrange = [L3+2*L5+L2 L3+2*L5+2*L2         ];
Yrange = [L6-D4      L6-D4+W2             ];
Zrange = [DPos_Z     DPos_Z+Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Antenna Part

Name = 'Part12_Antenna';

Xrange = [L3+2*L5+2*L2-W2 L3+2*L5+2*L2         ];
Yrange = [L6-D4-L1        L6-D4                ];
Zrange = [DPos_Z          DPos_Z+Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Antenna Part

% ===  Dielectric (PCB) ===
component = 'PCB_component'           ;    % Constant

CstBlackTeflon(mws)                ;    % Teflon (Black) (lossy)
material = 'Teflon (Black) (lossy)';    % Teflon (Black) (lossy)

Name = 'Dielectric_PCB_TOP';

Xrange = [-D1   L3+2*L5+2*L2+D3];
Yrange = [ Zero L6-D4+W2+D4    ];
Zrange = [ Zero DPos_Z];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Dielectric (PCB)

CstPCBTeflon(mws)                ;      % Teflon (PCB)
material = 'Teflon (PCB) (lossy)';      % Teflon (PCB)

Name = 'Dielectric_PCB_BOTTOM_Part1';  

Xrange = [-D1    L3+2*L5+2*L2+D3];
Yrange = [-D4   -PCB_Height     ];
Zrange = [ Zero  DPos_Z         ];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Dielectric (PCB)

Name = 'Dielectric_PCB_BOTTOM_Part2';  

Xrange = [-D1 Zero      ];
Yrange = [-D4 Zero      ];
Zrange = [ Zero   DPos_Z];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Dielectric (PCB)

Name = 'Dielectric_PCB_BOTTOM_Part3'; 

Xrange = [ W1   L3+2*L5+2*L2+D3];
Yrange = [-D4   Zero           ];
Zrange = [ Zero DPos_Z         ];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Dielectric (PCB)

% ===  Antenna (PCB) ===
CstCopperAnnealedLossy(mws)   ;         % Copper (annealed)
material = 'Copper (annealed)';         % Copper (annealed)

Name = 'PCB_Antenna_Part1'    ;         

Xrange = [ Zero           W1                   ];
Yrange = [-D4             Zero                 ];
Zrange = [-Antenna_Height DPos_Z+Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Antenna Part

Name = 'PCB_Antenna_Part2';

Xrange = [ W1+D5  W1+D5+W2];
Yrange = [-D4     Zero                 ];
Zrange = [ DPos_Z DPos_Z+Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Antenna Part

% ===  Antenna GROUND (PCB) ===
CstFR4lossy(mws)         ;         % Copper (annealed)
material = 'FR-4 (lossy)';         % Copper (annealed)

Name = 'Dielectric_PCB_BOTTOM_Ground';  

Xrange = [ Zero  L3+2*L5+2*L2  ];
Yrange = [-D1   -PCB_Height+D1 ];
Zrange = [ Zero -Antenna_Height];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange); %  Dielectric (PCB)

% === Ports ===
PortNumber = 1;
Xrange = [ W1+D5  W1+D5+W2             ];
Yrange = [-D1     Zero                 ];
Zrange = [ DPos_Z DPos_Z+Antenna_Height];

XrangeAdd = [0 0];
YrangeAdd = [0 0];
ZrangeAdd = [0 0];

Coordinates = 'Free';
Orientation = 'ymax';
CstWaveguidePort(mws, PortNumber, Xrange, Yrange, Zrange, XrangeAdd, YrangeAdd, ZrangeAdd, Coordinates, Orientation);

% === Save Project ===
project_name = 'Antenna_2.4GHz.cst';
CstSaveAsProject(mws, project_name);

% === Post-Processing ===
CstDefineFrequencyRange(mws, 2.4, 2.8);                           % Define Frequency Range
CstDefineFrequencydomainSolver(mws, startFreq, endFreq, samples); % Frequency domain solver

FarfieldName = 'Farfield';
frequency    = 2.4       ;
CstDefineFarfieldMonitor(mws,FarfieldName, frequency);            % Farfield Processor

export_path = './OUTPUT/s_param.txt'  ;                           % Export S-Parameters
CstExportSparametersTXT(mws, export_path);                           % Export S-Parameters