sixsixsevendelta=[275;234;208;180]
sevenohsixdelta=[319;290;270;242]
seventwentyeightdelta=[378;346;302;278]
teneightythreedelta=[429;365;336;310]
%% 
sixsixsevendelta=3.08404*10^-4*sixsixsevendelta
sevenohsixdelta=3.54939*10^-4*sevenohsixdelta
seventwentyeightdelta=2.32450*10^-4*seventwentyeightdelta
teneightythreedelta=8.48163*10^-4*teneightythreedelta

bfield=[2.07;1.80;1.57;1.39]
%% 
figure
fit1=fit(bfield,sixsixsevendelta,'poly1')

plot(bfield,sixsixsevendelta)
title('667 Δλ')
xlabel('Magnetic Field (T)')
ylabel('Δλ (nm)')


figure
fit2=fit(bfield,sevenohsixdelta,'poly1')
plot(bfield,sevenohsixdelta)
title('706 Δλ')
xlabel('Magnetic Field (T)')
ylabel('Δλ (nm)')


figure
fit3=fit(bfield,seventwentyeightdelta,'poly1')
plot(bfield,seventwentyeightdelta)
title('728 Δλ')
xlabel('Magnetic Field (T)')
ylabel('Δλ (nm)')


figure
fit4=fit(bfield,teneightythreedelta,'poly1')
plot(bfield,teneightythreedelta)
title('1083 Δλ')
xlabel('Magnetic Field (T)')
ylabel('Δλ (nm)')
%% 


linefitslopes=[1.515,.03896,.03513,.1458]
wavelengths=[667,706,728,1083]
hc=1.98644568*10^-25*10^-9
solvingm=[linefitslopes;wavelengths]
%% 

bohrmsixisxseven=hc*linefitslopes(1,1)./wavelengths(1,1)
bohrmsevenohsix=hc*linefitslopes(1,2)./wavelengths(1,2)
bohrmseventwentyeight=hc*linefitslopes(1,3)./wavelengths(1,3)
bohrmteneightythree=hc*linefitslopes(1,4)./wavelengths(1,4)
%% 
bohrms=[bohrmsixisxseven,bohrmsevenohsix,bohrmseventwentyeight,bohrmteneightythree]

bohrmavgdelta=mean(bohrms)
%% 
figure
bmaxdeltalambda=[.0848;.1132;.0879;.3639]
bmaxlambdasquared=[667^2;707^2;728^2;1083^2]
plot(bmaxlambdasquared,bmaxdeltalambda)
title('Δλ/λ squared')
xlabel('λ squared (nm)')
ylabel('Δλ (nm)')
fit5=fit(bmaxlambdasquared,bmaxdeltalambda,'poly1')
%% 

bohrmbmax=3.911e-07*hc./2.07
