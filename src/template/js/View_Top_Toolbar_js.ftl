Ext.ns('Epo.Erp.${model.moduleName}.View.Top');
Epo.Erp.${model.moduleName}.View.Top.Toolbar = Ext.extend(Ext.Toolbar, {
	// 初始化
	initComponent : function() {
		this.setItemsDone();
		Epo.Erp.${model.moduleName}.View.Top.Toolbar.superclass.initComponent.call(this);
	},
	setItemsDone : function(){
		//查询按钮
		this.queryButton = new Ext.Button({id:'queryButton', iconCls:"queryButton", text:'查询', handler:function(){
			Epo.Erp.${model.moduleName}.Function.Handler.query();
		}});
		//重置
		this.resetButton = new Ext.Button({text:'重置', iconCls:'remove', handler:function(){
				Epo.Erp.${model.moduleName}.Function.Handler.reset();
		}});
		//导出按钮
		this.expButton = new Ext.Button({id:'expButton', iconCls:"option", text:'导出', handler:function(){
			Epo.Erp.${model.moduleName}.Function.Handler.exp();
		}});
		//加载按钮
		this.items = [
		    this.queryButton,
		    this.resetButton,
		    this.expButton
		];
	}
});
