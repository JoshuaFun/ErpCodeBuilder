/*********************************************************************************PROC_BRO*/
create or replace procedure p_${model.procName}_bro(
<#list model.formParams?keys as key>
${'\t'}${'\t'}${'\t'}    a_${key}            in <#if model.formParams[key]?index_of("number")!=-1>number<#else>varchar2</#if>,
</#list>
${'\t'}${'\t'}${'\t'}    a_user_rowid in number,
${'\t'}${'\t'}${'\t'}    a_out_cursor out sys_refcursor) is
  /*
  -- ${model.devUserName} ${model.devDate}
  -- 模块功能：${model.procMsg}
  */
  --定义sql语句变量
  v_sql           varchar2(10000);
begin
  raise_application_error(-20000,'<br>'||
  <#list model.formParams?keys as key>
  	<#if key_index < model.formParams?size-1 >
  		'${key}:' || a_${key} ||'|<br>'||
  	<#else>
  		'${key}:' || a_${key} ||'|'
  	</#if>
  </#list>
  );
  
  v_sql := 'select 1 from dual';
  
  --返回结果集
  open a_out_cursor for v_sql;
end;

