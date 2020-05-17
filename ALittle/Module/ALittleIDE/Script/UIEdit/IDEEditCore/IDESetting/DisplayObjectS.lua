-- ALittle Generate Lua And Do Not Edit This Line!
module("ALittleIDE", package.seeall)

local ___rawset = rawset
local ___pairs = pairs
local ___ipairs = ipairs


DisplayObjectS = Lua.Class(nil, "ALittleIDE.DisplayObjectS")

function DisplayObjectS:Ctor(user_info, tab_child, tree_logic)
	___rawset(self, "_layer_name", "ide_setting_displayobject")
	___rawset(self, "_base", user_info.base)
	___rawset(self, "_default", user_info.default)
	___rawset(self, "_object", user_info.object)
	___rawset(self, "_tab_child", tab_child)
	___rawset(self, "_tree_logic", tree_logic)
end

function DisplayObjectS.__getter:base()
	return self._base
end

function DisplayObjectS.__getter:default()
	return self._default
end

function DisplayObjectS.__getter:x_value()
	return self._x_value
end

function DisplayObjectS.__getter:y_value()
	return self._y_value
end

function DisplayObjectS.__getter:width_value()
	return self._width_value
end

function DisplayObjectS.__getter:height_value()
	return self._height_value
end

function DisplayObjectS.__getter:title()
	return self._default.__class
end

function DisplayObjectS.__getter:layer()
	if self._layer == nil then
		self._layer = g_Control:CreateControl(self._layer_name, self)
		self:LoadNatureBase()
	end
	return self._layer
end

function DisplayObjectS:LoadNatureBase()
	self:LoadEnumData("x_type", g_IDEEnum.xy_type)
	if self._default.x == 0 then
		if self._base.x ~= nil then
			self._x_value.text = self._base.x
		elseif self._base.x_value ~= nil then
			self._x_value.text = self._base.x_value
		elseif self._default.x_value ~= nil then
			self._x_value.text = self._default.x_value
		end
	elseif self._default.x_value == 0 then
		if self._base.x ~= nil then
			self._x_value.text = self._base.x
		elseif self._base.x_value ~= nil then
			self._x_value.text = self._base.x_value
		elseif self._default.x ~= nil then
			self._x_value.text = self._default.x
		end
	elseif self._default.x ~= 0 and self._default.x_value ~= 0 then
		ALittle.Log("x value error")
	end
	self:LoadEnumData("y_type", g_IDEEnum.xy_type)
	if self._default.y == 0 then
		if self._base.y ~= nil then
			self._y_value.text = self._base.y
		elseif self._base.y_value ~= nil then
			self._y_value.text = self._base.y_value
		elseif self._default.y_value ~= nil then
			self._y_value.text = self._default.y_value
		end
	elseif self._default.y_value == 0 then
		if self._base.y ~= nil then
			self._y_value.text = self._base.y
		elseif self._base.y_value ~= nil then
			self._y_value.text = self._base.y_value
		elseif self._default.y ~= nil then
			self._y_value.text = self._default.y
		end
	elseif self._default.y ~= 0 and self._default.y_value ~= 0 then
		ALittle.Log("y value error")
	end
	self:LoadEnumData("width_type", g_IDEEnum.wh_type)
	if self._default.width == 0 then
		if self._base.width ~= nil then
			self._width_value.text = self._base.width
		elseif self._base.width_value ~= nil then
			self._width_value.text = self._base.width_value
		elseif self._default.width_value ~= nil then
			self._width_value.text = self._default.width_value
		end
	elseif self._default.width_value == 0 then
		if self._base.width ~= nil then
			self._width_value.text = self._base.width
		elseif self._base.width_value ~= nil then
			self._width_value.text = self._base.width_value
		elseif self._default.width ~= nil then
			self._width_value.text = self._default.width
		end
	elseif self._default.width ~= 0 and self._default.width_value ~= 0 then
		ALittle.Log("width value error")
	end
	self:LoadEnumData("height_type", g_IDEEnum.wh_type)
	if self._default.height == 0 then
		if self._base.height ~= nil then
			self._height_value.text = self._base.height
		elseif self._base.height_value ~= nil then
			self._height_value.text = self._base.height_value
		elseif self._default.height_value ~= nil then
			self._height_value.text = self._default.height_value
		end
	elseif self._default.height_value == 0 then
		if self._base.height ~= nil then
			self._height_value.text = self._base.height
		elseif self._base.height_value ~= nil then
			self._height_value.text = self._base.height_value
		elseif self._default.height ~= nil then
			self._height_value.text = self._default.height
		end
	elseif self._default.height ~= 0 and self._default.height_value ~= 0 then
		ALittle.Log("height value error")
	end
	self:LoadColorData("red")
	self:LoadColorData("green")
	self:LoadColorData("blue")
	self:LoadColorData("alpha")
	self:LoadValueData("scale_x")
	self:LoadValueData("scale_y")
	self:LoadValueData("center_x")
	self:LoadValueData("center_y")
	self:LoadValueData("angle")
	self:LoadBoolData("hand_cursor", false, g_IDEEnum.yn_type)
	self:LoadBoolData("visible", true, g_IDEEnum.yn_type)
	self:LoadBoolData("disabled", true, g_IDEEnum.yn_type)
	self:LoadDefaultNilString("__link")
	self:LoadShowTypeData("__event")
	self:LoadShowTypeDataForTargetClass("__target_class")
	self:LoadDefaultNilString("description")
	self._target_class_dropdown.text = ""
	self._link_dropdown.text = ""
end

function DisplayObjectS:HandleCommonInputFOCUSIN(event)
	event.target._user_data = event.target.text
end

function DisplayObjectS:SetXType(x_type, revoke_bind)
	if x_type == nil then
		return
	end
	self._x_type.text = g_IDEEnum.xy_type[x_type]
	local list = g_IDEEnum.xy_rtype
	self:TypeSelectChange("x_type", list, true, revoke_bind)
end

