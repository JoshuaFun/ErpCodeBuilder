Ext.ns('Epo.Erp.${model.moduleName}.Function.Handler');
/**********************************TOP TOOLBAR*************************************/
//查询
Epo.Erp.${model.moduleName}.Function.Handler.query = function() {
	alert('query');return;
	Epo.Erp.${model.moduleName}.Function.Comm.query();
};
//重置
Epo.Erp.${model.moduleName}.Function.Handler.reset = function(){
	Ext.getCmp('${model.moduleName}ViewTopForm').getForm().reset();
};
//导出
Epo.Erp.${model.moduleName}.Function.Handler.exp = function() {
	alert('exp');return;
	Epo.Erp.${model.moduleName}.Function.Comm.exp();
};
/**********************************CENTER GRID TOOLBAR*************************************/
//新增
Epo.Erp.${model.moduleName}.Function.Handler.add = function(){
	var r = new Ext.data.Record({
	<#list model.gridColumnMappingList as item>
		<#assign arr=(item?split(","))>
		<#if (item_index < model.gridColumnMappingList?size-1) >
		${arr[1]} : "",
		<#else>
		${arr[1]} : ""
		</#if>
	</#list>
	});
	var store = Ext.getCmp('${model.moduleName}ViewCenterGrid').store;
	var rowIndex = store.data.length;
	store.insert(rowIndex, r);
<#list model.gridColumnMappingList as item>
	<#assign arr=(item?split(","))>
	store.getAt(rowIndex).set('${arr[1]}', '');
</#list>
};
//删除
Epo.Erp.${model.moduleName}.Function.Handler.del = function(){
	var sm = Ext.getCmp("${model.moduleName}ViewCenterGrid").getSelectionModel();
	if(!sm.hasSelection()){
		showMessage("没有选择行");
		return;
	}
	Ext.MessageBox.confirm("删除记录", "是否删除记录", function(e) {
		if (e == "yes") {
			alert('del');return;
			Epo.Erp.${model.moduleName}.Function.Comm.del(sm.getSelections());
		}
	});
};
//保存
Epo.Erp.${model.moduleName}.Function.Handler.save = function(){
	var modified = Ext.getCmp('${model.moduleName}ViewCenterGrid').store.modified;
	var datas = [];
	Ext.each(modified, function(item) {
		datas.push(item.data);
	});
	if (datas.length > 0) {
		if (!Epo.Erp.${model.moduleName}.Function.Comm.checkEmptyModifiedData(datas)) {
			Ext.Msg.alert("输入有误", "值不能为空！");
			return;
		}
	} else {
	    Ext.Msg.alert("警告", "没有任何需要更新的数据！");
	    return;
	}
	Ext.MessageBox.confirm("保存记录", "是否保存记录", function(e) {
		if (e == "yes") {
			alert('save');return;
			Epo.Erp.${model.moduleName}.Function.Comm.save(datas);
		}
	});
};
