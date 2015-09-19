close all
clear all
clc
addpath('export_fig');
input_dir='./Analysis/';
out=dir([input_dir '*.csv']);

X={'Edd','Gad','Kgu','Zwf'};
Y={'1','5','10','20'};
styles={'o-','^-','x-','s-'};
colors=linspecer(4);

table_mean=zeros(length(X),length(Y));
table_std=zeros(length(X),length(Y));


odes=[];
intensities=[];

for i=1:length(out)
    
    % Parsing
    filename=out(i).name;
    
    disp(filename);
    
    [promoter,glucose]=parseFilename_mcherry(filename);
    filePath=[input_dir filename];
    
    % Load data
    disp(filePath);
    row=2;
    col=1;
    data=csvread(filePath,row,col);
    
    % Save data
    x=find(strcmp(X, promoter));
    y=find(strcmp(Y, glucose));
    table_mean(x,y)=mean(data(:,2));
    table_std(x,y)=std(data(:,2));
end

for promoter=X
    x=find(strcmp(X, promoter));
    subplot(2,2,x);
    h=errorbar([1 5 10 20],table_mean(x,:),table_std(x,:),styles{x},'MarkerSize',10);
    set(h,'Color',colors(x,:));
    set(h,'LineWidth',2);
    set(gca,'FontSize',14);
    xlim([0 21]);
    title(promoter)
    xlabel('Glucose (%)');
    ylabel('Fluorescence per cell (a. u.)');
    grid on;
end
saveFigure(gcf,'Capsule microscopy');