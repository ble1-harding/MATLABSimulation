function distance=calc_distance(p1, p2)
    if (p2(4) == 0 )
        distance=norm(p1(1:3) - p2(1:3));
    else
        radius = p2(4);
        degrees = p2(5);
        
        offset = abs(p2(1)-p1(1))+abs(p2(2)-p1(2))+abs(p2(3)-p1(3))-2*radius;
        distance=sqrt((2*pi*radius*degrees/360)^2+ offset^2);
    end
    