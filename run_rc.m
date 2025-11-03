rc = load('rc_veetrack.txt');
mass = 0.039
F_f = 0.15

[distance, velocity] = analyze_rc(mass, F_f, rc);

total_distance = sum(distance)


figure(3);clf
plot (distance);
title ('Track Distance vs. Segment (m)');
