% http://www.nt.ntnu.no/users/skoge/prost/proceedings/acc05/PDFs/Papers/0074_WeA13_1.pdf

close all
clear
clc
rendering_only=false; % Set to true if no binding energy is to be calculated


tic();

Ns=20;
ks=1:Ns;

%% Geometry parameters
% Bacteria
R_bac=1e-6;
R_zinc=15e-10;
q_zinc=2*1.60217662e-19; % xxx
R_armBead=1.5*340e-12; 
L_arms=linspace(150*340e-12,1500*340e-12,Ns);
q_armBead=-2*1.60217662e-19; % xxx

if rendering_only
    R_armBead=10*R_armBead;
    L_arms=10*L_arms;
    R_zinc=10*R_zinc;
end

% Number of fingers
N_zinc=200;

% Real gas constant
R0=8.3144598;
T=300;



    
%% Palette
palette=linspecer(8);
DGs=[];
for k=ks

    
    % Zinc fingers
    [x_f,y_f,z_f]=rand_pick_sphere(N_zinc,2*R_bac,2*R_bac+2*R_zinc);

    %% Geometry structure
    L_arm=L_arms(k); 

    % Bacteria
    objects={};
    object.radius=R_bac;
    object.center=[0 0 0];
    object.color=palette(2,:);
    object.nPoints=40;
    object.charge=0;
    objects=[objects, object];

    % Fingers
    for n=1:N_zinc
        object.radius=R_zinc;
        object.center=[x_f(n) y_f(n) z_f(n)];
        object.color=palette(1,:);
        object.nPoints=8;
        object.charge=q_zinc;
        objects=[objects, object];
    end

    % Arm
    system_1=objects;
    vector=objects{2}.center;
    dR=2*objects{2}.radius;
    x_v=vector(1);
    y_v=vector(2);
    z_v=vector(3);
    r=norm(vector);
    theta=acos(z_v/norm(vector));
    phi=atan2(y_v,x_v);
    objects={};
    for n=1:floor(L_arm/R_armBead)
        object.color=palette(4,:);
        D=2*R_armBead+eps();
        object.center=[x_v+dR*sin(theta)*cos(phi)+n*D*sin(theta)*cos(phi)...
            y_v+dR*sin(theta)*sin(phi)+n*D*sin(theta)*sin(phi)...
            z_v+dR*cos(theta)+n*D*cos(theta)...
            ];
        object.nPoints=10;
        object.radius=R_armBead;
        object.charge=q_armBead;
        objects=[objects, object];
    end
    system_2=objects;

    system_all=[system_1, system_2];
    objects=system_all;

    if ~rendering_only
        % Energies
        Gplus=freeEnergy([system_1, system_2]);
        Gminus=freeEnergy(system_1)+freeEnergy(system_2);
        DG=Gplus-Gminus
        DGs=[DGs,DG];
    end

end
toc();
if rendering_only
    renderSpheres(objects); 
else
    plot(L_arms/340e-12,DGs-DGs(end),'o-','LineWidth',2);
    grid on;
    xlabel('Arm length [bp]');
    ylabel('Relative free energy');
end
 
title('Randomly varied distribution of zinc fingers')
title('')