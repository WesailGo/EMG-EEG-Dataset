%load data n
re=zeros(11,11,4);
index=fliplr(11^2+1-spiral(11));
n1=zeros(11);
for i=1:125
    for j=1:4
        n1(126-i,j)=n(i,j);
    end
end
for i=1:11
    for j=1:11
        for k=1:4
            re(i,j,k)=n(index(i,j),k);
        end
    end
end
save('rearray','re');