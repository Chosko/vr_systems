function h = myGUI(sz)
% V1.1
% myGUI is a simple example of contructing GUI's from the MATLAB
% editor rather then using GIUDE. This example creates a window
% of size sz where sz = [width height]. The quadratic equation has
% been used as a simple model to demonstrate how each of the controls (I
% also refer to these as widgets on occasion).

%if user doesn't specify size, use the following as default
if nargin < 1;sz = [1000 600];end
myGUI_width = sz(1);%GUI width (pixels)
myGUI_height = sz(2);%GUI height (pixels)

padx = 50;%x pading for everything relative to main figure
pady = 45;
ipadx = 5;%x pading between items within the main figure
ipady = 5;
widgetH = 16;%height to make widgets (ie controls)

%add data that needs to be shared and accessed by different controls
%and function to the handles structure "h". This structure will passed
%to each control Callback when executed.
h.width = 1024;%min x value to plot
h.height = 400;%max x value to plot
h.n = 10;%number of values to plot
h.posx = 0;% coeficients for a*x^2+b*x+c
h.posy = 3;% coeficients for a*x^2+b*x+c
h.posz = 4;% coeficients for a*x^2+b*x+c
h.targetx = 0;
h.targety = 0;
h.targetz = 0;

%=======================BEGIN CREATING LAYOUT=============================
%To set the position of a control, you need to specify the following:
%[distance_from_left_edge distance_from_bottom_edge width height]

%create the main figure (mainFig) in middle of screen.
%Store all control handles in structure "h"
scrsz = get(0,'ScreenSize');%get screen size
h.mainFig = figure('Position',[ ...
    (scrsz(3)-myGUI_width)/2, ...
    (scrsz(4)-myGUI_height)/2, ...
    myGUI_width, ...
    myGUI_height]);  
%set(h.mainFig,'MenuBar','None')%Remove default figure menubar
%set(h.mainFig,'ToolBar','None')%Remove default figure toolbar
set(h.mainFig,'Resize','off')%prevent window from being resized
set(h.mainFig,'Name','Camera Test')%prevent window from being resized
%I could have placed all of these inside the above statement where I 
%set the position, but prefer this method as it is easier to read.

%add some axes to plot on
%I have used pixels as the units to describe the position so the 
%padding between the axes and other controls does not change if a 
%bigger window size is used for mainFig
h.axes = axes('Unit','pixel','Position',[padx pady myGUI_width-2*padx myGUI_height-160]);

%add labels for sliders
h.txt_posx = uicontrol('style','text','Position',[padx (myGUI_height-pady-0*(widgetH+ipady)) 3*widgetH widgetH], ...
    'string',['posx= ' num2str(h.posx)]);
h.txt_posy = uicontrol('style','text','Position',[padx (myGUI_height-pady-1*(widgetH+ipady)) 3*widgetH widgetH], ...
    'string',['posy= ' num2str(h.posy)]);
h.txt_posz = uicontrol('style','text','Position',[padx (myGUI_height-pady-2*(widgetH+ipady)) 3*widgetH widgetH], ...
    'string',['posz= ' num2str(h.posz)]);
h.txt_targetx = uicontrol('style','text','Position',[padx (myGUI_height-pady-3*(widgetH+ipady)) 3*widgetH widgetH], ...
    'string',['targx= ' num2str(h.targetx)]);
h.txt_targety = uicontrol('style','text','Position',[padx (myGUI_height-pady-4*(widgetH+ipady)) 3*widgetH widgetH], ...
    'string',['targy= ' num2str(h.targety)]);
h.txt_targetz = uicontrol('style','text','Position',[padx (myGUI_height-pady-5*(widgetH+ipady)) 3*widgetH widgetH], ...
    'string',['targz= ' num2str(h.targetz)]);

