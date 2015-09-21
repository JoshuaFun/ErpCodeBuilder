Ext.ns('Epo.Erp.${model.moduleName}.View.Top');
Epo.Erp.${model.moduleName}.View.Top.Form = Ext.extend(Ext.form.FormPanel, {
	id:'${model.moduleName}ViewTopForm',
	frame : false,
	border : false,
	autoScroll:true,
	labelWidth:80,
	labelAlign:'right',
	// 初始化
	initComponent:function() {
		this.setItemsDone();
		Epo.Erp.${model.moduleName}.View.Top.Form.superclass.initComponent.call(this);
	},
	//创建表单项
	setItemsDone:function() {
	<#list model.formItems?keys as key>
	  	this.${key?trim} = new Ext.form.TextField({
	  		fieldLabel : '${(model.formItems[key])?trim}'
	  	});
	</#list>
		//表单布局
		this.items = [{
			layout:'table',
			border:false,
			layoutConfig:{columns:${model.formItems?size}},
			style:'padding-top:5px',
			items:
			[
			<#list model.formItems?keys as key>
			  	<#if key_index < model.formItems?size-1 >
			  	{layout:'form',items:[this.${key?trim}]},
			  	<#else>
			  	{layout:'form',items:[this.${key?trim}]}
			  	</#if>
			</#list>
			]
		}];
	}
});
