% clear;clc;
% delete(instrfind({'Port'},{'COM5'}));
arduinoCom = serial('COM6','BaudRate',9600);
sendData = [0.334,0.554,0.989];
fopen(arduinoCom);
% pause(0.5);
for i=1:1:3
    disp("good!");
    pause(3);
    fprintf(arduinoCom,'%f',sendData(i));
%     fprintf(arduinoCom,'%f',sendData(1));
%     pause(0.5);
%     fprintf(arduinoCom,'%f',sendData(2));
%     pause(0.5);
%     fprintf(arduinoCom,'%f',sendData(3));
%     pause(0.5);
%     s = fgetl(arduinoCom);
%     disp(s);
%     disp("end!");
    if (i==3)
        s = fgetl(arduinoCom);
        disp(s);
        disp("end!");
    end
end
% fprintf(arduinoCom,'%f',sendData(3));
% pause(0.5);
% s = fgetl(arduinoCom);
% s = fscanf(arduinoCom);
% disp(s);
% disp("end!");
% function ReceiveCallback(obj,event) %???????
% global s;
% a = fscanf(s);
% disp(a);
% I = 'I Received';
% disp(I);
% end
fclose(arduinoCom);