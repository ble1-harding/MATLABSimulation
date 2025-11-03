% CALC_RC_VELOCITY - Takes the coordinates of a roller coaster, mass, and
%   friction coefficient and returns the velocity.
%
% Usage: velocity = calc_rc_velocity(mass, F_f, roller_coaster)
%
% Author: James Huff
% Date: 10/23/2009

function [distance, velocity] = calc_rc_velocity_example(mass, F_f, roller_coaster)
    
    [M,N]=size(roller_coaster);
    velocity = zeros(1,M);
    distance = zeros(1,M-1);
    gravity = 9.81;
    cart_stopped = 0;
    
    if (N ~= 5)
        error('The input file must have five columnns: X, Y, Z, radius, angle');
    end
    
    for i=2:M
        %Find distance
        % distance = calc_distance(...);
        
        %Find potential energy at point 1
        % pe_1 = calc_pe(...);
        
        %Find kenetic energy at point 1
        % ke_1 = calc_ke1(...);
        
        %Find potential energy at point 2
        % pe_2 = calc_pe(...);
        
        %Find work due to friction at point 2;
        % w_f = calc_wf(F_f, distance(i-1));
        
        %Find kinetic energy at point 2;
        %ke_2 = calc_ke2(...);
        
        %Find velocity at point 2
        % velocity(i) = calc_velocity(...);

        if (ke_2 < 0 || cart_stopped)
            cart_stopped = 1;
            velocity(i) = 0;
        else
            velocity(i) = calc_velocity(mass, ke_2);
        end
   end
    
        
 