function DisplayObjectS:HandleXTypeSELECT_CHANGE(event)
	local object = self._object
	local target_x = object.x
	local new_x = target_x
	local list = g_IDEEnum.xy_rtype
	local revoke_bind = IDERevokeBind()
	self:TypeSelectChange("x_type", list, true, revoke_bind)
	if object.x_type == 1 then
		new_x = target_x
	elseif object.x_type == 2 then
		new_x = target_x
	elseif object.x_type == 3 then
		new_x = target_x - (object.show_parent.width - object.width) / 2
	elseif object.x_type == 4 then
		new_x = object.show_parent.width - object.width - target_x
	elseif object.x_type == 7 then
		if object.show_parent.width == 0 then
			new_x = 0
		else
			new_x = target_x / object.show_parent.width
		end
	elseif object.x_type == 8 then
		if object.show_parent.width == 0 then
			new_x = 0
		else
			new_x = (target_x - (object.show_parent.width - object.width) / 2) / object.show_parent.width
		end
	elseif object.x_type == 9 then
		if object.show_parent.width - object.width == 0 then
			new_x = 0
		else
			new_x = 1 - target_x / (object.show_parent.width - object.width)
		end
	end
	self:SetXValue(new_x, revoke_bind)
	self._tab_child.revoke_list:PushRevoke(revoke_bind)
end

function DisplayObjectS:SetYType(y_type, revoke_bind)
	if y_type == nil then
		return
	end
	self._y_type.text = g_IDEEnum.xy_type[y_type]
	local list = g_IDEEnum.xy_rtype
	self:TypeSelectChange("y_type", list, true, revoke_bind)
end

function DisplayObjectS:HandleYTypeSELECT_CHANGE(event)
	local object = self._object
	local target_y = object.y
	local new_y = target_y
	local list = g_IDEEnum.xy_rtype
	local revoke_bind = IDERevokeBind()
	self:TypeSelectChange("y_type", list, true, revoke_bind)
	if object.y_type == 1 then
		new_y = target_y
	elseif object.y_type == 2 then
		new_y = target_y
	elseif object.y_type == 3 then
		new_y = target_y - (object.show_parent.height - object.height) / 2
	elseif object.y_type == 4 then
		new_y = object.show_parent.height - object.height - target_y
	elseif object.y_type == 7 then
		if object.show_parent.height == 0 then
			new_y = 0
		else
			new_y = target_y / object.show_parent.height
		end
	elseif object.y_type == 8 then
		if object.show_parent.height == 0 then
			new_y = 0
		else
			new_y = (target_y - (object.show_parent.height - object.height) / 2) / object.show_parent.height
		end
	elseif object.y_type == 9 then
		if object.show_parent.height - object.height == 0 then
			new_y = 0
		else
			new_y = 1 - target_y / (object.show_parent.height - object.height)
		end
	end
	self:SetYValue(new_y, revoke_bind)
	self._tab_child.revoke_list:PushRevoke(revoke_bind)
end

function DisplayObjectS:SetWType(width_type, revoke_bind)
	if width_type == nil then
		return
	end
	self._width_type.text = g_IDEEnum.wh_type[width_type]
	local list = g_IDEEnum.wh_rtype
	self:TypeSelectChange("width_type", list, true, revoke_bind)
end

function DisplayObjectS:HandleWTypeSELECT_CHANGE(event)
	local list = g_IDEEnum.wh_rtype
	self:TypeSelectChange("width_type", list, true)
end

function DisplayObjectS:SetHType(height_type, revoke_bind)
	if height_type == nil then
		return
	end
	self._height_type.text = g_IDEEnum.wh_type[height_type]
	local list = g_IDEEnum.wh_rtype
	self:TypeSelectChange("height_type", list, true, revoke_bind)
end

function DisplayObjectS:HandleHTypeSELECT_CHANGE(event)
	local list = g_IDEEnum.wh_rtype
	self:TypeSelectChange("height_type", list, true)
end

function DisplayObjectS:SetXValue(x_value, revoke_bind)
	if x_value == nil then
		return
	end
	self._x_value.text = x_value
	self._base.x = nil
	self:ValueNumInputChange("x_value", true, revoke_bind)
end

function DisplayObjectS:HandleXValueFOCUSOUT(event)
	self._base.x = nil
	self:ValueNumInputChange("x_value", true)
end

function DisplayObjectS:HandleXValueMoveIn(event)
	ALittle.System_SetHDragCursor()
end

function DisplayObjectS:HandleXValueMoveOut(event)
	ALittle.System_SetNormalCursor()
end

function DisplayObjectS:HandleXValueTabKey(event)
	self._y_value.focus = true
	self._y_value:SelectAll()
end

function DisplayObjectS:HandleXValueDrag(event)
	local value = ALittle.Math_ToDouble(self._x_value.text)
	if value == nil then
		value = 0
	end
	value = value + event.delta_x
	self._x_value.text = value
	self:ValueNumInputChange("x_value", true)
end

function DisplayObjectS:SetYValue(y_value, revoke_bind)
	if y_value == nil then
		return
	end
	self._y_value.text = y_value
	self._base.y = nil
	self:ValueNumInputChange("y_value", true, revoke_bind)
end

function DisplayObjectS:HandleYValueFOCUSOUT(event)
	self._base.y = nil
	self:ValueNumInputChange("y_value", true)
end

function DisplayObjectS:HandleYValueMoveIn(event)
	ALittle.System_SetHDragCursor()
end

function DisplayObjectS:HandleYValueMoveOut(event)
	ALittle.System_SetNormalCursor()
end

function DisplayObjectS:HandleYValueTabKey(event)
	self._width_value.focus = true
	self._width_value:SelectAll()
end

function DisplayObjectS:HandleYValueDrag(event)
	local value = ALittle.Math_ToDouble(self._y_value.text)
	if value == nil then
		value = 0
	end
	value = value + event.delta_x
	self._y_value.text = value
	self:ValueNumInputChange("y_value", true)
end

function DisplayObjectS:SetWValue(width_value, revoke_bind)
	if width_value == nil then
		return
	end
	self._width_value.text = width_value
	self._base.width = nil
	self:ValueNumInputChange("width_value", true, revoke_bind)
end

function DisplayObjectS:HandleWValueFOCUSOUT(event)
	self._base.width = nil
	self:ValueNumInputChange("width_value", true)
end

function DisplayObjectS:HandleWValueMoveIn(event)
	ALittle.System_SetHDragCursor()
end

function DisplayObjectS:HandleWValueMoveOut(event)
	ALittle.System_SetNormalCursor()
end

function DisplayObjectS:HandleWValueTabKey(event)
	self._height_value.focus = true
	self._height_value:SelectAll()
end

