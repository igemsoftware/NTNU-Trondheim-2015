close all
clear all
clc
input_dir='./Data_150827/';
out=dir([input_dir '*.csv']);

X={'1','2','3','PC','NC'};
Y={'A','B','C'};
Z={'1','2','3'};

tables=zeros(length(X),length(Y),length(Z));

odes=[];
intensities=[];
for i=1:length(out)
    
    % Parsing
    filename=out(i).name;
    [date,dev,bio,tech]=parseFilename(filename);
    filePath=[input_dir filename];
    
    % Load data
    disp(filePath);
    row=2;
    col=1;
    data=csvread(filePath,row,col);
    
    % Extract data
    ode=length(data);
    intensity=mean(data(:,2));
    % intensity=mean(data(data(:,1)>2E-8,2));
    
    % Save data
    x=find(strcmp(X, dev));
    y=find(strcmp(Y, bio));
    z=find(strcmp(Z, tech));
    tables(x,y,z)=intensity;
end
M=mean(tables,3);
csvwrite('results_150827_filtered.csv',M);
save('tables_150827_filtered.mat', 'tables');