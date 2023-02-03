function timefeatures = getTimefeature(oneRow)

% initialize output
timefeatures = zeros(5,1);
rowlen = length(oneRow);

% calculate MAV
absrow = abs(oneRow);
mav = sum(absrow)/rowlen;
timefeatures(1) = mav;

% calculate RMS
squareData = zeros(rowlen);
for i=1:1:rowlen
    squareData(i)= oneRow(i)^2;
end
Rms =sqrt(sum(squareData(:))/rowlen);
timefeatures(2) = Rms;

% calculate VAR
oneMean = mav;
rowDifData = zeros(rowlen);
for i=1:1:rowlen
    rowDifData(i)= (oneRow(i)-oneMean)^2;
end
var=sum(rowDifData(:))/rowlen;
timefeatures(3) = var;

% calculate ZC
zc = 0;
for j=2:1:rowlen
    if((oneRow(j)-oneMean)*(oneRow(j-1)-oneMean)<0)&&((abs(oneRow(j)-oneRow(j-1))>0.001))
        zc = zc + 1;
    end 
end
timefeatures(4) = zc;

% calculate WAMP
wamp = WAMP(oneRow,0.1);
timefeatures(5) = wamp;
