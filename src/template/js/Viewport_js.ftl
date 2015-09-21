Ext.ns('Epo.Erp.${model.moduleName}');
Epo.Erp.${model.moduleName}.Viewport = Ext.extend(Ext.Panel, {
	style:'padding:5px;background:#DFE8F6',
	autoScroll : true,
	layout : 'border',
	// 初始化
	initComponent : function() {
		this.width=Epo.Ext.Utils.Comm.getMaxWidth(900);
		this.height=Epo.Ext.Utils.Comm.getMaxHeight(500);
		Epo.Ext.Utils.Comm.autoResizeDone(this, 900, 500);//自适应尺寸
		this.setItemsDone();
		Epo.Erp.${model.moduleName}.Viewport.superclass.initComponent.call(this);
	},
	setItemsDone : function(){
		this.items = [
			new Epo.Erp.${model.moduleName}.View.Top({region:'north',height:62,split:true}),
			new Epo.Erp.${model.moduleName}.View.Center({region:'center'}),
			new Epo.Erp.${model.moduleName}.View.Bottom({region:'south',height:25,split:true})
		];
	}
});
