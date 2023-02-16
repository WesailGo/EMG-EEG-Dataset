function ProcOnePerson(Pcode)
config =load("configuration.mat");
ActionName = config.configuration.actionName;
[~,n]=size(ActionName);
for i=1:1:n
    ProcOneAction(Pcode,ActionName(i));
end
end
