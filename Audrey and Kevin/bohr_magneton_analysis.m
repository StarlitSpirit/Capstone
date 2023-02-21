sixsixsevendelta=[275;234;208;180]
sevenohsixdelta=[319;290;270;242]
seventwentyeightdelta=[378;346;302;278]
teneightythreedelta=[429;365;336;310]
%% 
sixsixsevendelta=3.0840410^-4*sixsixsevendelta
sevenohsixdelta=3.54939*10^-4*sevenohsixdelta
seventwentyeightdelta=2.32450*10^-4*seventwentyeightdelta
teneightythreedelta=8.48163*10^-4*teneightythreedelta

bfield=[2.07;1.80;1.57;1.39]
%% 
figure
plot(bfield,sixsixsevendelta)
title('667 Δλ')
xlabel('Magnetic Field (T)')
ylabel('Δλ (nm)')

fit(bfield,sixsixsevendelta,'poly1')

figure
plot(bfield,sevenohsixdelta)
title('706 Δλ')
xlabel('Magnetic Field (T)')
ylabel('Δλ (nm)')

fit(bfield,sevenohsixdelta,'poly1')

figure
plot(bfield,seventwentyeightdelta)
title('728 Δλ')
xlabel('Magnetic Field (T)')
ylabel('Δλ (nm)')

fit(bfield,seventwentyeightdelta,'poly1')

figure
plot(bfield,teneightythreedelta)
title('1083 Δλ')
xlabel('Magnetic Field (T)')
ylabel('Δλ (nm)')

fit(bfield,teneightythreedelta,'poly1')


