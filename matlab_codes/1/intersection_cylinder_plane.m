% [] = intersection_cylinder_plane()
% plots the intersection of a hard-coded cylinder and a plane
%
% we'll intersect x^2+y^2-1=0 with y+z=2
%
% the function for the intersection is also hardcoded
%
% danielle amethyst brake
% university of wisconsin -- eau claire
% spring 2019
%
%     This file is part of the Matlab code for Spring 2019 Differential Geometry.
% 
%     Foobar is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     Foobar is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this code.  If not, see <https://www.gnu.org/licenses/>.

function [] = intersection_cylinder_plane()

% stands for clear axis, clears the current axis (not explicitly
% represented)
cla % i hate this, but the isosurface command doesn't respect hold.
	% so we have to clear the axes.  turning hold off usually does it.
	% i guess we could render the curve first, but meh.  whatever, matlab.

hold off %isosurface ignores this, ugh.
plot_surfaces()



% finally, plot the isection curve
hold on %so that the curve will plot in addition to the two surfaces
plot_curve()

finalize()


hold off


end


function plot_surfaces()

a = 1.5; % parameterize all the things
b = -.5;
c = 3.5;

n = 100; % the number of points in the space discretization

% discretize space for the surfaces
[X,Y,Z] = meshgrid(linspace(-a,a,n),linspace(-a,a,n),linspace(b,c,n));



cylfv = isosurface(X,Y,Z,X.^2+Y.^2-1,0);
cyl = patch(cylfv);
set(cyl,'FaceColor',[0.9 0.8 0.8],'EdgeColor','none','FaceAlpha',0.9);


plafv = isosurface(X,Y,Z,Z+Y-2,0);
pla = patch(plafv);
set(pla,'FaceColor',[0.8 0.9 0.9],'EdgeColor','none','FaceAlpha',0.3);


end


function plot_curve()

t = linspace(-pi,pi,100); % discretize the interval for the curve

x = cos(t);
y = sin(t);
z = 2-sin(t);

h = plot3(x,y,z);
set(h,'LineWidth',3);

end


function finalize()

view(3)
xlabel('x');
ylabel('y');
zlabel('z');
end