function DisplayObjectS:HandleWValueDrag(event)
	local value = ALittle.Math_ToDouble(self._width_value.text)
	if value == nil then
		value = 0
	end
	value = value + event.delta_x
	self._width_value.text = value
	self:ValueNumInputChange("width_value", true)
end

function DisplayObjectS:SetHValue(height_value, revoke_bind)
	if height_value == nil then
		return
	end
	self._height_value.text = height_value
	self._base.height = nil
	self:ValueNumInputChange("height_value", true, revoke_bind)
end

function DisplayObjectS:HandleHValueFOCUSOUT(event)
	self._base.height = nil
	self:ValueNumInputChange("height_value", true)
end

function DisplayObjectS:HandleHValueMoveIn(event)
	ALittle.System_SetHDragCursor()
end

function DisplayObjectS:HandleHValueMoveOut(event)
	ALittle.System_SetNormalCursor()
end

function DisplayObjectS:HandleHValueTabKey(event)
	self._description.focus = true
	self._description:SelectAll()
end

function DisplayObjectS:HandleHValueDrag(event)
	local value = ALittle.Math_ToDouble(self._height_value.text)
	if value == nil then
		value = 0
	end
	value = value + event.delta_x
	self._height_value.text = value
	self:ValueNumInputChange("height_value", true)
end

function DisplayObjectS:SetAlpha(alpha, revoke_bind)
	if alpha == nil then
		return
	end
	self._alpha.text = alpha
	self:ColorValueInputChange("alpha", false, revoke_bind)
end

function DisplayObjectS:HandleAlphaFOCUSOUT(event)
	self:ColorValueInputChange("alpha", false)
end

function DisplayObjectS:HandleAlphaValueMoveIn(event)
	ALittle.System_SetHDragCursor()
end

function DisplayObjectS:HandleAlphaValueMoveOut(event)
	ALittle.System_SetNormalCursor()
end

function DisplayObjectS:HandleAlphaValueTabKey(event)
	self._x_value.focus = true
	self._x_value:SelectAll()
end

function DisplayObjectS:HandleAlphaValueDrag(event)
	local value = ALittle.Math_ToDouble(self._alpha.text)
	if value == nil then
		value = 0
	end
	value = value + event.delta_x
	if value < 0 then
		value = 0
	elseif value > 255 then
		value = 255
	end
	self._alpha.text = value
	self:ColorValueInputChange("alpha", true)
end

function DisplayObjectS:SetRed(red, revoke_bind)
	if red == nil then
		return
	end
	self._red.text = red
	self:ColorValueInputChange("red", false, revoke_bind)
end

function DisplayObjectS:HandleRedFOCUSOUT(event)
	self:ColorValueInputChange("red", false)
end

function DisplayObjectS:HandleRedValueMoveIn(event)
	ALittle.System_SetHDragCursor()
end

function DisplayObjectS:HandleRedValueMoveOut(event)
	ALittle.System_SetNormalCursor()
end

function DisplayObjectS:HandleRedValueTabKey(event)
	self._green.focus = true
	self._green:SelectAll()
end

function DisplayObjectS:HandleRedValueDrag(event)
	local value = ALittle.Math_ToDouble(self._red.text)
	if value == nil then
		value = 0
	end
	value = value + event.delta_x
	if value < 0 then
		value = 0
	elseif value > 255 then
		value = 255
	end
	self._red.text = value
	self:ColorValueInputChange("red", true)
end

function DisplayObjectS:SetGreen(green, revoke_bind)
	if green == nil then
		return
	end
	self._green.text = green
	self:ColorValueInputChange("green", false, revoke_bind)
end

function DisplayObjectS:HandleGreenFOCUSOUT(event)
	self:ColorValueInputChange("green", false)
end

function DisplayObjectS:HandleGreenValueMoveIn(event)
	ALittle.System_SetHDragCursor()
end

function DisplayObjectS:HandleGreenValueMoveOut(event)
	ALittle.System_SetNormalCursor()
end

function DisplayObjectS:HandleGreenValueTabKey(event)
	self._blue.focus = true
	self._blue:SelectAll()
end

function DisplayObjectS:HandleGreenValueDrag(event)
	local value = ALittle.Math_ToDouble(self._green.text)
	if value == nil then
		value = 0
	end
	value = value + event.delta_x
	if value < 0 then
		value = 0
	elseif value > 255 then
		value = 255
	end
	self._green.text = value
	self:ColorValueInputChange("green", true)
end

function DisplayObjectS:SetBlue(blue, revoke_bind)
	if blue == nil then
		return
	end
	self._blue.text = blue
	self:ColorValueInputChange("blue", false, revoke_bind)
end

function DisplayObjectS:HandleBlueFOCUSOUT(event)
	self:ColorValueInputChange("blue", false)
end

function DisplayObjectS:HandleBlueValueMoveIn(event)
	ALittle.System_SetHDragCursor()
end

function DisplayObjectS:HandleBlueValueMoveOut(event)
	ALittle.System_SetNormalCursor()
end

function DisplayObjectS:HandleBlueValueTabKey(event)
	self._alpha.focus = true
	self._alpha:SelectAll()
end

function DisplayObjectS:HandleBlueValueDrag(event)
	local value = ALittle.Math_ToDouble(self._blue.text)
	if value == nil then
		value = 0
	end
	value = value + event.delta_x
	if value < 0 then
		value = 0
	elseif value > 255 then
		value = 255
	end
	self._blue.text = value
	self:ColorValueInputChange("blue", true)
end

function DisplayObjectS:HandleScaleXFOCUSOUT(event)
	self:ValueNumInputChange("scale_x", true)
end

function DisplayObjectS:SetScaleX(scale_x, revoke_bind)
	if scale_x == nil then
		return
	end
	self._scale_x.text = scale_x
	self:ValueNumInputChange("scale_x", true, revoke_bind)
end

function DisplayObjectS:HandleScaleYFOCUSOUT(event)
	self:ValueNumInputChange("scale_y", true)
end

function DisplayObjectS:SetScaleY(scale_y, revoke_bind)
	if scale_y == nil then
		return
	end
	self._scale_y.text = scale_y
	self:ValueNumInputChange("scale_y", true, revoke_bind)
end

function DisplayObjectS:HandleCenterXFOCUSOUT(event)
	self:ValueNumInputChange("center_x", true)
end

function DisplayObjectS:SetCenterX(center_x, revoke_bind)
	if center_x == nil then
		return
	end
	self._center_x.text = center_x
	self:ValueNumInputChange("center_x", true, revoke_bind)
