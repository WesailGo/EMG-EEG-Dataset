function afPca = doPca(table)
neTable=table.';
coeff=pca(neTable);
[m,n]=size(neTable);
% [~,y]=size(coeff);
afPca=zeros(m,5);
for i=1:1:5
    constantData = coeff(:,i);
    for l=1:1:m 
        temData=0;
        for j=1:1:n
            temData=temData+neTable(l,j)*constantData(j);
        end
        afPca(l,i)=temData;
    end
end
end