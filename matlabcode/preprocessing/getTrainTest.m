function [train, test]=getTrainTest(data)
fileName = fieldnames(data);
des = "resCopy";
tf = contains(fileName,des);
resName = fileName(tf);
len = length(resName);
fivemod = mod(len, 5);
allNum = len-fivemod;
trainNum = 4*(allNum/5)+fivemod;
testNum = (allNum/5);
train = zeros(trainNum,8,10,1);
test = zeros(testNum,8,10,1);
% get test first
for i =1:1:testNum
    data_name = strcat('data.',resName(i));
    onedata = eval(data_name{1});
    oneTable = onedata.table;
    oneOut = timeSpiralPreprocessing(oneTable);
    test(i,:,:,:)=oneOut;
end
% get train
for j =testNum+1:1:testNum+trainNum
    data_name = strcat('data.',resName(j));
    onedata = eval(data_name{1});
    oneTable = onedata.table;
    oneOut = timeSpiralPreprocessing(oneTable);
    train(j-testNum,:,:,:)=oneOut;
end
end