end

function DisplayObjectS:HandleCenterYFOCUSOUT(event)
	self:ValueNumInputChange("center_y", true)
end

function DisplayObjectS:SetCenterY(center_y, revoke_bind)
	if center_y == nil then
		return
	end
	self._center_y.text = center_y
	self:ValueNumInputChange("center_y", true, revoke_bind)
end

function DisplayObjectS:HandleAutoCenter(event)
	self._center_x.text = self._object.width / 2
	self:ValueNumInputChange("center_x", true)
	self._center_y.text = self._object.height / 2
	self:ValueNumInputChange("center_y", true)
end

function DisplayObjectS:HandleAngleMoveIn(event)
	ALittle.System_SetHDragCursor()
end

function DisplayObjectS:HandleAngleMoveOut(event)
	ALittle.System_SetNormalCursor()
end

function DisplayObjectS:HandleAngleDrag(event)
	local value = ALittle.Math_ToDouble(self._angle.text)
	if value == nil then
		value = 0
	end
	value = value + event.delta_x
	self._angle.text = value
	self:ValueNumInputChange("angle", true)
end

function DisplayObjectS:HandleAngleFOCUSOUT(event)
	self:ValueNumInputChange("angle", true)
end

function DisplayObjectS:SetAngle(angle, revoke_bind)
	if angle == nil then
		return
	end
	self._angle.text = angle
	self:ValueNumInputChange("angle", true, revoke_bind)
end

function DisplayObjectS:SetHandCursor(hand_cursor, revoke_bind)
	if hand_cursor == nil then
		return
	end
	self._hand_cursor.text = g_IDEEnum.yn_type[hand_cursor]
	self:BoolSelectChange("hand_cursor", false, g_IDEEnum.yn_type, revoke_bind)
end

function DisplayObjectS:HandleHandCursorSELECT_CHANGE(event)
	self:BoolSelectChange("hand_cursor", false, g_IDEEnum.yn_type)
end

function DisplayObjectS:SetVisible(visible, revoke_bind)
	if visible == nil then
		return
	end
	self._visible.text = g_IDEEnum.yn_type[visible]
	self:BoolSelectChange("visible", false, g_IDEEnum.yn_type, revoke_bind)
end

function DisplayObjectS:HandleVisibleSELECT_CHANGE(event)
	self:BoolSelectChange("visible", false, g_IDEEnum.yn_type)
end

function DisplayObjectS:SetDisabled(disabled, revoke_bind)
	if disabled == nil then
		return
	end
	self._disabled.text = g_IDEEnum.yn_type[disabled]
	self:BoolSelectChange("disabled", false, g_IDEEnum.yn_type, revoke_bind)
end

function DisplayObjectS:HandleDisabledSELECT_CHANGE(event)
	self:BoolSelectChange("disabled", false, g_IDEEnum.yn_type)
end

function DisplayObjectS:SetDescription(description, revoke_bind)
	if description == nil then
		return
	end
	self._description.text = description
	self:DefaultNilStringInputChange("description", false, revoke_bind)
end

function DisplayObjectS:HandleDescriptionFOCUSOUT(event)
	self:DefaultNilStringInputChange("description", false)
end

function DisplayObjectS:HandleDescriptionTabKey(event)
	self.___target_class.focus = true
	self.___target_class:SelectAll()
end

function DisplayObjectS:SetLink(link, revoke_bind)
	if link == nil then
		return
	end
	self.___link.text = link
	self:DefaultNilStringInputChange("__link", false, revoke_bind)
end

function DisplayObjectS:HandleLinkFOCUSOUT(event)
	self:DefaultNilStringInputChange("__link", false)
end

function DisplayObjectS:HandleLinkTabKey(event)
	self._id.focus = true
	self._id:SelectAll()
end

function DisplayObjectS:HandleLinkSELECT_CHANGE(event)
	if event.target.text == "清空" then
		self:SetLink("")
	else
		self:SetLink(event.target.text)
	end
	event.target.text = ""
end

function DisplayObjectS:SetEvent(event, revoke_bind)
	if event == nil then
		return
	end
	local content = {}
	local count = 0
	for index, event_info in ___ipairs(event) do
		local data_type = event_info.type .. ":"
		local event_string = data_type .. event_info.func
		count = count + 1
		content[count] = event_string
	end
	if count == 0 then
		return
	end
	self.___event.text = ALittle.String_Join(content, "\n")
	self:TableDataSet("__event", false, revoke_bind)
end

function DisplayObjectS:HandleEventFOCUSOUT(event)
	g_IDEAttrEventDialog:ShowDialog(self, "__event", false)
end

function DisplayObjectS:SetTargetClass(target_class, revoke_bind)
	if target_class == nil then
		return
	end
	self.___target_class.text = ALittle.String_Join(target_class, ".")
	ALittle.Log(self.___target_class.text, ALittle.String_Join(target_class, "."))
	self:TableDataSetForTargetClass("__target_class", false, revoke_bind)
end

function DisplayObjectS:HandleTargetClassFOCUSOUT(event)
	self:TableDataSetForTargetClass("__target_class", false)
end

function DisplayObjectS:HandleTargetClassTabKey(event)
	self.___link.focus = true
	self.___link:SelectAll()
end

function DisplayObjectS:HandleTargetClassSELECT_CHANGE(event)
	if event.target.text == "清空" then
		self:SetTargetClass({})
	else
		self:SetTargetClass(ALittle.String_Split(event.target.text, "."))
	end
	event.target.text = ""
end

function DisplayObjectS:TypeSelectChange(text, list, need_reset, revoke_bind)
	local old_base = self._base[text]
	local old_object = self._object[text]
	local display_object = self["_" .. text]
	if revoke_bind == nil and self._object[text] == list[display_object.text] then
		return
	end
	self._object[text] = list[display_object.text]
	self._base[text] = list[display_object.text]
	if self._base[text] == self._default[text] then
		self._base[text] = nil
	end
	self._tab_child:UpdateHandleQuadLayout(self._tree_logic)
	self._tab_child:Save(false)
	local new_base = self._base[text]
	local new_object = self._object[text]
	local old_text = nil
	if display_object ~= nil then
		old_text = display_object.text
	end
	local revoke = IDENatureChangeRevoke(self._tree_logic, text, old_base, new_base, old_object, new_object, old_text, need_reset)
	if revoke_bind ~= nil then
		revoke_bind:PushRevoke(revoke)
	else
		self._tab_child.revoke_list:PushRevoke(revoke)
	end
