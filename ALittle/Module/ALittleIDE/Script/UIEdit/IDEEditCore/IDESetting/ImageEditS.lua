-- ALittle Generate Lua
module("ALittleIDE", package.seeall)

local ___thispath = select('1', ...):match("(.+[/\\]).+$") or ""
local ___rawset = rawset
local ___pairs = pairs
local ___ipairs = ipairs


assert(ALittleIDE.TextEditS, " extends class:ALittleIDE.TextEditS is nil")
ImageEditS = Lua.Class(ALittleIDE.TextEditS, "ALittleIDE.ImageEditS")

function ImageEditS:Ctor(user_info, tab_child, tree_logic)
	___rawset(self, "_layer_name", "ide_setting_imageedit")
end

function ImageEditS:LoadNatureBase()
	TextEditS.LoadNatureBase(self)
	self:LoadValueData("margin_left")
	self:LoadValueData("margin_right")
	self:LoadValueData("margin_top")
	self:LoadValueData("margin_bottom")
	self:LoadValueData("ims_padding")
	self:LoadShowTypeDataForImage("show_up")
	self:LoadShowTypeDataForImage("show_over")
	self:LoadShowTypeDataForImage("show_down")
	self:LoadShowTypeDataForImage("show_disabled")
end

function ImageEditS:HandleMarginLeftFOCUSOUT(event)
	self:ValueNumInputChange("margin_left", false)
end

function ImageEditS:HandleMarginRightFOCUSOUT(event)
	self:ValueNumInputChange("margin_right", false)
end

function ImageEditS:HandleMarginTopFOCUSOUT(event)
	self:ValueNumInputChange("margin_top", false)
end

function ImageEditS:HandleMarginBottomFOCUSOUT(event)
	self:ValueNumInputChange("margin_bottom", false)
end

function ImageEditS:HandleImsPaddingFOCUSOUT(event)
	self:ValueNumInputChange("ims_padding", false)
end

function ImageEditS:HandleShowUpFOCUSOUT(event)
	if event.target._user_data ~= nil then
		if event.target._user_data == event.target.text then
			return
		end
		event.target._user_data = event.target.text
	end
	self:RemoverToNilShowSetForImage("show_up", self._show_up.text, self._show_up_grid9.selected, false)
end

function ImageEditS:HandleShowUpSelect(event)
	local func = Lua.Bind(self.ImagePathSelectCallback, self, "show_up", self.HandleShowUpFOCUSOUT, nil)
	g_IDEAttrImageDialog:ShowDialog(nil, func)
end

function ImageEditS:HandleShowOverFOCUSOUT(event)
	if event.target._user_data ~= nil then
		if event.target._user_data == event.target.text then
			return
		end
		event.target._user_data = event.target.text
	end
	self:RemoverToNilShowSetForImage("show_over", self._show_over.text, self._show_over_grid9.selected, false)
end

function ImageEditS:HandleShowOverSelect(event)
	local func = Lua.Bind(self.ImagePathSelectCallback, self, "show_over", self.HandleShowOverFOCUSOUT, nil)
	g_IDEAttrImageDialog:ShowDialog(nil, func)
end

function ImageEditS:HandleShowDownFOCUSOUT(event)
	if event.target._user_data ~= nil then
		if event.target._user_data == event.target.text then
			return
		end
		event.target._user_data = event.target.text
	end
	self:RemoverToNilShowSetForImage("show_down", self._show_down.text, self._show_down_grid9.selected, false)
end

function ImageEditS:HandleShowDownSelect(event)
	local func = Lua.Bind(self.ImagePathSelectCallback, self, "show_down", self.HandleShowDownFOCUSOUT, nil)
	g_IDEAttrImageDialog:ShowDialog(nil, func)
end

function ImageEditS:HandleShowDisabledFOCUSOUT(event)
	if event.target._user_data ~= nil then
		if event.target._user_data == event.target.text then
			return
		end
		event.target._user_data = event.target.text
	end
	self:RemoverToNilShowSetForImage("show_disabled", self._show_disabled.text, self._show_disabled_grid9.selected, false)
end

function ImageEditS:HandleShowDisabledSelect(event)
	local func = Lua.Bind(self.ImagePathSelectCallback, self, "show_disabled", self.HandleShowDisabledFOCUSOUT, nil)
	g_IDEAttrImageDialog:ShowDialog(nil, func)
end

