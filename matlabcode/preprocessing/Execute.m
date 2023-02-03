% To do the timePreprocessing
d1 = load('坐姿.mat');
[d1train, d1test]=getTrainTest(d1);
disp("d1")
size(d1train)
size(d1test)
d2 = load('抬腿.mat');
[d2train, d2test]=getTrainTest(d2);
disp("d2")
size(d2train)
size(d2test)
d3 = load('站1.mat');
[d3train, d3test]=getTrainTest(d3);
disp("d3")
size(d3train)
size(d3test)
d41 = load('站2.1.mat');
[d41train, d41test]=getTrainTest(d41);
disp("d41")
size(d41train)
size(d41test)
d42 = load('站2.2.mat');
[d42train, d42test]=getTrainTest(d42);
disp("d42")
size(d42train)
size(d42test)
d43 = load('站2.3.mat');
[d43train, d43test]=getTrainTest(d43);
disp("d43")
size(d43train)
size(d43test)
d44 = load('站2.4.mat');
[d44train, d44test]=getTrainTest(d44);
disp("d44")
size(d44train)
size(d44test)
d51 = load('站3.1.mat');
[d51train, d51test]=getTrainTest(d51);
disp("d51")
size(d51train)
size(d51test)
d52 = load('站3.2.mat');
[d52train, d52test]=getTrainTest(d52);
disp("d52")
size(d52train)
size(d52test)
train = cat(1,d1train,d2train,d3train,d41train,d42train,d43train,d44train,d51train,d52train);
test = cat(1,d1test,d2test,d3test,d41test,d42test,d43test,d44test,d51test,d52test);
disp("all")
size(train)
size(test)
% save('newDataset.mat','train','test')