end

function DisplayObjectS:ValueNumInputChange(text, need_reset, revoke_bind)
	local old_base = self._base[text]
	local old_object = self._object[text]
	local display_object = self["_" .. text]
	local value = ALittle.Math_ToDouble(display_object.text)
	if value == nil then
		display_object.text = "0"
		if revoke_bind == nil and self._object[text] == 0 then
			return
		end
		self._object[text] = 0
		self._base[text] = 0
	else
		if revoke_bind == nil and self._object[text] == value then
			return
		end
		self._object[text] = value
		self._base[text] = value
	end
	if self._default[text] ~= nil and self._base[text] == self._default[text] then
		self._base[text] = nil
	end
	self._tab_child:UpdateHandleQuadLayout(self._tree_logic)
	self._tab_child:Save(false)
	local new_base = self._base[text]
	local new_object = self._object[text]
	local old_text = nil
	if display_object ~= nil then
		old_text = display_object.text
	end
	local revoke = IDENatureChangeRevoke(self._tree_logic, text, old_base, new_base, old_object, new_object, old_text, need_reset)
	if revoke_bind ~= nil then
		revoke_bind:PushRevoke(revoke)
	else
		self._tab_child.revoke_list:PushRevoke(revoke)
	end
end

function DisplayObjectS:ValueNumZInputChange(text, need_reset, revoke_bind)
	local old_base = self._base[text]
	local old_object = self._object[text]
	local display_object = self["_" .. text]
	local value = ALittle.Math_ToDouble(display_object.text)
	if value == nil or value < 0 then
		display_object.text = "0"
		if revoke_bind == nil and self._object[text] == 0 then
			return
		end
		self._object[text] = 0
		self._base[text] = 0
	else
		if revoke_bind == nil and self._object[text] == value then
			return
		end
		self._object[text] = value
		self._base[text] = value
	end
	if self._default[text] ~= nil and self._base[text] == self._default[text] then
		self._base[text] = nil
	end
	self._tab_child:UpdateHandleQuadLayout(self._tree_logic)
	self._tab_child:Save(false)
	local new_base = self._base[text]
	local new_object = self._object[text]
	local old_text = nil
	if display_object ~= nil then
		old_text = display_object.text
	end
	local revoke = IDENatureChangeRevoke(self._tree_logic, text, old_base, new_base, old_object, new_object, old_text, need_reset)
	if revoke_bind ~= nil then
		revoke_bind:PushRevoke(revoke)
	else
		self._tab_child.revoke_list:PushRevoke(revoke)
	end
end

function DisplayObjectS:ColorValueInputChange(text, need_reset, revoke_bind)
	local old_base = self._base[text]
	local old_object = self._object[text]
	local display_object = self["_" .. text]
	local value = ALittle.Math_ToDouble(display_object.text)
	if value == nil or value < 0 then
		display_object.text = "0"
		if revoke_bind == nil and self._object[text] == 0 then
			return
		end
		self._object[text] = 0
		self._base[text] = 0
	elseif value > 255 then
		display_object.text = "255"
		if revoke_bind == nil and self._object[text] == 1 then
			return
		end
		self._object[text] = 1
		self._base[text] = 1
	else
		if revoke_bind == nil and ALittle.Math_Ceil(self._object[text] * 255) == value then
			return
		end
		value = value / 255
		self._object[text] = value
		self._base[text] = value
	end
	if self._default[text] ~= nil and self._base[text] == self._default[text] then
		self._base[text] = nil
	end
	self._tab_child:UpdateHandleQuadLayout(self._tree_logic)
	self._tab_child:Save(false)
	local new_base = self._base[text]
	local new_object = self._object[text]
	local old_text = nil
	if display_object ~= nil then
		old_text = display_object.text
	end
	local revoke = IDENatureChangeRevoke(self._tree_logic, text, old_base, new_base, old_object, new_object, old_text, need_reset)
	if revoke_bind ~= nil then
		revoke_bind:PushRevoke(revoke)
	else
		self._tab_child.revoke_list:PushRevoke(revoke)
	end
end

function DisplayObjectS:Z2OValueInputChange(text, need_reset, revoke_bind)
	local old_base = self._base[text]
	local old_object = self._object[text]
	local display_object = self["_" .. text]
	local value = ALittle.Math_ToDouble(display_object.text)
	if value == nil or value < 0 then
		display_object.text = "0"
		if revoke_bind == nil and self._object[text] == 0 then
			return
		end
		self._object[text] = 0
		self._base[text] = 0
	elseif value > 1 then
		display_object.text = "1"
		if revoke_bind == nil and self._object[text] == 1 then
			return
		end
		self._object[text] = 1
		self._base[text] = 1
	else
		if revoke_bind == nil and self._object[text] == value then
			return
		end
		self._object[text] = value
		self._base[text] = value
	end
	if self._base[text] == self._default[text] then
		self._base[text] = nil
	end
	self._tab_child:UpdateHandleQuadLayout(self._tree_logic)
	self._tab_child:Save(false)
	local new_base = self._base[text]
	local new_object = self._object[text]
	local old_text = nil
	if display_object ~= nil then
		old_text = display_object.text
	end
	local revoke = IDENatureChangeRevoke(self._tree_logic, text, old_base, new_base, old_object, new_object, old_text, need_reset)
	if revoke_bind ~= nil then
		revoke_bind:PushRevoke(revoke)
	else
		self._tab_child.revoke_list:PushRevoke(revoke)
	end
end

function DisplayObjectS:DefaultNilStringInputChange(text, need_reset, revoke_bind)
	local old_base = self._base[text]
	local old_object = self._object[text]
	local display_object = self["_" .. text]
	if display_object.text == "" then
		if revoke_bind == nil and self._object[text] == nil then
			return
		end
		self._base[text] = nil
		if self._default[text] == nil then
			self._object[text] = nil
		else
			self._object[text] = self._default[text]
			display_object.text = self._default[text]
		end
	else
		if revoke_bind == nil and self._object[text] == display_object.text then
			return
		end
		self._base[text] = display_object.text
		self._object[text] = display_object.text
		if self._default[text] ~= nil and self._base[text] == self._default[text] then
			self._base[text] = nil
		end
	end
	self._tab_child:UpdateHandleQuadLayout(self._tree_logic)
	self._tab_child:Save(false)
	local new_base = self._base[text]
	local new_object = self._object[text]
	local old_text = nil
	if display_object ~= nil then
		old_text = display_object.text
	end
	local revoke = IDENatureChangeRevoke(self._tree_logic, text, old_base, new_base, old_object, new_object, old_text, need_reset)
	if revoke_bind ~= nil then
		revoke_bind:PushRevoke(revoke)
	else
		self._tab_child.revoke_list:PushRevoke(revoke)
	end
