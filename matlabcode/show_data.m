rawdata= load('C:\Users\Administrator\Desktop\dataset\EMG-EEG-Dataset-main\EMG\sub2\Stand\outms15k3.mat'); 
data=rawdata.n(:,2:10);
figure(1)
for i=1:1:9
    subplot(9,1,i)
    plot(rawdata.n(:,i+1))
    axis([0 15000 -200 200]);
end
