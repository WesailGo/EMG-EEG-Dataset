function ProcOnePerson(Pcode)
ActionName = ["Back_kick","Front_kick","Hop","Run","Side_leg_lift","Sit","Sitting_leg_extension","Squart","Stand","Stand_with_one_leg_back","Stand_with_one_leg_up","Tiptoe_stand","Walk"];
[~,n]=size(ActionName);
for i=1:1:n
    ProcOneAction(Pcode,ActionName(i));
end
end