end

function DisplayObjectS:DefaultNoStringInputChange(text, need_reset, revoke_bind)
	local old_base = self._base[text]
	local old_object = self._object[text]
	local display_object = self["_" .. text]
	if revoke_bind == nil and self._object[text] == display_object.text then
		return
	end
	self._base[text] = display_object.text
	self._object[text] = display_object.text
	if self._default[text] ~= nil and self._base[text] == self._default[text] then
		self._base[text] = nil
	end
	self._tab_child:UpdateHandleQuadLayout(self._tree_logic)
	self._tab_child:Save(false)
	local new_base = self._base[text]
	local new_object = self._object[text]
	local old_text = nil
	if display_object ~= nil then
		old_text = display_object.text
	end
	local revoke = IDENatureChangeRevoke(self._tree_logic, text, old_base, new_base, old_object, new_object, old_text, need_reset)
	if revoke_bind ~= nil then
		revoke_bind:PushRevoke(revoke)
	else
		self._tab_child.revoke_list:PushRevoke(revoke)
	end
end

function DisplayObjectS:SpecialFontPathInputChange(text, need_reset, revoke_bind)
	local old_base = self._base[text]
	local old_object = self._object[text]
	local display_object = self["_" .. text]
	if display_object.text == "" then
		if revoke_bind == nil and self._object[text] == nil then
			return
		end
		if self._default[text] ~= nil then
			display_object.text = self._default[text]
			self._base[text] = nil
			self._object[text] = self._default[text]
		else
			display_object.text = self._base[text]
			self._object[text] = self._base[text]
		end
	else
		if revoke_bind == nil and self._object[text] == display_object.text then
			return
		end
		self._base[text] = display_object.text
		self._object[text] = display_object.text
		if self._default[text] ~= nil and self._base[text] == self._default[text] then
			self._base[text] = nil
		end
	end
	self._tab_child:UpdateHandleQuadLayout(self._tree_logic)
	self._tab_child:Save(false)
	local new_base = self._base[text]
	local new_object = self._object[text]
	local old_text = nil
	if display_object ~= nil then
		old_text = display_object.text
	end
	local revoke = IDENatureChangeRevoke(self._tree_logic, text, old_base, new_base, old_object, new_object, old_text, need_reset)
	if revoke_bind ~= nil then
		revoke_bind:PushRevoke(revoke)
	else
		self._tab_child.revoke_list:PushRevoke(revoke)
	end
end

function DisplayObjectS:BoolSelectChange(text, need_reset, list, revoke_bind)
	local old_base = self._base[text]
	local old_object = self._object[text]
	local display_object = self["_" .. text]
	if display_object.text == list[true] then
		if revoke_bind == nil and self._object[text] == true then
			return
		end
		self._object[text] = true
		self._base[text] = true
	elseif display_object.text == list[false] then
		if revoke_bind == nil and self._object[text] == false then
			return
		end
		self._object[text] = false
		self._base[text] = false
	else
		ALittle.Log("bool failed")
	end
	if self._base[text] == self._default[text] then
		self._base[text] = nil
	end
	self._tab_child:UpdateHandleQuadLayout(self._tree_logic)
	self._tab_child:Save(false)
	local new_base = self._base[text]
	local new_object = self._object[text]
	local old_text = nil
	if display_object ~= nil then
		old_text = display_object.text
	end
	local revoke = IDENatureChangeRevoke(self._tree_logic, text, old_base, new_base, old_object, new_object, old_text, need_reset)
	if revoke_bind ~= nil then
		revoke_bind:PushRevoke(revoke)
	else
		self._tab_child.revoke_list:PushRevoke(revoke)
	end
end

function DisplayObjectS:RemoverToNilShowSetForImage(text, image_path, grid9, need_reset, revoke_bind)
	if image_path == "" then
		self:RemoverToNilShowSet(text, "", need_reset, revoke_bind)
	else
		if grid9 then
			local display_info = IDEUtility_GenerateGrid9ImageInfo(g_IDEProject.project.base_path .. "Texture/", image_path)
			if display_info == nil then
				g_IDETool:ShowNotice("错误", "图片不存在:" .. image_path)
				return
			end
			self:RemoverToNilShowSet(text, ALittle.String_JsonEncode(display_info), need_reset, revoke_bind)
		else
			local display_info = {}
			display_info.__class = "Image"
			display_info.texture_name = image_path
			self:RemoverToNilShowSet(text, ALittle.String_JsonEncode(display_info), need_reset, revoke_bind)
		end
	end
end

function DisplayObjectS:RemoverToNilShowSetForExtends(text, extends_v, need_reset, revoke_bind)
	if extends_v ~= "" then
		if g_IDEProject:IsControlExist(extends_v) == false then
			g_IDETool:ShowNotice("错误", "要继承的控件不存在:" .. extends_v)
			return
		end
		local display_info = {}
		display_info.__extends = extends_v
		self:RemoverToNilShowSet(text, ALittle.String_JsonEncode(display_info), need_reset, revoke_bind)
	else
		self:RemoverToNilShowSet(text, "", need_reset, revoke_bind)
	end
end

