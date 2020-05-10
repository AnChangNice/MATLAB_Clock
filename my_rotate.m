function [ point ] = my_rotate( point, Angle, x0, y0 )
%% 用坐标变换
teta = Angle*pi/180; % 旋转角度
T = [
    cos(teta), -sin(teta);...
    sin(teta), cos(teta)
];
for i = 1:length(point)
    point(i, :) = (T * (point(i, :)' - [x0; y0]) + [x0; y0])';
end

end

