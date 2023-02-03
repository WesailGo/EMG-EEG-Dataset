function wa = WAMP(x,thr)
 
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
