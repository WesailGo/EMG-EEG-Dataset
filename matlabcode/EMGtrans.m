
%% instantiate the library
disp('Loading the library...');
lib = lsl_loadlib();

height=15000;%2000h=2.5s

channel=6;

% resolve a stream...
disp('Resolving an EEG stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'type','EEG'); end

% create a new inlet
disp('Opening an inlet...');
inlet = lsl_inlet(result{1});

disp('Now receiving data...');

res.table = zeros(height,7);

j=1;
for i=1:height
    [vec,ts]=inlet.pull_sample();
    res.table(i,1)=ts;
    res.table(i,2:7)=vec(1:6);
end
n=res.table;
save('F://dataset//P2//Squart//outms15k3.mat',"n");