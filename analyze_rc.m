function [distance, velocity] = analyze_rc(mass, F_f, rc)
    
    epsilon = 0.1;
    
    d_track = (24/3)/1.1;
    
    
    [distance, velocity] = calc_rc_velocity(mass, F_f, rc);
    [M,N]=size(velocity);
    
    figure(1); clf
    plot_rc(rc);
    axis equal;
    axis tight;
    if (abs(sum(distance) - d_track) > epsilon)
        % s = sprintf('Roller Coaster - Incorrect Length. Length of %f meters.', sum(distance));
        s = sprintf('Roller Coaster', sum(distance));
        title(s);
    elseif (abs(velocity(length(velocity))) > epsilon)
        s = sprintf('Roller Coaster - Cart is going too fast. Length: %f', sum(distance));
        title(s);
    else
        s = sprintf('Roller Coaster - Successful. Length: %f', sum(distance));
        title(s);
    end
    grid;
    hold off;
    
    figure(2);clf
    hold on;
    title('Velocity vs. Segment Number');
    xlabel('Segment Number');
    ylabel('Velocity');
    plot(0:N-1,velocity);
    
    