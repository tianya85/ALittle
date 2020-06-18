-- ALittle Generate Lua And Do Not Edit This Line!
module("ALittleIDE", package.seeall)

local ___pairs = pairs
local ___ipairs = ipairs


assert(ALittle.Linear, " extends class:ALittle.Linear is nil")
IDEUIMainMenu = Lua.Class(ALittle.Linear, "ALittleIDE.IDEUIMainMenu")

function IDEUIMainMenu:TCtor()
	local version_ip = g_IDEServerConfig:GetConfig("version_ip", "139.159.176.119")
	local version_port = g_IDEServerConfig:GetConfig("version_port", 1011)
	self._version_manager = AUIPlugin.AUIVersionManager(version_ip, version_port, "alittle", "ALittleIDE")
	if not g_Control.crypt_mode then
		self._version_manager:CheckVersionUpdate()
	end
end

function IDEUIMainMenu:Shutdown()
	self._version_manager:Shutdown()
end

function IDEUIMainMenu:HandleFileMenuClick(event)
	local menu = AUIPlugin.AUIRightMenu()
	menu:AddItem("新建", Lua.Bind(g_IDEProjectNewDialog.ShowNewProject, g_IDEProjectNewDialog))
	menu:AddItem("打开", Lua.Bind(g_IDEProjectOpenDialog.ShowOpenProject, g_IDEProjectOpenDialog))
	menu:AddItem("设置", Lua.Bind(g_IDEProjectSettingDialog.ShowSettingProject, g_IDEProjectSettingDialog))
	menu:AddItem("保存", Lua.Bind(g_IDECenter.center.content_edit.SaveAllTab, g_IDECenter.center.content_edit))
	menu:AddItem("刷新", Lua.Bind(g_IDECenter.center.project_list.RefreshProject, g_IDECenter.center.project_list))
	menu:AddItem("导出项目", Lua.Bind(g_IDEProjectExportDialog.ShowExportProject, g_IDEProjectExportDialog))
	menu:Show(event.target)
end

function IDEUIMainMenu:HandleEditMenuClick(event)
	local menu = AUIPlugin.AUIRightMenu()
	menu:AddItem("新建控件", Lua.Bind(g_IDECenter.center.control_list.ShowNewControl, g_IDECenter.center.control_list))
	menu:AddItem("重做", Lua.Bind(g_IDECenter.center.HandleDoRevoke, g_IDECenter.center, nil))
	menu:AddItem("撤销", Lua.Bind(g_IDECenter.center.HandleUndoRevoke, g_IDECenter.center, nil))
	menu:Show(event.target)
end

function IDEUIMainMenu:HandleToolMenuClick(event)
	local menu = AUIPlugin.AUIRightMenu()
	menu:AddItem("生成core_all_in_one", Lua.Bind(self.HandleGenCoreAllInOneClick, self))
	menu:AddItem("生成std_all_in_one", Lua.Bind(self.HandleGenStdAllInOneClick, self))
	menu:AddItem("生成cengine_all_in_one", Lua.Bind(self.HandleGenCEngineAllInOneClick, self))
	menu:Show(event.target)
end

function IDEUIMainMenu:HandleVersionMenuClick(event)
	self._version_manager:ShowDialog()
end

function IDEUIMainMenu:HandleRunMenuClick(event)
	g_IDEProject:RunProject()
end

function IDEUIMainMenu:HandleGenCoreAllInOneClick()
	local all_in_one = {}
	local base_path = "Module/ALittleIDE/Other/GameLibrary/Core/JSScript/"
	local file_list = {}
	ALittle.List_Push(file_list, base_path .. "ALittle.js")
	ALittle.List_PushList(file_list, ALittle.File_GetFileListByDir(base_path .. "Core/JavaScript/"))
	ALittle.List_Push(file_list, base_path .. "Core/Reflect/ReflectRegister.js")
	ALittle.List_Push(file_list, base_path .. "Core/Reflect/ReflectDefine.js")
	ALittle.List_PushList(file_list, ALittle.File_GetFileListByDir(base_path .. "Core/Utility/"))
	ALittle.List_PushList(file_list, ALittle.File_GetFileListByDir(base_path .. "Core/Net/"))
	for index, path in ___ipairs(file_list) do
		all_in_one[index] = ALittle.File_ReadTextFromStdFile(path)
		if all_in_one[index] == nil then
			g_AUITool:ShowNotice("提示", "生成失败")
			return
		end
	end
	local result = ALittle.File_WriteTextFromStdFile(ALittle.String_Join(all_in_one, "\n"), "Module/ALittleIDE/Other/GameLibrary/Core/JSNative/Core.js")
	if result then
		g_AUITool:ShowNotice("提示", "生成成功")
	else
		g_AUITool:ShowNotice("提示", "生成失败")
	end
end

