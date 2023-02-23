
%% instantiate the library
disp('Loading the library...');
lib = lsl_loadlib();

height=15000;%2000h=2.5s

channel=9;

% resolve a stream...
disp('Resolving an EEG stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'type','EEG'); end

% create a new inlet
disp('Opening an inlet...');
inlet = lsl_inlet(result{1});

disp('Now receiving data...');

res.table = zeros(height,10);

j=1;
for i=1:height
    [vec,ts]=inlet.pull_sample();
    res.table(i,1)=ts;
    res.table(i,2:7)=vec(1:6);
    res.table(i,8:10)=vec(9:11);
end
n=res.table;
save('F://EMG-EEG-Dataset//EMG//sub16//Tiptoe_stand//inms15k2.mat',"n");
data=n(:,2:10);
figure(1)
for i=1:1:9
    subplot(9,1,i)
    plot(data(:,i))
    axis([0 15000 -200 200]);
end