%create sliders
%slider StepSize = (max-min)/number_of_steps     ==>(use 40 steps)
slider_width = myGUI_width-(2*padx+3*widgetH+ipadx);%all sliders to be this long
h.slider_posx = uicontrol('style','slider', ...
    'Position',[(padx+3*widgetH+ipadx) (myGUI_height-pady-0*(widgetH+ipady)) slider_width widgetH], ...
    'Min',-10,'Max',10,'Value',h.posx,'SliderStep',[0.025 0.025]);
h.slider_posy = uicontrol('style','slider', ...
    'Position',[(padx+3*widgetH+ipadx) (myGUI_height-pady-1*(widgetH+ipady)) slider_width widgetH], ...
    'Min',-10,'Max',10,'Value',h.posy,'SliderStep',[0.025 0.025]);
h.slider_posz = uicontrol('style','slider', ...
    'Position',[(padx+3*widgetH+ipadx) (myGUI_height-pady-2*(widgetH+ipady)) slider_width widgetH], ...
    'Min',-10,'Max',10,'Value',h.posz,'SliderStep',[0.025 0.025]);
h.slider_targetx = uicontrol('style','slider', ...
    'Position',[(padx+3*widgetH+ipadx) (myGUI_height-pady-3*(widgetH+ipady)) slider_width widgetH], ...
    'Min',-10,'Max',10,'Value',h.targetx,'SliderStep',[0.025 0.025]);
h.slider_targety = uicontrol('style','slider', ...
    'Position',[(padx+3*widgetH+ipadx) (myGUI_height-pady-4*(widgetH+ipady)) slider_width widgetH], ...
    'Min',-10,'Max',10,'Value',h.targety,'SliderStep',[0.025 0.025]);
h.slider_targetz = uicontrol('style','slider', ...
    'Position',[(padx+3*widgetH+ipadx) (myGUI_height-pady-5*(widgetH+ipady)) slider_width widgetH], ...
    'Min',-10,'Max',10,'Value',h.targetz,'SliderStep',[0.025 0.025]);

editH = (myGUI_height-pady-25*(widgetH+ipady));%height to place edit boxes at
%create lables for edit boxes for width height and number of points
boxColour = get(h.mainFig,'Color');%set the background of these boxes the same as mainFig
h.txt_width = uicontrol('style','text','Position',[(padx+0*(widgetH+ipadx)) editH 2*widgetH widgetH], ...
    'string','width=','HorizontalAlignment','right','BackgroundColor',boxColour);
h.txt_height = uicontrol('style','text','Position',[(padx+5*(widgetH+ipadx)) editH 2*widgetH widgetH], ...
    'string','heigth=','HorizontalAlignment','right','BackgroundColor',boxColour);
h.txt_N = uicontrol('style','text','Position',[(padx+10*(widgetH+ipadx)) editH 2*widgetH widgetH], ...
    'string','n=','HorizontalAlignment','right','BackgroundColor',boxColour);

%create edit boxes for width height and number of points
h.edit_width = uicontrol('style','edit','Position',[(padx+2*(widgetH+ipadx)) editH 2*widgetH widgetH], ...
    'string',h.width,'HorizontalAlignment','left','BackgroundColor',boxColour);
h.edit_height = uicontrol('style','edit','Position',[(padx+7*(widgetH+ipadx)) editH 2*widgetH widgetH], ...
    'string',h.height,'HorizontalAlignment','left','BackgroundColor',boxColour);
h.edit_n = uicontrol('style','edit','Position',[(padx+12*(widgetH+ipadx)) editH 2*widgetH widgetH], ...
    'string',h.n,'HorizontalAlignment','left','BackgroundColor',boxColour);
%=======================END CREATING LAYOUT=============================

