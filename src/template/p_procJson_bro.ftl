/*********************************************************************************PROC_BRO*/
create or replace procedure p_${model.procName}_bro(
<#list model.formParams?keys as key>
${'\t'}${'\t'}${'\t'}    a_${key} in <#if model.formParams[key]?index_of("number")!=-1>number<#else>varchar2</#if>,
</#list>
<#list model.formParamsArray?keys as key>
${'\t'}${'\t'}${'\t'}    a_${key}Array in array_varchar2_50,
</#list>
${'\t'}${'\t'}${'\t'}    a_userTcRowid       in number,
${'\t'}${'\t'}${'\t'}    a_out_rtn         out number,
${'\t'}${'\t'}${'\t'}    a_out_success     out varchar2,
${'\t'}${'\t'}${'\t'}    a_out_msg         out varchar2) is
  /*
  -- ${model.devUserName} ${model.devDate}
  -- 模块功能：${model.procMsg}
  */
  --定义sql语句变量
  v_sql           varchar2(10000);
  v_sql_select    varchar2(3000);
  v_sql_fromWhere varchar2(5000);
  v_sql_order     varchar2(1000);
begin
  raise_application_error(-20000,'测试参数：<br>'||
  <#list model.formParams?keys as key>
  	<#if key_index < model.formParams?size-1 >
  		'${key}:' || a_${key} ||'|<br>'||
  	<#else>
  		'${key}:' || a_${key} ||'|'
  	</#if>
  </#list>
  );
  raise_application_error(-20000,'测试数组参数：<br>'||
  <#list model.formParamsArray?keys as key>
	<#if key_index < model.formParamsArray?size-1 >
		'v_${key}_array:' || a_${key}Array(1) ||'|<br>'||
	<#else>
		'v_${key}_array:' || a_${key}Array(1) ||'|'
	</#if>
  </#list>
  );
end;



 