raw = load('F://EMG-EEG-Dataset//EMG//sub15//Back_kick//inms15k2.mat');
data=raw.n(:,2:10);
figure(1)
for i=1:1:9
    subplot(9,1,i)
    plot(data(:,i))
    axis([0 15000 -200 200]);
end