%=======================BEGIN SETTING CALBACKS=============================
%set callbacks for sliders
set(h.slider_posx,'callback',{@slider_posx_Callback h});
set(h.slider_posy,'callback',{@slider_posy_Callback h});
set(h.slider_posz,'callback',{@slider_posz_Callback h});
set(h.slider_targetx,'callback',{@slider_targetx_Callback h});
set(h.slider_targety,'callback',{@slider_targety_Callback h});
set(h.slider_targetz,'callback',{@slider_targetz_Callback h});
%set callbacks for edit boxes
set(h.edit_width,'callback',{@edit_width_Callback h});
set(h.edit_height,'callback',{@edit_height_Callback h});
set(h.edit_n,'callback',{@edit_n_Callback h});
%=======================END SETTING CALBACKS=============================

guidata(h.mainFig,h)%update the entire handle structure to include everything defined above
updatePlot(h);%plot the default values initially

%=======================BEGIN DEFINING CALBACKS=============================
function slider_posx_Callback(hObject, eventdata, h)
h = guidata(hObject);%get the entire handle structure for the GUI
val = get(hObject,'Value');%get the value from the slider
str = sprintf('posx=%0.1f',val);%create a string
set(h.txt_posx,'String',str);%put string in text box for a
h.posx = val;%update handles
guidata(hObject,h);%update entire handle structure
updatePlot(h);%replot

function slider_posy_Callback(hObject, eventdata, h)
h = guidata(hObject);
val = get(hObject,'Value');
str = sprintf('posy=%0.1f',val);
set(h.txt_posy,'String',str);
h.posy = val;
guidata(hObject,h);
updatePlot(h);

function slider_posz_Callback(hObject, eventdata, h)
h = guidata(hObject);
val = get(hObject,'Value');
str = sprintf('posz=%0.1f',val);
set(h.txt_posz,'String',str);
h.posz = val;
guidata(hObject,h);
updatePlot(h);

function slider_targetx_Callback(hObject, eventdata, h)
h = guidata(hObject);%get the entire handle structure for the GUI
val = get(hObject,'Value');%get the value from the slider
str = sprintf('targx=%0.1f',val);%create a string
set(h.txt_targetx,'String',str);%put string in text box for a
h.targetx = val;%update handles
guidata(hObject,h);%update entire handle structure
updatePlot(h);%replot

function slider_targety_Callback(hObject, eventdata, h)
h = guidata(hObject);
val = get(hObject,'Value');
str = sprintf('targy=%0.1f',val);
set(h.txt_targety,'String',str);
h.targety = val;
guidata(hObject,h);
updatePlot(h);

function slider_targetz_Callback(hObject, eventdata, h)
h = guidata(hObject);
val = get(hObject,'Value');
str = sprintf('targz=%0.1f',val);
set(h.txt_targetz,'String',str);
h.targetz = val;
guidata(hObject,h);
updatePlot(h);

function edit_width_Callback(hObject, eventdata, h)
h = guidata(hObject);%get the entire handle structure for the GUI
width = str2double(get(hObject,'String'));%get the value of the box
h.width = width;%update handles
guidata(hObject,h)%update entire handle structure
updatePlot(h);%replot

function edit_height_Callback(hObject, eventdata, h)
h = guidata(hObject);
height = str2double(get(hObject,'String'));
h.height = height;
guidata(hObject,h)
updatePlot(h);

function edit_n_Callback(hObject, eventdata, h)
h = guidata(hObject);
n = str2double(get(hObject,'String'));
h.n = n;
guidata(hObject,h)
updatePlot(h);
%=======================END DEFINING CALBACKS=============================

function updatePlot(h)
%This is the function that that makes use off all data that 
%has been stored by the controls in the GUI
%[P,F] = pyramid(h.n);
[P,F] = pyramid(h.n);
W = h.width;
H = h.height;
FOV = pi/3;
position = [h.posx,h.posy,h.posz];
target = [h.targetx,h.targety,h.targetz];
POV_translation = [0,0,0];
h = guidata(h.mainFig);%get the entire handle structure for the GUI
cla(h.axes);
render(P,F,'flat',position,target,W,H,FOV,POV_translation);