function IDEUIMainMenu:HandleGenStdAllInOneClick()
	local all_in_one = {}
	local base_path = "Module/ALittleIDE/Other/GameLibrary/Std/JSScript/"
	local file_list = {}
	ALittle.List_Push(file_list, base_path .. "ALittle.js")
	ALittle.List_PushList(file_list, ALittle.File_GetFileListByDir(base_path .. "Std/Reflect/"))
	ALittle.List_Push(file_list, base_path .. "Std/Loop/LoopObject.js")
	ALittle.List_Push(file_list, base_path .. "Std/Loop/ILoopSystem.js")
	ALittle.List_Push(file_list, base_path .. "Std/Loop/LoopFrame.js")
	ALittle.List_Push(file_list, base_path .. "Std/Loop/LoopFunction.js")
	ALittle.List_Push(file_list, base_path .. "Std/Loop/LoopGroup.js")
	ALittle.List_Push(file_list, base_path .. "Std/Loop/LoopList.js")
	ALittle.List_Push(file_list, base_path .. "Std/Loop/LoopTimer.js")
	ALittle.List_PushList(file_list, ALittle.File_GetFileListByDir(base_path .. "Std/Utility/"))
	ALittle.List_PushList(file_list, ALittle.File_GetFileListByDir(base_path .. "Std/Net/"))
	ALittle.List_PushList(file_list, ALittle.File_GetFileListByDir(base_path .. "Adapter/JavaScript/"))
	ALittle.List_PushList(file_list, ALittle.File_GetFileListByDir(base_path .. "Std/Singleton/"))
	for index, path in ___ipairs(file_list) do
		all_in_one[index] = ALittle.File_ReadTextFromStdFile(path)
		if all_in_one[index] == nil then
			g_AUITool:ShowNotice("提示", "生成失败")
			return
		end
	end
	local result = ALittle.File_WriteTextFromStdFile(ALittle.String_Join(all_in_one, "\n"), "Module/ALittleIDE/Other/GameLibrary/Std/JSNative/Std.js")
	if result then
		g_AUITool:ShowNotice("提示", "生成成功")
	else
		g_AUITool:ShowNotice("提示", "生成失败")
	end
end

function IDEUIMainMenu:HandleGenCEngineAllInOneClick()
	local base_path = "Module/ALittleIDE/Other/GameLibrary/CEngine/JSScript/"
	local file_list = {}
	ALittle.List_Push(file_list, base_path .. "ALittle.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/IShow.js")
	ALittle.List_Push(file_list, base_path .. "Adapter/PIXI/JSystem.js")
	ALittle.List_Push(file_list, base_path .. "Adapter/PIXI/JShow.js")
	ALittle.List_Push(file_list, base_path .. "Adapter/PIXI/JCsvLoader.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/Utility/String.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/Utility/File.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/Utility/System.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/Utility/ConfigSystem.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/Utility/OtherSystem.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/Utility/AudioSystem.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/Utility/ModuleSystem.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/Utility/CsvConfigManager.js")
	ALittle.List_PushList(file_list, ALittle.File_GetFileListByDir(base_path .. "CEngine/LoopSystem/"))
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/UIEnumTypes.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/UIEventDispatcher.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Base/Matrix2D.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Base/DisplayObject.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Base/DisplayGroup.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Base/DisplayLayout.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Base/DisplayView.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Base/Quad.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Base/Image.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Base/Sprite.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Base/Text.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Base/TextArea.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Base/TextEdit.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Base/TextInput.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Base/Triangle.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/Grid9Image.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/TextButton.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/TextCheckButton.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/TextRadioButton.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/Grid3.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/Grid9.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/Linear.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/Tab.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/DropDown.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/Slider.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/ScrollBar.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/ScrollScreen.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/Dialog.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/TileTable.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/ImagePlay.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/SpritePlay.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/FramePlay.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/Piechart.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/ImageInput.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/ImageEdit.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/RichArea.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/RichEdit.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/RichInput.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/ScrollList.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/Complex/ScrollButton.js")
	ALittle.List_PushList(file_list, ALittle.File_GetFileListByDir(base_path .. "CEngine/UISystem/Special/"))
	ALittle.List_PushList(file_list, ALittle.File_GetFileListByDir(base_path .. "CEngine/UISystem/Plugin/"))
	ALittle.List_PushList(file_list, ALittle.File_GetFileListByDir(base_path .. "CEngine/UISystem/Effect/"))
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/UISystem.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/LayerManager.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/TextureManager.js")
	ALittle.List_Push(file_list, base_path .. "CEngine/UISystem/ControlSystem.js")
	local file_index = 1
	local file_size = 0
	local list_index = 1
	local all_in_one = nil
	for index, path in ___ipairs(file_list) do
		local content = ALittle.File_ReadTextFromStdFile(path)
		if content == nil then
			g_AUITool:ShowNotice("提示", "生成失败")
			return
		end
		local len = ALittle.String_Len(content)
		if file_size + len >= 500 * 1024 then
			if all_in_one ~= nil then
				local result = ALittle.File_WriteTextFromStdFile(ALittle.String_Join(all_in_one, "\n"), "Module/ALittleIDE/Other/GameLibrary/CEngine/JSNative/CEngine" .. file_index .. ".js")
				if not result then
					g_AUITool:ShowNotice("提示", "生成失败")
					return
				end
			end
			all_in_one = nil
			list_index = 1
			file_size = 0
			file_index = file_index + 1
		end
		if file_size + len < 500 * 1024 then
			file_size = file_size + (len)
			if all_in_one == nil then
				all_in_one = {}
			end
			all_in_one[list_index] = content
			list_index = list_index + 1
		end
	end
	if all_in_one ~= nil then
		local result = ALittle.File_WriteTextFromStdFile(ALittle.String_Join(all_in_one, "\n"), "Module/ALittleIDE/Other/GameLibrary/CEngine/JSNative/CEngine" .. file_index .. ".js")
		if not result then
			g_AUITool:ShowNotice("提示", "生成失败")
			return
		end
	end
	g_AUITool:ShowNotice("提示", "生成成功")
end
