function getFinalDataset(PersonNum, DatasetName)
% initialize
getPreDataset(PersonNum);
Preset = load("..//EMG//Predataset.mat");
config =load("configuration.mat");
num = config.configuration.Prenum;
dsize = config.configuration.dsize;
channel = config.configuration.channel;
windowSize = 200;
interval = 50;
windowNum = 1+(dsize-windowSize)/interval;
featureNum = 5;
finalDataset = zeros(num,windowNum,featureNum,channel);
% process
for i=1:1:num
    temSlip = Preset.Predataset(i,:,:);
    oneslip = zeros(windowNum,featureNum,channel);
    for j=1:1:windowNum
        temsection = temSlip(:,(j-1)*interval+1:(j-1)*interval+windowSize,:);
        for k=1:1:channel
            temrow = temsection(:,:,k);
            timefeatures = getTimefeature(temrow);
            tfnorm = normalization(timefeatures);
            oneslip(j,:,k)=tfnorm;
        end
    end
    finalDataset(i,:,:,:)=oneslip;
end
firstSave = "save('..//EMG//";
LastSave = "','finalDataset');";
SavePath = strcat(firstSave,DatasetName,LastSave);
eval(SavePath);
end