% PLOT_RC - Takes the coordinates of a roller coaster, plots it in
% 3 dimensions
%
% Usage: plot_RC(roller_coaster)
%
% Author: James Huff
% Date: 10/23/2009

function plot_rc(rc)
    [M,N]=size(rc);
    if (N ~= 5)
        error('The input file must have five columnns: X, Y, Z, radius, angle');
    end
    x_rc = rc(:,1);
    y_rc = rc(:,2);
    z_rc = rc(:,3);
    rad_rc = rc(:,4);
    deg_rc = rc(:,5);
    hold on;
    
    for i=2:M
        if (rad_rc(i) == 0)
            plot3(x_rc((i-1):i), y_rc((i-1):i), z_rc((i-1):i), ...
                    'color', [0 .4 0],...
                    'LineWidth', 3);
        else
            plotcirclesegment([x_rc(i-1),y_rc(i-1),z_rc(i-1)],...
                                [x_rc(i), y_rc(i), z_rc(i)], ...
                                rad_rc(i),deg_rc(i));
        end
    end
    
    hold off;
    