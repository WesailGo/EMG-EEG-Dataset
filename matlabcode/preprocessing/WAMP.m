function wa = WAMP(x,thr)
% x是时域信号，必须是1位的行向量或者列向量;
% thr是设定的阈值
% count是该函数计算信号x过零率的值
 
% initial value
wa = 0;
 
% error checks
if(length(x) == 1)
    error('ERROR: input signal must have more than one element');
end
 
if((size(x, 2) ~= 1) && (size(x, 1) ~= 1))
    error('ERROR: Input must be one-dimensional');
end
    
% force signal to be a vector oriented in the same direction
x = x(:);
 
num_samples = length(x);
for i=2:num_samples
    if(abs(x(i)-x(i-1))>thr)
        wa = wa + 1;
    end 
end
