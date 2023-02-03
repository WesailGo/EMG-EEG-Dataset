function out = timeSpiralPreprocessing(data)
table = changeTable(data);
afPca = doPca(table);
out = doSpiral(afPca);
end