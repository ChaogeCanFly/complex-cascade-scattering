function PP = PhasePlot(z,f,cs,pres,t,h)
% phase plot of complex function f(z)
%
% Usage: PhasePlot(z,f,cs,pres)
%
% z    - complex field of arguments
% f    - complex field of values f(z)
% cs   - color scheme (optional)
%        call 'help colscheme' to see a list of available color schemes 
%        call 'PPDemo' to see a demonstration of all color schemes 
% pres - number of jumps in phase (optional)

% Extended Usage: PP = PhasePlot(z,f,cs,pres,t,h)
% t    - positions of jumps at unit circle (optional)
% h    - height (z-axis) in which the plot is displayed (otional)
% PP   - handle to colored surface

% Part of the Complex Function Explorer (former Phase Plot) package 
% Version 1.1, February 1, 2014
% Copyright(c) 2012-2014 by Elias Wegert (elias@wegert.com, www.wegert.com)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin==6 && ~isempty(t)
  PP = pltphase(z,f,cs,t,pres,h); 

elseif nargin==6 && isempty(t)
  t  = unitcirc(20);  
  PP = pltphase(z,f,cs,t,pres,h); 

elseif nargin==5
  PP = pltphase(z,f,cs,t,pres); 

elseif nargin==4

  if strcmp(cs,'j') && length(pres)>1
    PP = pltphase(z,f,cs,pres); 
  
  else
    PP = pltphase(z,f,cs,[],pres);
  
  end
  
elseif nargin==3
  PP = pltphase(z,f,cs);

elseif nargin==2
  PP = pltphase(z,f); 

else
  disp('PhasePlot(z,f) - phase plot of complex function f(z)')
  disp('  call as PhasePlot(z,f,colorscheme) for changing color options');
  disp('  call PPColorScheme to see a list of implemented color schemes');
  disp('  call PPDemo for a demonstration');

  return
end

%axis equal
view(0,90)

