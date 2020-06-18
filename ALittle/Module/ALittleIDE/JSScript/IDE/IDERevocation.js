{
if (typeof ALittleIDE === "undefined") window.ALittleIDE = {};


ALittleIDE.IDERevokeObject = JavaScript.Class(undefined, {
	Forward : function() {
	},
	Back : function() {
	},
}, "ALittleIDE.IDERevokeObject");

ALittleIDE.IDERevokeList = JavaScript.Class(undefined, {
	Ctor : function() {
		this._revoke_list = [];
		this._revoke_count = 0;
		this._revoke_index = 0;
		this._max_count = 100;
	},
	PushRevoke : function(revoke) {
		if (this._revoke_index < this._revoke_count) {
			for (let i = this._revoke_index + 1; i <= this._revoke_count; i += 1) {
				this._revoke_list[i - 1] = undefined;
			}
			this._revoke_count = this._revoke_index;
		}
		this._revoke_index = this._revoke_index + 1;
		this._revoke_count = this._revoke_count + 1;
		this._revoke_list[this._revoke_index - 1] = revoke;
		if (this._revoke_count > this._max_count) {
			this._revoke_index = this._revoke_index - 1;
			this._revoke_count = this._revoke_count - 1;
			ALittle.List_Remove(this._revoke_list, 1);
		}
	},
	DoRevoke : function() {
		if (this._revoke_index >= this._revoke_count) {
			return;
		}
		this._revoke_index = this._revoke_index + 1;
		let revoke = this._revoke_list[this._revoke_index - 1];
		revoke.Forward();
	},
	UndoRevoke : function() {
		if (this._revoke_index === 0) {
			return;
		}
		let revoke = this._revoke_list[this._revoke_index - 1];
		revoke.Back();
		this._revoke_index = this._revoke_index - 1;
	},
}, "ALittleIDE.IDERevokeList");

if (ALittleIDE.IDERevokeObject === undefined) throw new Error(" extends class:ALittleIDE.IDERevokeObject is undefined");
ALittleIDE.IDERevokeBind = JavaScript.Class(ALittleIDE.IDERevokeObject, {
	Ctor : function() {
		this._list = [];
		this._count = 0;
	},
	PushRevoke : function(revoke) {
		++ this._count;
		this._list[this._count - 1] = revoke;
	},
	Forward : function() {
		let ___OBJECT_1 = this._list;
		for (let k = 1; k <= ___OBJECT_1.length; ++k) {
			let revoke = ___OBJECT_1[k - 1];
			if (revoke === undefined) break;
			revoke.Forward();
		}
	},
	Back : function() {
		for (let i = this._count; i >= 1; i += -1) {
			this._list[i - 1].Back();
		}
	},
}, "ALittleIDE.IDERevokeBind");

}