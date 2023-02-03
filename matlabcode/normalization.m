function out=normalization(A)
temp =[];
demesion=size(A);
meanA=mean(A);
stdA=std(A);
for i=1:numel(A)
    temp = [temp (A(i)-meanA)/stdA];
end
out=reshape(temp,demesion);
end