% CALC_RC_VELOCITY - Takes the coordinates of a roller coaster, mass, and
%   friction coefficient and returns the velocity.
%
% Usage: velocity = calc_rc_velocity(mass, F_f, roller_coaster)
%
% Author: James Huff
% Date: 10/23/2009

function [distance, velocity] = calc_rc_velocity(mass, F_f, roller_coaster)
    
    [M,N]=size(roller_coaster);
    velocity = zeros(1,M);
    distance = zeros(1,M-1);
    gravity = 9.81;
    cart_stopped = 0;
    
    if (N ~= 5)
        error('The input file must have five columnns: X, Y, Z, radius, angle');
    end
    
    for i=2:M
        distance(i-1) = calc_distance(roller_coaster((i-1),:),...
                                        roller_coaster(i,:));
        
        pe_1 = calc_pe(mass, gravity, roller_coaster((i-1),3));
        ke_1 = calc_ke1(mass, velocity(i-1));
        
        pe_2 = calc_pe(mass, gravity, roller_coaster(i,3));
        w_f = calc_wf(F_f, distance(i-1));
        ke_2 = calc_ke2(pe_1, ke_1, pe_2, w_f);
        
        if (ke_2 < 0 || cart_stopped)
            cart_stopped = 1;
            velocity(i) = 0;
        else
            velocity(i) = calc_velocity(mass, ke_2);
        end
        
    end
    
        
 