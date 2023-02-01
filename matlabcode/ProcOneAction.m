function onePA = ProcOneAction(Pcode,ActionName)
sourcePath = "load('..//EMG//";
ActionPath = strcat(sourcePath,Pcode,"//",ActionName,"//");
ActionContent = ['inms15k1.mat','inms15k2.mat','inms15k3.mat','outms15k1.mat','outms15k2.mat','outms15k3.mat'];
onePA = zeros(84,2000,6);
window = 2000;
step = 1000;
for i= 1:1:6
   finalPath = strcat(ActionPath, ActionContent(i), "')");
   oneStructure = eval(finalPath);
   data = oneStructure.n;
   for j=1:1:14
       
   end
end
end
