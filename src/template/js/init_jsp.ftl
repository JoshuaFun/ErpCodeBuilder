<!-- 页面描述: -->
<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ page import="com.ray.baseframework.tools.WebContextUtil"%>
<%@ taglib tagdir="/WEB-INF/tags/epo" prefix="epo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%!
public static String global_cssJsVersion = Long.toHexString(new Date().getTime()); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="<%=WebContextUtil.getWebRoot(request)%>/ext/extImageCss/css/image.css" />
<link rel="stylesheet" type="text/css" href="<%=WebContextUtil.getWebRoot(request)%>/ext/extImageCss/css/row.css" />
<script type="text/javascript">
//全局变量
var App_Path = '<%=WebContextUtil.getWebRoot(request)%>';
//权限列表
<%  //所有的按钮ID
	String[] buttons={
	};
	StringBuilder sb=new StringBuilder("var Epo_Erp_${model.moduleName}_ButtonAble_ButtonsPermission={");
	for(int i=0;i<buttons.length;i++){
		if(i>0){
			sb.append(",\n");
		}else{
			sb.append("\n");
		}
		boolean _hasPermission=false;
		_hasPermission=com.ray.baseframework.tools.PermissionUtil.isHasPermission("erp.${model.moduleName}Json."+buttons[i]);
		if(_hasPermission){
			sb.append(buttons[i]).append(" : 1");
		}else{
			sb.append(buttons[i]).append(" : 0");
		}
	}
	sb.append("\n};");
	out.print(sb);
%>
</script>
<!-- 常用公共值 -->
<epo:comm print="false" userQueryDateStr="true"></epo:comm>
<!-- 加载EXTJS库 -->
<epo:ext loadingMask="true" debug="true"></epo:ext>
<!-- 加载公共库 -->
<epo:extApp comm="true" commUx="true" epoPageTo="true" epoStkStatusLovCombo="true" epoConstantIsComboBox="true" epoEcOrderOrderTypeLovCombo="true" storeTriggerField="true" epoImpFileWindow="true"></epo:extApp>
<!-- vipCustomerInfo选择器1
<epo:vipCustomerInfoSelectorInc></epo:vipCustomerInfoSelectorInc>
 -->
<!-- vipCard选择器1
<epo:vipCardSelectorInc></epo:vipCardSelectorInc>
 -->
<!-- vipCustomerInfo选择器2
<epo:vipCustomerInfoSelector2Inc></epo:vipCustomerInfoSelector2Inc>
 -->
<!-- vipCard选择器2
<epo:vipCardSelector2Inc></epo:vipCardSelector2Inc>
-->
<!-- 引用店铺选择窗 
<epo:storeSelectorInc></epo:storeSelectorInc>
-->
<!-- 引入货号选择器 
<epo:pluSelectorInc></epo:pluSelectorInc>
-->
<style type="text/css">
.x-grid3-row td, .x-grid3-summary-row td{
	-moz-user-select: none;
	line-height: 13px;
	vertical-align: top;
	padding-left: 0px;
	padding-right: 1px;
}
</style>
<!-- 加载其他js -->
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/resources/js/extComm.js?<%=global_cssJsVersion %>"></script>
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/ext/epo/Ec.ExpressCompany.Combox.js?<%=global_cssJsVersion %>"></script>
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/ext/epo/Epo.ExpExcel.js?<%=global_cssJsVersion %>"></script>
<!-- 页面初始化 -->
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/erp/${model.moduleName?lower_case}/js/Epo.Erp.${model.moduleName}.ButtonAble.js?<%=global_cssJsVersion %>"></script>
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/erp/${model.moduleName?lower_case}/js/Epo.Erp.${model.moduleName}.URL.js?<%=global_cssJsVersion %>"></script>
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/erp/${model.moduleName?lower_case}/js/Epo.Erp.${model.moduleName}.Function.Comm.js?<%=global_cssJsVersion %>"></script>
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/erp/${model.moduleName?lower_case}/js/Epo.Erp.${model.moduleName}.Function.Handler.js?<%=global_cssJsVersion %>"></script>
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/erp/${model.moduleName?lower_case}/js/Epo.Erp.${model.moduleName}.Function.Listeners.js?<%=global_cssJsVersion %>"></script>
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/erp/${model.moduleName?lower_case}/js/Epo.Erp.${model.moduleName}.View.Bottom.js?<%=global_cssJsVersion %>"></script>
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/erp/${model.moduleName?lower_case}/js/Epo.Erp.${model.moduleName}.View.Center.js?<%=global_cssJsVersion %>"></script>
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/erp/${model.moduleName?lower_case}/js/Epo.Erp.${model.moduleName}.View.Center.Grid.js?<%=global_cssJsVersion %>"></script>
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/erp/${model.moduleName?lower_case}/js/Epo.Erp.${model.moduleName}.View.Top.js?<%=global_cssJsVersion %>"></script>
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/erp/${model.moduleName?lower_case}/js/Epo.Erp.${model.moduleName}.View.Top.Toolbar.js?<%=global_cssJsVersion %>"></script>
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/erp/${model.moduleName?lower_case}/js/Epo.Erp.${model.moduleName}.View.Top.Form.js?<%=global_cssJsVersion %>"></script>
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/erp/${model.moduleName?lower_case}/js/Epo.Erp.${model.moduleName}.Viewport.js?<%=global_cssJsVersion %>"></script>
<script type="text/javascript" src="<%=WebContextUtil.getWebRoot(request)%>/erp/${model.moduleName?lower_case}/js/Epo.Erp.${model.moduleName}.Init.js?<%=global_cssJsVersion %>"></script>
</head>
<body topmargin="0" leftmargin="0"></body>
</html>
