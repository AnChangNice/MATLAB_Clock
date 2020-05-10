function [ point ] = my_rotate( point, Angle, x0, y0 )
%% ������任
teta = Angle*pi/180; % ��ת�Ƕ�
T = [
    cos(teta), -sin(teta);...
    sin(teta), cos(teta)
];
for i = 1:length(point)
    point(i, :) = (T * (point(i, :)' - [x0; y0]) + [x0; y0])';
end

end

