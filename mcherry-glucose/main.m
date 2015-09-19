close all
clear all
clc
colors=linspecer(4);
addpath('export_fig');


   global GKC_e; 

GKC_es=[1 5 10 20];

for k=1:4
    GKC_e=GKC_es(k);
    tic();
    TSOL=0.5;
    tspan=linspace(0,TSOL,1e4);
    x0=zeros(6,1);
    [t,x]=ode45(@Eqs,tspan,x0);
    toc();
    h=plot(t,x(:,6));
    hold on;
    set(h,'Color',colors(k,:));
    set(h,'LineWidth',2);
    set(gca,'FontSize',14);
    xlabel('Time');
    ylabel('Fluorescence per cell (a. u.)');
end

legend({'Glucose 1%','Glucose 5%','Glucose 10%','Glucose 20%'});

%%
grid on;
xlabel('Time (h)');
saveFigure(gcf,'Glucose-mCherry');