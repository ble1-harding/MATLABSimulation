rc = load('rc_veetrack.txt');
mass = 0.057
F_f = 0.1

[distance, velocity] = analyze_rc(mass, F_f, rc);

total_distance = sum(distance)


figure(3);clf
plot (distance);
title ('Track Distance vs. Segment (m)');
