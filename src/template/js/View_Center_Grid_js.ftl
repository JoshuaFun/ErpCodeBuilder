Ext.ns('Epo.Erp.${model.moduleName}.View.Center');
Epo.Erp.${model.moduleName}.View.Center.Grid = Ext.extend(Ext.grid.EditorGridPanel, {
	id : '${model.moduleName}ViewCenterGrid',
	loadMask : true,// 加载数据时遮蔽表格
	autoScroll : true,
	//单元格编辑后事件
	listeners : {},
	// 初始化
	initComponent : function() {
		Ext.applyIf(this, {pageSizeInVar:10});
		this.setSmDone();
		this.setStoreDone();
		this.setTbarDone();
		this.setBbarDone();
		this.setCmDone();
		Epo.Erp.${model.moduleName}.View.Center.Grid.superclass.initComponent.call(this);
	},
	setSmDone : function(){
		this.sm = new Ext.grid.CheckboxSelectionModel({
		    listeners:{
		        'rowselect':Epo.Erp.${model.moduleName}.Function.Listeners.rowSelectOrDeSelectDone,
		        'rowdeselect':Epo.Erp.${model.moduleName}.Function.Listeners.rowSelectOrDeSelectDone
		    }
		});
	},
	setStoreDone : function(){
		this.url = Epo_Erp_${model.moduleName}['URL']['${model.moduleName?uncap_first}_query'];
		this.store = new Epo.Ux.Store({
			autoLoad:false,
			pruneModifiedRecords:true,
			proxy:new Ext.data.HttpProxy({url:this.url}),
			baseParams:{start:0,limit:this.pageSizeInVar},
			reader:new Ext.data.JsonReader({root:'root',totalProperty:'totalSize'},
						Ext.data.Record.create([
						<#list model.gridColumnMappingList as item>
							<#assign arr=(item?split(","))>
							<#if (item_index < model.gridColumnMappingList?size-1) >
							{name:'${arr[1]?trim}', mapping:'${arr[2]?trim}'},
							<#else>
							{name:'${arr[1]?trim}', mapping:'${arr[2]?trim}'}
							</#if>
						</#list>
						])
					)
		});
		//定义查询条件
		this.store.on("beforeload",function(){
			Ext.apply(this.store.baseParams,{
				<#list model.formItems?keys as key>
				  	<#if key_index < model.formItems?size-1 >
				  	${key}: Ext.getCmp('${model.moduleName}ViewTopForm').${key}.getValue(),
				  	<#else>
				  	${key}: Ext.getCmp('${model.moduleName}ViewTopForm').${key}.getValue()
				  	</#if>
				</#list>
			});
//			var _params = this.store.baseParams;
//			Ext.apply(this.store.baseParams, {"_storePermission" : Ext.getCmp('${model.moduleName}ViewTopForm').storeSelector.getDataDone()});
//			Ext.apply(this.store.baseParams, Ext.getCmp('${model.moduleName}ViewTopForm').vipCustomerInfoSelector.getParamsDone());
//			Ext.apply(this.store.baseParams, Ext.getCmp('${model.moduleName}ViewTopForm').vipCardSelector.getParamsDone());
		}.createDelegate(this));
	},
	setTbarDone : function() {
		//新增
		this.addButton = new Ext.Button({id:'addButton', iconCls:"table_add", text:'新增', handler:function(){
			Epo.Erp.${model.moduleName}.Function.Handler.add();
		}});
		//删除
		this.delButton = new Ext.Button({id:'delButton', iconCls:"table_del", text:'删除', handler:function(){
			Epo.Erp.${model.moduleName}.Function.Handler.del();
		}});
		//保存
		this.saveButton = new Ext.Button({id:'saveButton', iconCls:"saveButton", text:'保存', handler:function(){
			Epo.Erp.${model.moduleName}.Function.Handler.save();
		}});
		//导入
		this.impButton = new Epo.Erp.ImpFile.Button({
			procName : 'upload_xls_${model.moduleName}_act',
			tempName : 'imp${model.moduleName}Data.xls',
			iconCls : 'importButtons',
			openSaveMode : true,
			callback : function(actionResult){
				if (actionResult.success = "1") {
					Epo.Erp.${model.moduleName}.Function.Handler.query();
				}
			}
		});
		this.tbar = [this.addButton,
		             this.delButton,
		             this.saveButton,
		             this.impButton];
	},
	setBbarDone : function() {
		this.bbar = new Ext.PagingToolbar({
			pageSize : this.pageSizeInVar,
			store : this.store,
			displayInfo : true,
			displayMsg : '共 {2} 条',
			emptyMsg : "没有记录",
			plugins : [new Ext.Ux.PageSizePlugin({width:60, pageListInVar:'10,20,30,40,50'})]
		});
	},
	setCmDone : function(){
		this.cm = new Ext.grid.ColumnModel([
			new Ext.grid.RowNumberer(),
			new Ext.grid.CheckboxSelectionModel(),
		<#list model.gridColumnMappingList as item>
			<#assign arr=(item?split(","))>
			<#if (item_index < model.gridColumnMappingList?size-1) >
		    {header:'${arr[0]?trim}', dataIndex:'${arr[1]?trim}', sortable:true<#if arr[3]?trim=='true' >, editor:new Ext.form.TextField()</#if>},
			<#else>
		    {header:'${arr[0]?trim}', dataIndex:'${arr[1]?trim}', sortable:true<#if arr[3]?trim=='true' >, editor:new Ext.form.TextField()</#if>}
			</#if>
		</#list>
		]);
	}
});
