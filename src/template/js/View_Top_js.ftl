Ext.ns('Epo.Erp.${model.moduleName}.View');
Epo.Erp.${model.moduleName}.View.Top = Ext.extend(Ext.Panel, {
	id : '${model.moduleName}ViewTop',
	frame : true,
	border : false,
	// 初始化
	initComponent : function() {
		this.setTarDone();
		this.setFormDone();
		Epo.Erp.${model.moduleName}.View.Top.superclass.initComponent.call(this);
	},
	//创建面板顶部的工具条
	setTarDone : function() {
		this.tbar = new Epo.Erp.${model.moduleName}.View.Top.Toolbar({});
	},
	//创建面板顶部查询表单
	setFormDone:function() {
		this.items = [new Epo.Erp.${model.moduleName}.View.Top.Form({})];
	}
});
