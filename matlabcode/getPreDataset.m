function getPreDataset()
ProcAllPerson();
temOne = load("..//EMG//sub1//Walk//onePA.mat");
[num,dsize,channel]=size(temOne);
personNumber = 10;
actionNumber = 13;
numberOfoneAction = num*personNumber;
totalNumber = actionNumber*numberOfoneAction;
Predataset = zeros(totalNumber,dsize,channel);
label = zeros(totalNumber);
ActionName = ["Back_kick","Front_kick","Hop","Run","Side_leg_lift","Sit","Sitting_leg_extension","Squart","Stand","Stand_with_one_leg_back","Stand_with_one_leg_up","Tiptoe_stand","Walk"];
personTitle = "sub";
personNumber = 10;
for i=1:1:actionNumber
    actname = ActionName(i);
    for j=1:1:personNumber
        Pcode = strcat(personTitle,num2str(j));
        container = zeros(numberOfoneAction,dsize,channel);
        findPath = strcat("load('..//EMG//",Pcode,"//",actname,"//onePA.mat')");
        onepa = eval(findPath);
        container((j-1)*num+1:j*num,:,:)=onepa;
    end
    Predataset((i-1)*numberOfoneAction+1:i*numberOfoneAction,:,:)=container;
    label((i-1)*numberOfoneAction+1:i*numberOfoneAction)=i-1;
end
save("..//EMG//Predataset.mat","Predataset");
save("..//EMG//label.mat","label");