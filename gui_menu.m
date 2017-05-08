function varargout = gui_menu(varargin)
% GUI_MENU MATLAB code for gui_menu.fig
%      GUI_MENU, by itself, creates a new GUI_MENU or raises the existing
%      singleton*.
%
%      H = GUI_MENU returns the handle to a new GUI_MENU or the handle to
%      the existing singleton*.
%
%      GUI_MENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_MENU.M with the given input arguments.
%
%      GUI_MENU('Property','Value',...) creates a new GUI_MENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_menu

% Last Modified by GUIDE v2.5 20-Apr-2015 18:42:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_menu_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_menu_OutputFcn, ...
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
end

% --- Executes just before gui_menu is made visible.
function gui_menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_menu (see VARARGIN)

% Choose default command line output for gui_menu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = gui_menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on button press in gb_tr.
function gb_tr_Callback(hObject, eventdata, handles)
% hObject    handle to gb_tr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

gb_full();

end

% --- Executes on button press in st_tr.
function st_tr_Callback(hObject, eventdata, handles)
% hObject    handle to st_tr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

DCT_full();

end

% --- Executes on button press in hb_tr.
function hb_tr_Callback(hObject, eventdata, handles)
% hObject    handle to hb_tr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

DWT_full();
end

% --- Executes on button press in Load_image.
function Load_image_Callback(hObject, eventdata, handles)
% hObject    handle to Load_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img= ('C:\Users\KriahnaPramod\Desktop\Menu Interface\lion.jpg');
figure(1);
imshow(img);


end