function DisplayObjectS:RemoverToNilShowSet(text, json_content, need_reset, revoke_bind)
	local old_base = self._base[text]
	local old_object = self._object[text]
	if json_content == "" then
		self._base[text] = nil
		if self._default[text] ~= nil and self._default[text].__class ~= nil then
			local content = self._default[text]
			local error1, content1 = Lua.TCall(ALittle.String_JsonDecode, content)
			if error1 == nil then
				local error2, content2 = Lua.TCall(ALittle.String_JsonDecode, content1)
				local name = "mnbvcxzasdfghjklpoiuytrewq20160121"
				g_IDEProject.project.control:RegisterInfo(name, content2)
				local temp = g_IDEProject.project.control:CreateControl(name)
				self._object[text] = temp
				g_IDEProject.project.control:UnRegisterInfo(name)
			end
		else
			self._object[text] = nil
			self["_" .. text].text = ""
		end
	else
		local content = json_content
		local error1, content1 = Lua.TCall(ALittle.String_JsonDecode, content)
		if error1 == nil then
			local include = content1.__include
			if include == nil then
				include = content1.__extends
			end
			if include ~= nil then
				if g_IDEProject.project.control_map[include] == nil then
					g_IDETool:ShowNotice("错误", "指定__include或__extends不存在")
					return
				end
			end
			self._base[text] = content1
			local error2, content2 = Lua.TCall(ALittle.String_JsonDecode, content)
			local name = "mnbvcxzasdfghjklpoiuytrewq20160121"
			g_IDEProject.project.control:RegisterInfo(name, content2)
			local temp = g_IDEProject.project.control:CreateControl(name)
			self._object[text] = temp
			g_IDEProject.project.control:UnRegisterInfo(name)
		else
			g_IDETool:ShowNotice("错误", "输入show设置错误")
			return
		end
	end
	self._tab_child:UpdateHandleQuadLayout(self._tree_logic)
	self._tab_child:Save(false)
	local new_base = self._base[text]
	local new_object = self._object[text]
	local old_text = nil
	local display_object = self["_" .. text]
	if display_object ~= nil then
		old_text = display_object.text
	end
	local revoke = IDENatureChangeRevoke(self._tree_logic, text, old_base, new_base, old_object, new_object, old_text, need_reset)
	if revoke_bind ~= nil then
		revoke_bind:PushRevoke(revoke)
	else
		self._tab_child.revoke_list:PushRevoke(revoke)
	end
end

function DisplayObjectS:RemoverToNilNoNilShowSet(text, need_reset, revoke_bind)
	local old_base = self._base[text]
	local old_object = self._object[text]
	local display_object = self["_" .. text]
	if display_object.text == "" then
		self._base[text] = nil
		if self._default[text] ~= nil and (self._default[text].__class ~= nil or self._default[text].__include ~= nil or self._default[text].__extends ~= nil) then
			local content = self._default[text]
			local error, content1 = Lua.TCall(ALittle.String_JsonEncode, content)
			if error ~= nil then
				display_object.text = content1
				local error2, content2 = Lua.TCall(ALittle.String_JsonDecode, content1)
				local name = "mnbvcxzasdfghjklpoiuytrewq20160121"
				g_IDEProject.project.control:RegisterInfo(name, content2)
				local temp = g_IDEProject.project.control:CreateControl(name)
				self._object[text] = temp
				g_IDEProject.project.control:UnRegisterInfo(name)
			end
		else
			self._object[text] = nil
		end
	else
		local content = display_object.text
		local error1, content1 = Lua.TCall(ALittle.String_JsonDecode, content)
		if error1 == nil then
			local include = content1.__include
			if include == nil then
				include = content1.__extends
			end
			if include ~= nil then
				if g_IDEProject.project.control_map[include] == nil then
					g_IDETool:ShowNotice("错误", "指定__include或__extends不存在")
					display_object.text = ""
					return
				end
			end
			self._base[text] = content1
			local error2, content2 = Lua.TCall(ALittle.String_JsonDecode, content)
			local name = "mnbvcxzasdfghjklpoiuytrewq20160121"
			g_IDEProject.project.control:RegisterInfo(name, content2)
			local temp = g_IDEProject.project.control:CreateControl(name)
			self._object[text] = temp
			g_IDEProject.project.control:UnRegisterInfo(name)
		else
			g_IDETool:ShowNotice("错误", "输入show设置错误")
			display_object.text = ""
			return
		end
	end
	self._tab_child:UpdateHandleQuadLayout(self._tree_logic)
	self._tab_child:Save(false)
	local new_base = self._base[text]
	local new_object = self._object[text]
	local old_text = nil
	if display_object ~= nil then
		old_text = display_object.text
	end
	local revoke = IDENatureChangeRevoke(self._tree_logic, text, old_base, new_base, old_object, new_object, old_text, need_reset)
	if revoke_bind ~= nil then
		revoke_bind:PushRevoke(revoke)
	else
		self._tab_child.revoke_list:PushRevoke(revoke)
	end
end

function DisplayObjectS:TableDataSet(text, need_reset, revoke_bind)
	local old_base = self._base[text]
	local old_object = self._object[text]
	local display_object = self["_" .. text]
	if display_object.text == "" then
		self._base[text] = nil
		if self._default[text] ~= nil then
			local content = self._default[text]
			local error, content1 = Lua.TCall(ALittle.String_JsonEncode, content)
			if error == nil then
				display_object.text = content1
				self._object[text] = content
			end
		else
			self._object[text] = nil
		end
	else
		local error, content = Lua.TCall(ALittle.String_JsonDecode, display_object.text)
		if error == nil then
			self._base[text] = content
			self._object[text] = content
		else
			g_IDETool:ShowNotice("输入错误", "输入数据错误")
			display_object.text = ""
			return
		end
	end
	self._tab_child:UpdateHandleQuadLayout(self._tree_logic)
	self._tab_child:Save(false)
	local new_base = self._base[text]
	local new_object = self._object[text]
	local old_text = nil
	if display_object ~= nil then
		old_text = display_object.text
	end
	local revoke = IDENatureChangeRevoke(self._tree_logic, text, old_base, new_base, old_object, new_object, old_text, need_reset)
	if revoke_bind ~= nil then
		revoke_bind:PushRevoke(revoke)
	else
		self._tab_child.revoke_list:PushRevoke(revoke)
	end
end

