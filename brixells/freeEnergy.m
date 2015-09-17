function G=freeEnergy(objects)
    G=0;
    for m=1:length(objects)
        for n=1:length(objects)
            if m~=n 
                eps0=8.854187817e-12;
                epsr=88;
                eps_water=80.4;
                eps=epsr*eps0;
                A=6e-10; % xxx
                qm=objects{m}.charge;
                qn=objects{n}.charge;
                R_mn=norm(objects{m}.center-objects{n}.center);
                rho_m=norm(objects{m}.radius);
                rho_n=norm(objects{n}.radius);
                g_mn=R_mn/(4*rho_m*rho_n);
                f_mn=sqrt(R_mn^2+rho_m*rho_n*exp(-g_mn));
                S_mn=(1/eps0-1/eps)/(8*pi)*qm*qn/f_mn;
                V_mn=-(A/6)*(...
                    (2*rho_m*rho_n)/(R_mn^2-(rho_m+rho_n)^2)...
                    +(2*rho_m*rho_n)/(R_mn^2-(rho_m-rho_n)^2)...
                    +log((R_mn^2-(rho_m+rho_n)^2)/(R_mn^2-(rho_m-rho_n)^2))...
                    );
                E_mn=qm*qn/(8*pi*eps_water*R_mn^2);
                G_mn=E_mn+V_mn+S_mn;
                
                G=G+G_mn;
            end
        end
    end