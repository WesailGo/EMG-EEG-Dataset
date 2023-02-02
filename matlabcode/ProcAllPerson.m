function ProcAllPerson()
personTitle = "sub";
personNumber = 10;
for i =1:1:personNumber
    Pcode = strcat(personTitle,num2str(i));
    ProcOnePerson(Pcode);
end
end