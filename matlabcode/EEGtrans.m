
%% instantiate the library
disp('Loading the library...');
lib = lsl_loadlib();

height=10000;%2000h=2.5s

channel=12;

% resolve a stream...
disp('Resolving an EEG stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'type','EEG'); end

% create a new inlet
disp('Opening an inlet...');
inlet = lsl_inlet(result{1});

disp('Now receiving data...');

res.table = zeros(height,13);

j=1;
for i=1:height
    [vec,ts]=inlet.pull_sample();
    res.table(i,1)=ts;
    res.table(i,2:7)=vec(1:6);
    res.table(i,8:13)=vec(9:14);
end
n=res.table;
save('F://EEG//P2//running//rn1w10.mat',"n");