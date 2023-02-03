function getFinalDataset()
% initialize
getPreDataset();
Preset = load("..//EMG//Predataset.mat");
[num,dsize,channel]=size(Preset);
windowSize = 200;
interval = 50;
windowNum = 1+(dsize-windowSize)/interval;
featureNum = 5;
finalDataset = zeros(num,windowNum,featureNum,channel);
% process
for i=1:1:num
    temSlip = Preset(i,:,:);
    oneslip = zeros(windowNum,featureNum,channel);
    for j=1:1:windowNum
        temsection = temSlip((j-1)*interval+1:(j-1)*interval+windowSize,:);
        [~,c]=size(temsection);
        for k=1:1:c
            temrow = temsection(:,k);
            timefeatures = getTimefeature(temrow);
            tfnorm = normlization(timefeatures);
            oneslip(j,:,k)=tfnorm;
        end
    end
    finalDataset(i,:,:,:)=oneslip;
end
save("..//EMG//finalDataset.mat","finalDataset");
end