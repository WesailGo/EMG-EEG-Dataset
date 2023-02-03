function out = left(A,B)
numA = length(A);
numB = length(B);
out= [];
Re = zeros(numB);
for i =1:1:numB
    tem = B(i);
    for j=1:1:numA
        if tem==A(j)
            Re(i)=Re(i)+1;
        end
    end
end
for i=1:1:numA
    tem = A(i);
    flag = 1;
    for j =1:1:numB
        if tem==B(j)
            if Re(j)>1
                flag=1;
                Re(j)=Re(j)-1;
            else
                flag=0;
            end
        end
    end
    if flag==1
        out=[out tem];
    end
end
end