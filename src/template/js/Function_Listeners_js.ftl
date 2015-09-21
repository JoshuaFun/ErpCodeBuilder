Ext.ns('Epo.Erp.${model.moduleName}.Function.Listeners');
//实例化事件监听
Epo.Erp.${model.moduleName}.Function.Listeners.initDone = function(){
};
//Grid勾选ckb事件
Epo.Erp.${model.moduleName}.Function.Listeners.rowSelectOrDeSelectDone = function(_sm, _rowIndex, _record){
	var r = Ext.getCmp('${model.moduleName}ViewCenterGrid').getSelectionModel().getSelections();
	Ext.getCmp('${model.moduleName}ViewBottom').selectedOrders.setValue(r.length);//选中单数
};
