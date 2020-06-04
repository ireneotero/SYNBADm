function [ ] = plot_result( dim )
%PLOT_RESULT plots the results of the test run
global irun visited_points nPoints

if dim==3
    plotxall=[];
    for i=1:nPoints
        plotxall(i,1) = visited_points(i).x(1);
        plotxall(i,2) = visited_points(i).x(2);
        plotxall(i,3) = visited_points(i).f;
    end
end

% MITP 14
if (irun == 14)
    x1=0:.1:20;
    x2=12:.1:20;
    [x,y]=meshgrid(x1,x2);
%          g(1) = -w(1)^2 + 6.0*w(1) - w(2) + 11.0;
%          g(2) = w(1)*w(2) - 3.0*w(2)^2 - exp(w(1)-3.0) + 51.5;
    f =  2.0*(0.25*x).^2 + (0.25*y).^2 - 16.0*(0.25*x) - 10.0*(0.25*y);
end

% MITP 17
if (irun == 17)
    x1=1:.1:8;
    x2=1:.1:8;
    [x,y]=meshgrid(x1,x2);
%          g(1) = 5.0*y(1)-(x(1)-7.0)^2; 
%          g(2) = 1.8*y(1)-x(1);
    f = ((x-3.0).^2-10.0*x).*(3*x+y+1.0).^-1;
end

% MITP 20
if (irun == 20)
    x1=0:1:200;
    x2=0:1:200;
    [x,y]=meshgrid(x1,x2);
% 	    g(1) = - 0.1*y(1)^2 + y(2);
%         g(2) = - 0.333333333333333*y(1) - y(2) + 4.5;
    f = ((x - 8.).^2 + (y - 2.).^2);
end

% MITP 21
if (irun == 21)
    x1=1:1:200;
    x2=1:1:200;
%     x1=1:1:10;
%     x2=1:1:30;
    [x,y]=meshgrid(x1,x2);
    f = (100.0*(0.5 + y - (0.6 + x).^2).^2) + (0.4 - x).^2 ;
end

% MITP 23
if (irun == 23)
%     x1=1:1:200;
%     x2=1:1:200;
    x1=1:1:10;
    x2=1:1:10;
    [x,y]=meshgrid(x1,x2);
    f = 0.1*(x.^2 + (1 + y.^2)*x.^-2 + (100 + x.^2*y.^2) ...
            *x.^-4*y.^-4) + 1.2;
end

% MITP 27
if (irun == 27)
    x1=0:1:200;
    x2=0:1:200;
    [x,y]=meshgrid(x1,x2);
% 	    g(1) = (-9.0*y(1)^2) - 10.0*y(1)*y(2) - 8.0*y(2)^2 + 583.0;
%         g(2) = (-6.0*y(1)^2) - 8.0*y(1)*y(2) - 6.0*y(2)^2 + 441.0;
    f = 7.0*x.^2 + 6.0*y.^2 - 35.0*x - 80.4*y;
end

% MITP 33
if (irun == 33)
    x1=0:1:200;
    x2=0:1:200;
    [x,y]=meshgrid(x1,x2);
        f =   (1.5 - x.*(1.0 - y)).^2 ... 
        + (2.25 - x.*(1.0 - y.^2)).^2 + (2.625 - x.*(1.0 - y.^3)).^2; 
end

% MITP 51
if (irun == 51)
    x1=1:.01:5;
    x2=1:.01:5;
    [x,y]=meshgrid(x1,x2);
%          g(1) = -24.0D0 - y(1)^1.2D0*y(2)^1.7D0 ...
%                 + 7.0d0*y(1) + 9.0d0*y(2);
%          g(2) = -5.0D0 + y(1) + 2.0D0*y(2);
%          g(3) = 1.0D0 + 3.0D0*y(1) - y(2);
%          g(4) = 11.0D0 - 4.0D0*y(1) + 3.0D0*y(2);
    f = 7.0*x + 10.0*y;
end

% MITP 52
if (irun == 52)
    x1= 1:.1:10;
    x2= 1:.1:6;
    [x,y]=meshgrid(x1,x2);

    f = 3.0*y - 5.0*x;
    
%     g1 = 39.0D0 - 2.0D0*y.^2 + 2.0D0*y.^0.5 ...
%            + 2.0D0*(x.^0.5).*(y.^2) - 11.0D0*y - 8.0D0*x;
%     g2 = 3.0D0 + y - x;
%     g3 = 24.0D0 - 2.0D0*y - 3.0D0*x;
%     
%     surfl(x,y,g1);
%     contour(x,y,g1);
%     figure
%     surfl(x,y,g2);
%     contour(x,y,g2);
%     figure
%     surfl(x,y,g3);
%     contour(x,y,g3);
end

