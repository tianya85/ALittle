-- ALittle Generate Lua And Do Not Edit This Line!
do
if _G.ALittle == nil then _G.ALittle = {} end
local ___pairs = pairs
local ___ipairs = ipairs


ALittle.UIEnumTypes = {
	FLIP_NONE = 0,
	FLIP_H = 1,
	FLIP_V = 2,
	FLIP_HV = 3,
	POS_ABS = 1,
	POS_ALIGN_STARTING = 2,
	POS_ALIGN_CENTER = 3,
	POS_ALIGN_ENDING = 4,
	POS_PERCENT_STARTING = 7,
	POS_PERCENT_CENTER = 8,
	POS_PERCENT_ENDING = 9,
	SIZE_ABS = 1,
	SIZE_PERCENT = 2,
	SIZE_MARGIN = 4,
	HALIGN_LEFT = 0,
	HALIGN_CENTER = 1,
	HALIGN_RIGHT = 2,
	VALIGN_TOP = 0,
	VALIGN_CENTER = 1,
	VALIGN_BOTTOM = 2,
	TYPE_H = 1,
	TYPE_V = 2,
	DIR_UP = 1,
	DIR_DOWN = 2,
	DIR_LEFT = 3,
	DIR_RIGHT = 4,
	FREE = 1,
	FIXED = 2,
	SELECT_NONE = 0,
	SELECT_FILE = 1,
	SELECT_DIR = 2,
	KMOD_NONE = 0x0000,
	KMOD_LSHIFT = 0x0001,
	KMOD_RSHIFT = 0x0002,
	KMOD_LCTRL = 0x0040,
	KMOD_RCTRL = 0x0080,
	KMOD_LALT = 0x0100,
	KMOD_RALT = 0x0200,
	KMOD_LGUI = 0x0400,
	KMOD_RGUI = 0x0800,
	KMOD_NUM = 0x1000,
	KMOD_CAPS = 0x2000,
	KMOD_MODE = 0x4000,
	KMOD_RESERVED = 0x8000,
	KMOD_CTRL = 0x00c0,
	KMOD_SHIFT = 0x0003,
	KMOD_ALT = 0x0300,
	KMOD_GUI = 0x0c00,
	KEY_ESC = 27,
	KEY_Z = 122,
	KEY_S = 115,
	KEY_N = 110,
	KEY_X = 120,
	KEY_C = 99,
	KEY_V = 118,
	KEY_A = 97,
	KEY_F = 102,
	KEY_G = 103,
	KEY_F2 = 1073741883,
	KEY_F5 = 1073741886,
	KEY_F12 = 1073741893,
	KEY_CTRL = 1073742048,
	KEY_LEFT = 1073741904,
	KEY_RIGHT = 1073741903,
	KEY_UP = 1073741906,
	KEY_DOWN = 1073741905,
	KEY_BACKSPACE = 8,
	KEY_DELETE = 127,
	KEY_HOME = 1073741898,
	KEY_END = 1073741901,
	KEY_ENTER = 13,
	KEY_NUMBER_ENTER = 1073741912,
	KEY_TAB = 9,
	VIEW_FULLSCREEN = 0x00000001,
	VIEW_OPENGL = 0x00000002,
	VIEW_SHOWN = 0x00000004,
	VIEW_HIDDEN = 0x00000008,
	VIEW_BORDERLESS = 0x00000010,
	VIEW_RESIZABLE = 0x00000020,
	VIEW_MINIMIZED = 0x00000040,
	VIEW_MAXIMIZED = 0x00000080,
	VIEW_INPUT_GRABBED = 0x00000100,
	VIEW_INPUT_FOCUS = 0x00000200,
	VIEW_MOUSE_FOCUS = 0x00000400,
	VIEW_FULLSCREEN_DESKTOP = 0x00001001,
	VIEW_FOREIGN = 0x00000800,
	VIEW_ALLOW_HIGHDPI = 0x00002000,
	VIEW_MOUSE_CAPTURE = 0x00004000,
	VIEW_SHAPED_WINDOW = 0x10000000,
}

end