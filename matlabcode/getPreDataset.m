function getPreDataset(personNumber)
ProcAllPerson(personNumber);
config =load("configuration.mat");
num = config.configuration.num;
dsize = config.configuration.dsize;
channel = config.configuration.channel;
% personNumber = 10;
actionNumber = 10;
numberOfoneAction = num*personNumber;
totalNumber = actionNumber*numberOfoneAction;
Predataset = zeros(totalNumber,dsize,channel);
label = zeros(totalNumber,1);
ActionName = config.configuration.actionName;
personTitle = "sub";
% personNumber = 10;
for i=1:1:actionNumber
    actname = ActionName(i);
    for j=1:1:personNumber
        Pcode = strcat(personTitle,num2str(j));
        container = zeros(numberOfoneAction,dsize,channel);
        findPath = strcat("load('..//EMG//",Pcode,"//",actname,"//onePA.mat')");
        onepa = eval(findPath);
        container((j-1)*num+1:j*num,:,:)=onepa.onePA;
    end
    Predataset((i-1)*numberOfoneAction+1:i*numberOfoneAction,:,:)=container;
    label((i-1)*numberOfoneAction+1:i*numberOfoneAction,:)=i-1;
end
save("..//EMG//Predataset.mat","Predataset");
save("..//EMG//datasets//label.mat","label");