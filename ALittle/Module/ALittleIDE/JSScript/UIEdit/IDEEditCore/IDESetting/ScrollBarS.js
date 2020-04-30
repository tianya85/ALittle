{
if (typeof ALittleIDE === "undefined") window.ALittleIDE = {};


if (ALittleIDE.Grid3S === undefined) throw new Error(" extends class:ALittleIDE.Grid3S is undefined");
ALittleIDE.ScrollBarS = JavaScript.Class(ALittleIDE.Grid3S, {
	Ctor : function(user_info, tab_child, tree_logic) {
		this._layer_name = "ide_setting_scrollbar";
	},
	LoadNatureBase : function() {
		ALittleIDE.Grid3S.LoadNatureBase.call(this);
		this.LoadValueData("total_size");
		this.LoadValueData("show_size");
		this.LoadValueData("offset_rate");
		this.LoadValueData("offset_step");
		this.LoadShowTypeDataForExtends("up_button");
		this.LoadShowTypeDataForExtends("down_button");
		this.LoadShowTypeDataForExtends("bar_button");
		this.LoadShowTypeDataForImage("bar_background");
	},
	HandleTotleSizeFOCUSOUT : function(event) {
		this.ValueNumInputChange("total_size", false);
	},
	HandleShowSizeFOCUSOUT : function(event) {
		this.ValueNumInputChange("show_size", false);
	},
	HandleOffsetRateFOCUSOUT : function(event) {
		this.Z2OValueInputChange("offset_rate", false);
	},
	HandleOffsetStepFOCUSOUT : function(event) {
		this.Z2OValueInputChange("offset_step", false);
	},
	HandleUpButtonFOCUSOUT : function(event) {
		if (event.target._user_data !== undefined) {
			if (event.target._user_data === event.target.text) {
				return;
			}
			event.target._user_data = event.target.text;
		}
		this.RemoverToNilShowSetForExtends("up_button", this._up_button.text, false);
	},
	HandleDownButtonFOCUSOUT : function(event) {
		if (event.target._user_data !== undefined) {
			if (event.target._user_data === event.target.text) {
				return;
			}
			event.target._user_data = event.target.text;
		}
		this.RemoverToNilShowSetForExtends("down_button", this._down_button.text, false);
	},
	HandleBarButtonFOCUSOUT : function(event) {
		if (event.target._user_data !== undefined) {
			if (event.target._user_data === event.target.text) {
				return;
			}
			event.target._user_data = event.target.text;
		}
		this.RemoverToNilShowSetForExtends("bar_button", this._bar_button.text, false);
	},
	HandleBarBackFOCUSOUT : function(event) {
		if (event.target._user_data !== undefined) {
			if (event.target._user_data === event.target.text) {
				return;
			}
			event.target._user_data = event.target.text;
		}
		this.RemoverToNilShowSetForImage("bar_background", this._bar_background.text, this._bar_background_grid9.selected, false);
	},
	HandleBarBackSelect : function(event) {
		let func = this.ImagePathSelectCallback.bind(this, "bar_background", this.HandleBarBackFOCUSOUT, undefined);
		ALittleIDE.g_IDEAttrImageDialog.ShowDialog(undefined, func);
	},
}, "ALittleIDE.ScrollBarS");

}