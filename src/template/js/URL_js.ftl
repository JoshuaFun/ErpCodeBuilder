Ext.ns('Epo.Erp.${model.moduleName}.URL');
Epo.Erp.${model.moduleName}.URL.getDone = function(){
	var _URLList = {};
	_URLList['${model.moduleName?uncap_first}_doWhat'] = App_Path + '/jsp/sysJson/procJson.action?proc=p_${model.moduleName}_dowhat_act';
	_URLList['${model.moduleName?uncap_first}_del']    = App_Path + '/jsp/sysJson/procJson.action?proc=p_${model.moduleName}_del_act';
	_URLList['${model.moduleName?uncap_first}_save']   = App_Path + '/jsp/sysJson/procJson.action?proc=p_${model.moduleName}_save_act';
	_URLList['${model.moduleName?uncap_first}_query']  = App_Path + '/jsp/sysJson/pagedQueryJson.action?proc=p_${model.moduleName}_query_act&_listType=mapn';
	_URLList['${model.moduleName?uncap_first}_exp']    = App_Path + '/app/baseJson/exportFile.action?do=export${model.moduleName}Data';
	return _URLList;
};
