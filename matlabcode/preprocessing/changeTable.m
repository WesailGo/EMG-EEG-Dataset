function table = changeTable(taData)
table=zeros(5,16);
for j=1:1:16
    temData = taData(:,j+1);
    timeFeature = GetTimeFeature(temData);
    table(:,j)=timeFeature;
end
