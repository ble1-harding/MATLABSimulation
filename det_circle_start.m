function t0 = det_circle_start(p1, p2, rad)
    x1 = p1(1);
    y1 = p1(2);
    z1 = p1(3);
    
    x2 = p2(1);
    y2 = p2(2);
    z2 = p2(3);
    [x_plane, y_plane, z_plane] = det_circle_plane(p1, p2, rad);
    if (x_plane && y_plane)
        %the circle is in the xy plane
        if (x2 > x1)
            if (y2 > y1)
                t0 = -pi/2;
            else
                t0 = -pi;
            end
        else
            if (y2 > y1)
                t0 = 0;
            else
                t0 = pi/2;
            end
        end
    elseif (x_plane && z_plane)
        %the circle is in the xz plane
        if (x2 > x1)
            if (z2 > z1)
                t0 = -pi/2;
            else
                t0 = -pi;
            end
        else
            if (z2 > z1)
                t0 = 0;
            else
                t0 = pi/2;
            end
        end
    else
        %the circle is in the yz plane
        if (y2 > y1)
            if (z2 > z1)
                t0 = -pi/2;
            else
                t0 = -pi;
            end
        else
            if (z2 > z1)
               t0 = 0;
            else
               t0 = pi/2;
            end
        end
    end
