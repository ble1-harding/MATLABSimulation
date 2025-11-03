function [x_plane, y_plane, z_plane] = det_circle_plane(p1,p2,rad)
    x1 = p1(1);
    y1 = p1(2);
    
    x2 = p2(1);
    y2 = p2(2);
    
    x_plane = false;
    y_plane = false;
    z_plane = false;
    
    epsilon = 0.03;
    if (abs(abs(x2 - x1) - rad) < epsilon)
        if (abs(abs(y2 - y1) - rad) < epsilon)
            %the circle is in the xy plane
            x_plane = true;
            y_plane = true;
        else
            %the circle is in the xz plane
            x_plane = true;
            z_plane = true;
        end
    else
        %the circle is in the yz plane
        y_plane = true;
        z_plane = true;
    end
