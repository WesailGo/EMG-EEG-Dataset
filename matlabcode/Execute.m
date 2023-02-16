FName = "peopleDataset";
% personNumber is changable
% if just 1 people, then you can find 1peopleDataset.mat in ..//EMG//1peopleDataset.mat
% the dataset size is [personNum*890,37,5,9]
personNumber = 2;
DatasetName = strcat(num2str(personNumber),FName);
getFinalDataset(personNumber, DatasetName);