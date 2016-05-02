function varargout = ejemplillo(varargin)
% EJEMPLILLO MATLAB code for ejemplillo.fig
%      EJEMPLILLO, by itself, creates a new EJEMPLILLO or raises the existing
%      singleton*.
%
%      H = EJEMPLILLO returns the handle to a new EJEMPLILLO or the handle to
%      the existing singleton*.
%
%      EJEMPLILLO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EJEMPLILLO.M with the given input arguments.
%
%      EJEMPLILLO('Property','Value',...) creates a new EJEMPLILLO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ejemplillo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ejemplillo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ejemplillo

% Last Modified by GUIDE v2.5 01-May-2016 20:35:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ejemplillo_OpeningFcn, ...
                   'gui_OutputFcn',  @ejemplillo_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ejemplillo is made visible.
function ejemplillo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ejemplillo (see VARARGIN)
puerto='COM';
for i=0:1:100;
   
    try 
        puerto = strcat(puerto,num2str(i));
        a = arduino(puerto);
        a.pinMode(3, 'output');
        handles.a = a;
        set(handles.estado,'String', 'CONECTADO');
        set(handles.encender,'Enable', 'on');
        break
    catch 
        set(handles.estado,'String', 'No hay conexión');
        set(handles.encender,'Enable', 'off');
        puerto = 'COM';
%        
    end
end

% Choose default command line output for ejemplillo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes ejemplillo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ejemplillo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in encender.
function encender_Callback(hObject, eventdata, handles)
% hObject    handle to encender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    handles.a.digitalWrite(3,1);
    set(handles.encender,'String', 'on');


% --- Executes on button press in salir.
function salir_Callback(hObject, eventdata, handles)
% hObject    handle to salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


% --- Executes on button press in encender.
function encender_Callback(hObject, eventdata, handles)
% hObject    handle to encender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
