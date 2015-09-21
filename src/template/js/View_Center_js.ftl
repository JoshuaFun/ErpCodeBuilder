Ext.ns('Epo.Erp.${model.moduleName}.View');
Epo.Erp.${model.moduleName}.View.Center = Ext.extend(Ext.Panel, {
	id : '${model.moduleName}ViewCenter',
	layout : 'fit',
	autoScroll:false,
	// 初始化
	initComponent : function() {
		this.setItemsDone();
		Epo.Erp.${model.moduleName}.View.Center.superclass.initComponent.call(this);
	},
	//创建AssignGrid
	setItemsDone : function() {
		new Epo.Erp.${model.moduleName}.View.Center.Grid({
			region : 'center',
			border : false,
			autoScroll : true
		});
		this.items = [Ext.getCmp('${model.moduleName}ViewCenterGrid')];
	}
});