function DisplayObjectS:TableDataSetForTargetClass(text, need_reset, revoke_bind)
	local old_base = self._base[text]
	local old_object = self._object[text]
	local default_value = nil
	if self._default[text] ~= nil then
		default_value = ALittle.String_Join(self._default[text], ".")
	end
	local display_object = self["_" .. text]
	if display_object.text == "" or display_object.text == default_value then
		if revoke_bind == nil and self._base[text] == nil and self._default[text] == nil then
			return
		end
		self._base[text] = nil
		if self._default[text] ~= nil then
			self._object[text] = self._default[text]
			display_object.text = default_value
		else
			self._object[text] = nil
		end
	else
		local old_content = self._base[text]
		if old_content == nil then
			old_content = self._default[text]
		end
		if revoke_bind == nil and old_content ~= nil and ALittle.String_Join(old_content, ".") == display_object.text then
			return
		end
		local content = ALittle.String_Split(display_object.text, ".")
		self._base[text] = content
		self._object[text] = content
	end
	self._tab_child:UpdateHandleQuadLayout(self._tree_logic)
	self._tab_child:Save(false)
	local new_base = self._base[text]
	local new_object = self._object[text]
	local old_text = nil
	if display_object ~= nil then
		old_text = display_object.text
	end
	local revoke = IDENatureChangeRevoke(self._tree_logic, text, old_base, new_base, old_object, new_object, old_text, need_reset)
	if revoke_bind ~= nil then
		revoke_bind:PushRevoke(revoke)
	else
		self._tab_child.revoke_list:PushRevoke(revoke)
	end
end

function DisplayObjectS:LoadShowTypeDataForExtends(text)
	local display_object = self["_" .. text]
	local content = self._base[text]
	if content == nil then
		content = self._default[text]
	end
	if content ~= nil then
		local include = content.__extends
		if include == nil then
			include = content.__include
		end
		if include ~= nil then
			display_object.text = include
		else
			display_object.text = ""
		end
	else
		display_object.text = ""
	end
end

function DisplayObjectS:LoadShowTypeDataForImage(text)
	local display_object = self["_" .. text]
	local display_object_grid9 = self["_" .. text .. "_grid9"]
	local content = self._base[text]
	if content == nil then
		content = self._default[text]
	end
	if content ~= nil then
		if content.__class == "Image" then
			if content.texture_name ~= nil then
				display_object.text = content.texture_name
			else
				display_object.text = ""
			end
			display_object_grid9.selected = false
		elseif content.__class == "Grid9Image" then
			if content.texture_name ~= nil then
				display_object.text = content.texture_name
			else
				display_object.text = ""
			end
			display_object_grid9.selected = true
		else
			display_object.text = ""
			display_object_grid9.selected = false
		end
	else
		display_object.text = ""
		display_object_grid9.selected = false
	end
end

function DisplayObjectS:LoadShowTypeDataForTargetClass(text)
	local display_object = self["_" .. text]
	local content = self._base[text]
	if content == nil then
		content = self._default[text]
	end
	if content ~= nil then
		display_object.text = ALittle.String_Join(content, ".")
	else
		display_object.text = ""
	end
end

function DisplayObjectS:LoadShowTypeData(text)
	local display_object = self["_" .. text]
	local content = self._base[text]
	if content == nil then
		content = self._default[text]
	end
	if content ~= nil then
		local error, object = Lua.TCall(ALittle.String_JsonEncode, content)
		if error == nil then
			display_object.text = object
		else
			ALittle.Log("encode failed")
		end
	else
		display_object.text = ""
	end
end

function DisplayObjectS:LoadShowTypeNoNilData(text)
	local display_object = self["_" .. text]
	if self._default[text] ~= nil and (self._default[text].__class ~= nil or self._default[text].__include ~= nil or self._default[text].__extends ~= nil) then
		local content = self._base[text]
		if content == nil then
			content = self._default[text]
		end
		if content ~= nil then
			local error, new_content = Lua.TCall(ALittle.String_JsonEncode, content)
			if error == nil then
				display_object.text = new_content
			else
				ALittle.Log("encode failed")
			end
		else
			display_object.text = ""
		end
	else
		local content = self._base[text]
		if content ~= nil then
			local error, new_content = Lua.TCall(ALittle.String_JsonEncode, content)
			if error == nil then
				display_object.text = new_content
			else
				ALittle.Log("encode failed")
			end
		else
			display_object.text = ""
		end
	end
end

function DisplayObjectS:LoadValueData(text)
	local display_object = self["_" .. text]
	if self._base[text] ~= nil then
		display_object.text = self._base[text]
	else
		display_object.text = self._default[text]
	end
end

function DisplayObjectS:LoadEnumData(text, list)
	local display_object = self["_" .. text]
	if self._base[text] ~= nil then
		display_object.text = list[self._base[text]]
	else
		display_object.text = list[self._default[text]]
	end
end

function DisplayObjectS:LoadColorData(text)
	local display_object = self["_" .. text]
	local color = self._base[text]
	if color == nil then
		color = self._default[text]
	end
	display_object.text = color * 255
end

function DisplayObjectS:LoadBoolData(text, default_bool, list)
	local display_object = self["_" .. text]
	local temp = default_bool
	if self._base[text] ~= nil then
		temp = self._base[text]
	else
		temp = self._default[text]
	end
	if temp then
		if display_object ~= nil then
			display_object.text = list[true]
		else
			ALittle.Warn(text)
		end
	else
		if display_object ~= nil then
			display_object.text = list[false]
		else
			ALittle.Warn(text)
		end
	end
end

function DisplayObjectS:LoadTypeSelectData(text, list)
	local content = self._base[text]
	if content == nil then
		content = self._default[text]
	end
	self["_" .. text].text = list[content]
end

function DisplayObjectS:LoadDefaultNilString(text)
	local display_object = self["_" .. text]
	local content = self._base[text]
	if content == nil then
		content = self._default[text]
	end
	if content ~= nil then
		display_object.text = content
	else
		display_object.text = ""
	end
end

function DisplayObjectS:ImagePathSelectCallback(text, callback, revoke_bind, path)
	local display_object = self["_" .. text]
	display_object.text = path
	local e = {}
	e.target = display_object
	callback(self, e)
	local surface = ALittle.System_LoadSurface(g_IDEProject.project.base_path .. "Texture/" .. path)
	if surface == nil then
		return
	end
	local w = ALittle.System_GetSurfaceWidth(surface)
	local h = ALittle.System_GetSurfaceHeight(surface)
	ALittle.System_FreeSurface(surface)
	local new_revoke = false
	if revoke_bind == nil then
		new_revoke = true
		revoke_bind = IDERevokeBind()
	end
	self:SetWType(1, revoke_bind)
	self:SetHType(1, revoke_bind)
	self:SetWValue(w, revoke_bind)
	self:SetHValue(h, revoke_bind)
	if new_revoke then
		self._tab_child.revoke_list:PushRevoke(revoke_bind)
	end
end

function DisplayObjectS:SetTextureName(texture_name, revoke_bind)
end

