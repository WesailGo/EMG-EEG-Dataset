function timeFeature = GetTimeFeature(oneRow)

% initialize output
timeFeature = zeros(5,1);

% initialize slide window size and slide interval
windowSize = 200;
interval = 50;
oneRow = normalization(oneRow);
% create windows
oneRowLength = length(oneRow);
windowNum = 1+(oneRowLength-windowSize)/interval;
windows=zeros(windowSize,windowNum);
for i=1:1:windowNum
    for j=1:1:windowSize
        windows(j,i)=oneRow(j+(i-1)*interval);
    end
end
% save('windows','windows');

% calculate MAV
absWindows = abs(windows);
absmeanData = zeros(windowNum,1);
for i=1:1:windowNum
    temSum = sum(absWindows(:,i));
    oneMean = temSum/windowSize;
    absmeanData(i) =oneMean;
end
mav = sum(absmeanData(:))/windowNum;
timeFeature(1) = mav;

% calculate RMS
rmsData = zeros(windowNum,1);
for i=1:1:windowNum
    squareData = zeros(windowSize);
    for j=1:1:windowSize
        squareData(j)= windows(j,i)^2;
    end
    oneRms = sqrt(sum(squareData(:))/(windowSize-1));
    rmsData(i) =oneRms;
end
Rms = sum(rmsData(:))/windowNum;
timeFeature(2) = Rms;

% calculate VAR
varData = zeros(windowNum,1);
for i=1:1:windowNum
    oneMean = absmeanData(i);
    rowDifData = zeros(windowSize);
    for j=1:1:windowSize
        rowDifData(j)= (windows(j,i)-oneMean)^2;
    end
    varData(i) =sum(rowDifData(:))/windowSize;
end
var = sum(varData(:))/windowNum;
timeFeature(3) = var;

% calculate ZC
zcData = zeros(windowNum,1);
for i=1:1:windowNum
    oneZc = 0;
    for j=2:1:windowSize
        if((windows(j,i)-absmeanData(i))*(windows(j-1,i)-absmeanData(i))<0)&&((abs(windows(j,i)-windows(j-1,i))>0.001))
            oneZc = oneZc + 1;
        end 
    end
    zcData(i) = oneZc;
end
zc = sum(zcData(:))/windowNum;
timeFeature(4) = zc;

% calculate WAMP
wampData = zeros(windowNum,1);
for i=1:1:windowNum
    oneWa = WAMP(windows(:,i),0.1);
    wampData(i) = oneWa;
end
wamp = sum(wampData(:))/windowNum;
timeFeature(5) = wamp;
