rawdata= load('..\EMG\sub8\Back_kick\outms15k1.mat'); 
data=rawdata.n(:,2:10);
figure(1)
for i=1:1:9
    subplot(9,1,i)
    plot(rawdata.n(:,i+1))
    axis([0 15000 -200 200]);
end
