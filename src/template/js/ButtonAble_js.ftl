// setButtonsStatus //设置buttons状态的函数
// 可用的配置有一下几种

// status00 已截止
// status10 已录入
// status20 初审
// status30 已终审
// init		初始状态
// add		新增中
// modify   修改中
// run		已执行

Ext.ns('Epo.Erp.${model.moduleName}');
Epo.Erp.${model.moduleName}.ButtonAble = Ext.extend(Ext.util.Observable,{
	initComponent:function(){
		Epo.Erp.${model.moduleName}.ButtonAble.superclass.initComponent.call(this);
	},
	buttonsPermission:[],   
	setDone:function(_type,_cfg){
		this._nowType=_type;
		this._nowCfg=_cfg;
		var _conf=this[_type];
		if(!_conf){
			this.setDone('init',_cfg);
			return;  
		}
		for(var _key in _conf){
	    	if(Ext.getCmp(_key)){
	    		if(this.buttonsPermission[_key]){
	    			Ext.getCmp(_key).setDisabled(_conf[_key]);
	    		}else{
	    			Ext.getCmp(_key).setDisabled(true);
	    		}
	    	} 
	  	}
	},
	_nowType:'',//现时设置类型
	_nowCfg:{},//现时设置配置
	resetDone:function(){
		this.setDone(this._nowType,this._nowCfg);
	}
});
  