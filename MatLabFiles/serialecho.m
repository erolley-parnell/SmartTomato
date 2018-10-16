
%Clear Variable and Close open ports
clc;
clear all;
close all;
if ~isempty(instrfind)
     fclose(instrfind);
     delete(instrfind);
end

%Init Plot
[X,Y] = meshgrid((0:1:4),(0:1:3));
%figure
%hold on;
drawnow limitrate;
view(3);

%Init Serial
s = serial('COM3');
s.Baudrate = 57600;
s.Terminator = 'CR';

fopen(s);
shape = tomato;

while(1)
    shape.string = fscanf(s, '%s');
    shape.prep;
    shape.arrayData
    shape.Z;
    surf(shape.Z);
    axis([ 0, 4, 0, 5 , -70, 300]); 
    drawnow
    

end
fclose(s);