% MITP 54
if (irun == 54)
% Battiti (f6) MITP 54
%     x1=-1.5:.01:.5;
%     x2=-1.5:.01:.5;
    x1=-1.:.01:1;
    x2=-1.:.01:1;
    [x,y]=meshgrid(x1,x2);
    f = -0.5 + (sin(100.0*sqrt(x.^2 + y.^2)).^2 - 0.5).*(1.0 + 10.0*(x.^2 + y.^2)).^-2;
  %  f = -f;
end
 
% MITP 55
if (irun == 55)
% Shekel function MITP 55   
    x1=0:.1:10;
    x2=0:.1:10;
    [x,y]=meshgrid(x1,x2);
    f = 1.0./(1.2 + (x - 1).^2 + (y - 8).^2) + 1.0./(1.2 + (x - 2).^2 + (y - 6).^2) ...
        + 1.0./(1.2 + (x - 3.5).^2 + (y - 7).^2) + 1.0./(0.7 + (x - 4).^2 + (y - 4).^2) ...
        + 1.0./(1.1 + (x - 5).^2 + (y - 5).^2) + 1.0./(1.1 + (x - 6).^2 + (y - 6).^2) ...
        + 1.0./(1.2 + (x - 7).^2 + (y - 3).^2) + 1.0./(1.0 + (x - 9).^2 + (y - 2).^2) ... 
        + 1.0./(0.45 + (x - 8).^2 + (y - 8).^2) + 1.0./(0.6 + (x - 1).^2 + (y - 1).^2);
%         + 1.0./(0.6 + (x - 8).^2 + (y - 8).^2) + 1.0./(0.6 + (x - 1).^2 + (y - 1).^2);
    f=-f;
end

% MITP 58
if (irun == 58)
    x1=-5:.04:5;
    x2=-5:.04:5;
    [x,y]=meshgrid(x1,x2);
    f = (sin(x + y)-2*cos(2*x+3*y)-3*sin(2*x-y)+4*cos(x-2*y));
    f = 0.2*f;% 
end

%MITP 59
if (irun == 59)
    x1=-5:.1:10;
    x2=0:.1:15;
    [x,y]=meshgrid(x1,x2);
    f = (y - 5/(4*pi^2)*x.^2 + 5/pi*x - 6).^2 + 10*(1 - 1/(8*pi))*cos(x) + 10;
end

%MITP 60
if (irun == 60)
    x1=-100:1:100;
    x2=-100:1:100;
    [x,y]=meshgrid(x1,x2);
    f = -cos(x).*cos(y).*exp(-((x-pi).^2+(y-pi).^2));
end

%MITP 61
if (irun == 61)
    x1=-2:.1:2;
    x2=-2:.1:2;
    [x,y]=meshgrid(x1,x2);        
    f = (1 + ((x+y+1).^2).*(19-14*x+13*x.^2-14*y+6*x.*y+3*y.^2)).* ...
         (30+((2*x-3*y).^2).*(18-32*x+12*x.^2+48*y-36*x.*y+27*y.^2));
end

%MITP 67
if (irun == 67)
    x1=-5:.1:10;
    x2=-5:.1:10;
    [x,y]=meshgrid(x1,x2);        
    f = x.^2+y.^2 + (0.5*x+y).^2 +(0.5*x+y).^4;
end

%MITP 68
if (irun == 68)
    x1=-10:.1:10;
    x2=-10:.1:10;
    [x,y]=meshgrid(x1,x2);        
    f = (cos(2*x+1)+2*cos(3*x+2)+3*cos(4*x+3)+4*cos(5*x+4)+5*cos(6*x+5)).* ...
        (cos(2*y+1)+2*cos(3*y+2)+3*cos(4*y+3)+4*cos(5*y+4)+5*cos(6*y+5));
end

%MITP 75
if (irun == 75)
    x1=-5:.05:10;
    x2=-5:.05:10;
    [x,y]=meshgrid(x1,x2);        
    f = 100*(x.^2 - y).^2 + (x-1).^2;
end

%MITP 78
if (irun == 78)
    x1=-100:1:100;
    x2=-100:1:100;
    [x,y]=meshgrid(x1,x2);        
    f = x.^2+2*y.^2-0.3*cos(3*pi*x)-0.4*cos(4*pi*y)+0.7;
end

%MITP 87
if (irun == 87)
    x1= 0:1:10;
    x2= 0:1:10;
    [x,y]=meshgrid(x1,x2);        
    f = x.^2-0.5*y.^2;
end

%MITP 96
if (irun == 96)
    x1= 0:.01:1;
    x2= 0:.5:1;
    [x,y]=meshgrid(x1,x2);        
    f = sin(40*x).*(-1).^y;
end

figure
% OUTPUT
if (dim == 3)
    surfl(x,y,f);
    hold on
%     plot3(plotxall(:,1),plotxall(:,2),plotxall(:,3),'LineStyle','none','Color','r','Marker','.');
else
    contour(x,y,f);
    hold on
%     plot(plotxall(:,1),plotxall(:,2),'LineStyle','none','Color','r','Marker','.');
end    
% hold off
% grid on;
