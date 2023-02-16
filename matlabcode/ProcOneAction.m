function onePA = ProcOneAction(Pcode,ActionName)
sourcePath = "load('..//EMG//";
ActionPath = strcat(sourcePath,Pcode,'//',ActionName,'//');
config =load("configuration.mat");
ActionContent = config.configuration.fileName;
% configuration
onesection = 15000;
secNumber =6;
channel = 9;
window = 2000;
step = 1000;
% set parameters
allnumber = onesection*secNumber;
alldata = zeros(allnumber,channel);
number = ((allnumber-window)/step)+1;
onePA = zeros(number,window,channel);
% get alldata
for i= 1:1:6
   finalPath = strcat(ActionPath, ActionContent(i), "')");
   oneStructure = eval(finalPath);
   temdata = oneStructure.n;
   alldata((i-1)*onesection+1:i*onesection,:)=temdata(:,2:10);
end
% separate alldata
for j= 1:1:number
    onePA(j,:,:)=alldata(1+(j-1)*step:window+(j-1)*step,:);
end
% save onePA
savePath = strcat("..//EMG//",Pcode,"//",ActionName,"//","onePA.mat");
save(savePath,"onePA");
end
