Ext.ns('Epo.Erp.${model.moduleName}.Function.Comm');
/**********************************TOP TOOLBAR*************************************/
//查询
Epo.Erp.${model.moduleName}.Function.Comm.query = function() {
	Ext.getCmp('${model.moduleName}ViewCenterGrid').store.load({params:{start:0}});
};
//导出
Epo.Erp.${model.moduleName}.Function.Comm.exp = function() {
	var url = Epo_Erp_${model.moduleName}['URL']['${model.moduleName?uncap_first}_exp']
	+'&start=0'
	+'&limit=99999'
	<#list model.formItems?keys as key>
  	<#if key_index < model.formItems?size-1 >
  	+'&${key}='+Ext.getCmp('${model.moduleName}ViewTopForm').${key}.getValue()
  	<#else>
  	+'&${key}='+Ext.getCmp('${model.moduleName}ViewTopForm').${key}.getValue();
  	</#if>
	</#list>
	Epo.ExpExcel.submitForm(
		//action url
		url,
		//excel 文件名
		"${model.moduleName}记录查询",
		//excel 大标题
		"${model.moduleName}记录查询",
		//excel 列标题
		"<#rt>
		<#list model.gridColumnMappingList as item>
			<#assign arr=(item?split(","))>
			<#if (item_index < model.gridColumnMappingList?size-1) >
			${arr[0]},<#t>
			<#else>
			${arr[0]}<#lt>",
			</#if>
		</#list>
		//sql 语句列别名
		"<#rt>
		<#list model.gridColumnMappingList as item>
			<#assign arr=(item?split(","))>
			<#if (item_index < model.gridColumnMappingList?size-1) >
			${arr[2]},<#t>
			<#else>
			${arr[2]}<#lt>")
			</#if>
		</#list>
};
/**********************************CENTER GRID TOOLBAR*************************************/
//新增
Epo.Erp.${model.moduleName}.Function.Comm.add = function(_params) {
};
//删除
Epo.Erp.${model.moduleName}.Function.Comm.del = function(_rowSelections) {
	var rowidArr = [];
	for(var i = 0, r; r = _rowSelections[i]; i++){
		if (_rowSelections[i].get("tcRowid")!=''){
			//tcRowid不为空，拼装rowid数组，准备提交后台删除
			rowidArr.push(_rowSelections[i].get("tcRowid"));
		} else {
			//tcRowid为空，直接页面删除
			Ext.getCmp('${model.moduleName}ViewCenterGrid').store.remove(r);
		}
	}
	//后台删除记录
	if (rowidArr.length > 0){
		Epo.Ext.Utils.Net.formSubmit(null,{
			url : Epo_Erp_${model.moduleName}['URL']['${model.moduleName?uncap_first}_del'],
			params : {_array_01_ : rowidArr},
			successDone : function(_res){
				if(_res.success == true){
					showMessage("删除成功！");
					Ext.getCmp('${model.moduleName}ViewCenterGrid').store.load({params:{start:0}});
				} else {
					showMessage(_res.errMsg);
				}
			}
		});
	}
};
//保存
Epo.Erp.${model.moduleName}.Function.Comm.save = function(_datas) {
	var params = {
		_array_01_ : _getModifiedDatas(_datas)
	};
	Epo.Ext.Utils.Net.formSubmit(null,{
		url : Epo_Erp_${model.moduleName}['URL']['${model.moduleName?uncap_first}_save'],
		params : params,
		successDone : function(_res){
			if(_res.success == true){
				showMessage("保存成功！");
				Ext.getCmp('${model.moduleName}ViewCenterGrid').store.load({params:{start:0}});
			} else {
				showMessage(_res.errMsg);
			}
		}
	});
};
/**********************************OTHER FUNCTION*************************************/
//验证待提交保存的数据集合法性
Epo.Erp.${model.moduleName}.Function.Comm.checkEmptyModifiedData = function(_datas) {
	var flag = true;
	for (var i=0; i<_datas.length; i++) {
		if (<#rt>
		<#list model.gridColumnMappingList as item>
			<#assign arr=(item?split(","))>
			<#if (item_index < model.gridColumnMappingList?size-1) >
			_datas[i].${arr[1]}=="" || <#t>
			<#else>
			_datas[i].${arr[1]}==""<#lt>) {
			</#if>
		</#list>
			flag = false;
			break;
		}
	}
	return flag;
};
//获取待提交保存的数据集
function _getModifiedDatas(_datas) {
	var arr = [];
	for (var i=0; i<_datas.length; i++) {
		var r = "";
	<#list model.gridColumnMappingList as item>
		<#assign arr=(item?split(","))>
		<#if (item_index == 0) >
		r += ""  + _datas[i].${arr[1]};
		<#else>
		r += "|"  + _datas[i].${arr[1]};
		</#if>
	</#list>
		arr.push(r);
	}
	return arr;
}

