function SplashScreen(action)

if ~isempty(findobj('Tag','SplashScreen'))
   figure(findobj('Tag','SplashScreen'));
   return
end

% show splash screen
SS = get(0,'screensize');
if ispc
   Width = 0.8*0.81*0.92*SS(3);
   Height = 0.8*0.9*0.88*SS(4);
   Position = [0.254*SS(3) 0.186*SS(4) Width Height];
else
   Width = 0.84*0.81*0.92*SS(3);
   Height = 0.81*0.9*0.88*SS(4);
   Position = [0.24*SS(3) 0.186*SS(4) Width Height];
end

% create window
figure('NumberTitle','off',...
    'Color','w',...
    'MenuBar','none',...
    'Tag','SplashScreen',...
    'Position',Position);

uicontrol('Style','text', ...
   'Units','normalized', ...
   'Position',[0.1 0.75 0.8 0.2], ...
   'String','OpenFresco Express', ...
   'FontUnits','normalized','FontWeight','bold','FontSize',0.50,'FontName','Arial',...
   'BackgroundColor','w','ForegroundColor',rand(3,1),'Horizontal','center');
uicontrol('Style','text', ...
   'Units','normalized', ...
   'Position',[0.1 0.773 0.8 0.05], ...
   'String','Release 1.0: May 2011', ...
   'FontUnits','normalized','FontWeight','bold','FontSize',0.65,'FontName','Arial', ...
   'BackgroundColor','w','ForegroundColor','r','Horizontal','center');
uicontrol('Style','text', ...
   'Units','normalized', ...
   'Position',[0.1 0.51 0.8 0.2], ...
   'String',sprintf('Developed by'),...
   'FontUnits','normalized','FontWeight','bold','FontSize',0.15,'FontName','Arial', ...
   'BackgroundColor','w','ForegroundColor','k','Horizontal','center');
uicontrol('Style','text', ...
   'Units','normalized', ...
   'Position',[0.06 0.495 0.28 0.15], ...
   'String',sprintf('Andreas Schellenberg, Ph.D., P.E.\nDep. of Civil and Env. Eng.\nUniversity of California, Berkeley'),...
   'FontUnits','normalized','FontWeight','bold','FontSize',0.177,'FontName','Arial', ...
   'BackgroundColor','w','ForegroundColor',[0,0,0.8],'Horizontal','center');
uicontrol('Style','text', ...
   'Units','normalized', ...
   'Position',[0.36 0.495 0.28 0.15], ...
   'String',sprintf('Carl Misra, M.S.\nDep. of Civil and Env. Eng.\nUniversity of California, Berkeley'),...
   'FontUnits','normalized','FontWeight','bold','FontSize',0.177,'FontName','Arial', ...
   'BackgroundColor','w','ForegroundColor',[0,0,0.8],'Horizontal','center');
uicontrol('Style','text', ...
   'Units','normalized', ...
   'Position',[0.664 0.495 0.28 0.15], ...
   'String',sprintf('Stephen Mahin, Ph.D.\nDep. of Civil and Env. Eng.\nUniversity of California, Berkeley'),...
   'FontUnits','normalized','FontWeight','bold','FontSize',0.177,'FontName','Arial', ...
   'BackgroundColor','w','ForegroundColor',[0,0,0.8],'Horizontal','center');
uicontrol('Style','text', ...
   'Units','normalized', ...
   'Position',[0.1 0.39 0.8 0.1], ...
   'String',sprintf('OpenFresco Express is supported by funds from'), ...
   'FontUnits','normalized','FontWeight','bold','FontSize',0.3,'FontName','Arial', ...
   'BackgroundColor','w','ForegroundColor','k','Horizontal','center');
uicontrol('Style','text', ...
   'Units','normalized', ...
   'Position',[0.1 0.33 0.8 0.10], ...
   'String',sprintf('The Pacific Earthquake Engineering Research (PEER) Center\nMTS Systems Corporation (MTS)'), ...
   'FontUnits','normalized','FontWeight','bold','FontSize',0.27,'FontName','Arial', ...
   'BackgroundColor','w','ForegroundColor',[0,0,0.8],'Horizontal','center');
uicontrol('Style','text', ...
   'Units','normalized', ...
   'Position',[0.1 0.0 0.8 0.05], ...
   'String',sprintf('(C) Copyright 2010, PEER & MTS. All Rights Reserved.'),...
   'FontUnits','normalized','FontWeight','bold','FontSize',0.5,'FontName','Arial', ...
   'BackgroundColor','w','ForegroundColor','k','Horizontal','center');

% load PEER logo
axes('Position',[0.28 0.12 0.19 0.19],...
   'Color','white','XTick',[],'YTick',[]);
banner = imread(which('PEERBoldWhite.png'));
image(banner);
axis equal; axis off;

% load MTS logo
axes('Position',[0.567 0.15 0.13 0.13],...
   'Color','white','XTick',[],'YTick',[]);
banner = imread(which('MTSWhite.png'));
image(banner);
axis equal; axis off;

switch action
   case 'startup'
      set(findobj('Tag','SplashScreen'),'CloseRequestFcn','');
      pause(0.25);
      figure(findobj('Tag','SplashScreen'));
      pause(2.5);
      delete(findobj('Tag','SplashScreen'));
   case 'about'
      % do nothing
end
