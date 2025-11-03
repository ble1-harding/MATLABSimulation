%PLOTCIRCLESEGMENT - Given x,y,z start and end points, along with a radius
%and degrees, plots a circle segment outputs the direction per
%det_circle_dir specifications.
%
% Usage plotcirclesegment(p1, p2, rad, deg)
%
% Author: James Huff
% Date: 10/23/2009

function plotcirclesegment(p1,p2,rad,deg)

    x1 = p1(1);
    y1 = p1(2);
    z1 = p1(3);
    
    x2 = p2(1);
    y2 = p2(2);
    z2 = p2(3);
    [x_plane, y_plane, z_plane] = det_circle_plane(p1, p2, rad);
    t0 = det_circle_start(p1, p2, rad);

    if (deg < 0)
        dir_out = -1;
    else
        dir_out = 1;
    end
    
    deg = abs(deg);
    
    if (dir_out == -1)
        t0 = t0 - pi;
    end
    t = t0:0.04:((deg/360)*2*pi + t0);
    
    start_coord = [x2, 0, x1; y2, 0, y1; z2, 0, z1];
    end_coord = [x1, 0, x2; y1, 0, y2; z1, 0, z2];
    
    if (x_plane && y_plane)
        %the circle is in the xy plane
        x_t = start_coord(1, (dir_out+2)) + rad*(cos(t)-cos(t0));
        y_t = start_coord(2, (dir_out+2)) + rad*(sin(t)-sin(t0));
        z_t = start_coord(3, (dir_out+2)) + ...
            (end_coord(3, (dir_out+2)) - start_coord(3, (dir_out+2)))...
                *((360/(deg*2*pi))*(t - t0));            
    elseif (x_plane && z_plane)
        %the circle is in the xz plane
        x_t = start_coord(1, (dir_out+2)) + rad*(cos(t)-cos(t0));
        y_t = start_coord(2, (dir_out+2)) + ...
            (end_coord(2, (dir_out+2)) - start_coord(2, (dir_out+2)))...
                *((360/(deg*2*pi))*(t - t0));
        z_t = start_coord(3, (dir_out+2)) + rad*(sin(t)-sin(t0));
    else
        %the circle is in the yz plane
        x_t = start_coord(1, (dir_out+2)) + ...
            (end_coord(1, (dir_out+2)) - start_coord(1, (dir_out+2)))...
                *((360/(deg*2*pi))*(t - t0));
        y_t = start_coord(2, (dir_out+2)) + rad*(cos(t)-cos(t0));
        z_t = start_coord(3, (dir_out+2)) + rad*(sin(t)-sin(t0));
    end
    
    %Ensure circle segments connect.
    x_t(length(x_t)) = end_coord(1, (dir_out+2));
    y_t(length(y_t)) = end_coord(2, (dir_out+2));
    z_t(length(z_t)) = end_coord(3, (dir_out+2));
    plot3(x_t,y_t,z_t, 'color', [0 .4 0],...
                       'LineWidth', 3);