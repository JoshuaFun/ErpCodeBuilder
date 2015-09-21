var Epo_Erp_${model.moduleName}={};
var Epo_Erp_${model.moduleName}_PageTo;
var Epo_Erp_${model.moduleName}_ButtonAble;
Ext.onReady(function() {
	// 不使用cookie保存EXT页面格式
	Ext.Component.prototype.stateful = false;
	Ext.QuickTips.init();
	//Action地址
	Epo_Erp_${model.moduleName}['URL'] = Epo.Erp.${model.moduleName}.URL.getDone();
	new Epo.Erp.${model.moduleName}.Viewport({border : false}).render(Ext.getBody());
	//实例化按钮有效性
	Epo_Erp_${model.moduleName}_ButtonAble = new Epo.Erp.${model.moduleName}.ButtonAble();
	Epo_Erp_${model.moduleName}_ButtonAble['buttonsPermission'] = Epo_Erp_${model.moduleName}_ButtonAble_ButtonsPermission;
});