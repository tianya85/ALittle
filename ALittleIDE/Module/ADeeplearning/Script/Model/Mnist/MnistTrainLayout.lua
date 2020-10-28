-- ALittle Generate Lua And Do Not Edit This Line!
do
if _G.ADeeplearning == nil then _G.ADeeplearning = {} end
local ___pairs = pairs
local ___ipairs = ipairs
local ___all_struct = ALittle.GetAllStruct()

ALittle.RegStruct(-1479093282, "ALittle.UIEvent", {
name = "ALittle.UIEvent", ns_name = "ALittle", rl_name = "UIEvent", hash_code = -1479093282,
name_list = {"target"},
type_list = {"ALittle.DisplayObject"},
option_map = {}
})
ALittle.RegStruct(958494922, "ALittle.UIChangedEvent", {
name = "ALittle.UIChangedEvent", ns_name = "ALittle", rl_name = "UIChangedEvent", hash_code = 958494922,
name_list = {"target"},
type_list = {"ALittle.DisplayObject"},
option_map = {}
})

assert(ALittle.DisplayLayout, " extends class:ALittle.DisplayLayout is nil")
ADeeplearning.MnistTrainLayout = Lua.Class(ALittle.DisplayLayout, "ADeeplearning.MnistTrainLayout")

function ADeeplearning.MnistTrainLayout:TCtor()
	self._model = deeplearning.DeeplearningMnistModel()
	self._start_button.disabled = false
	self._stop_button.disabled = true
end

function ADeeplearning.MnistTrainLayout:HandleStartClick(event)
	if self._loop_frame ~= nil then
		return
	end
	self._start_button.disabled = true
	self._stop_button.disabled = false
	self._loop_frame = ALittle.LoopFrame(Lua.Bind(self.UpdateFrame, self))
	A_WeakLoopSystem:AddUpdater(self._loop_frame)
	self._model:Init(ADeeplearning.g_ModuleBasePath .. "Other/mnist.model", ADeeplearning.g_ModuleBasePath .. "Data/train-images.idx3-ubyte", ADeeplearning.g_ModuleBasePath .. "Data/train-labels.idx1-ubyte")
	self._stat:Init(1, ALittle.Math_Floor(self._stat.width), ALittle.Math_Floor(self._stat.height), 1)
end

function ADeeplearning.MnistTrainLayout:HandleStopClick(event)
	if self._loop_frame == nil then
		return
	end
	self._start_button.disabled = false
	self._stop_button.disabled = true
	if self._loop_frame ~= nil then
		A_WeakLoopSystem:RemoveUpdater(self._loop_frame)
		self._loop_frame = nil
	end
	self._model:Save(ADeeplearning.g_ModuleBasePath .. "Other/mnist.model")
	self:DispatchEvent(___all_struct[958494922], {})
end

function ADeeplearning.MnistTrainLayout:UpdateFrame(frame_time)
	self._stat:AddValue(self._model:Training())
end

end