/*********************************************************************************PROC_BRO*/
create or replace procedure p_${model.procName}_bro(
<#list model.formParams?keys as key>
${'\t'}${'\t'}${'\t'}    a_${key}            in <#if model.formParams[key]?index_of("number")!=-1>number<#else>varchar2</#if>,
</#list>
${'\t'}${'\t'}${'\t'}    a_start	in varchar2,
${'\t'}${'\t'}${'\t'}    a_limit	in varchar2,
${'\t'}${'\t'}${'\t'}    a_userTcRowid in number,
<#if model.storePermission>
${'\t'}${'\t'}${'\t'}    a_storePermission   in varchar2,
${'\t'}${'\t'}${'\t'}    a_storeRowidArray   in array_num,
<#else></#if>
<#if model.pluPermission>
${'\t'}${'\t'}${'\t'}    a_pluRowidRrray     in array_num,
${'\t'}${'\t'}${'\t'}    a_pluSQL            in varchar2,
<#else></#if>
${'\t'}${'\t'}${'\t'}    a_out_count out number,
${'\t'}${'\t'}${'\t'}    a_out_cursor out sys_refcursor) is
  /*
  -- ${model.devUserName} ${model.devDate}
  -- 模块功能：${model.procMsg}
  */
  --定义sql语句变量
  v_sql           varchar2(10000);
  v_sql_select    varchar2(3000);
  v_sql_fromWhere varchar2(5000);
  v_sql_order     varchar2(1000);
  v_keyArray      array_varchar2_50;
  v_valueArray    array_varchar2_50;
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
  
  v_sql_select := 'select 1';
  v_sql_fromWhere := ' from dual';
  
  --分页起始start.结束limit
  v_keyArray   := new array_varchar2_50();
  v_valueArray := new array_varchar2_50();
  v_keyArray.extend;
  v_keyArray(v_keyArray.count) := 'start';
  v_valueArray.extend;
  v_valueArray(v_valueArray.count) := a_start;
  v_keyArray.extend;
  v_keyArray(v_keyArray.count) := 'limit';
  v_valueArray.extend;
  v_valueArray(v_valueArray.count) := a_limit;
  --拼接分页查询sql
  v_sql := f_stk_query_fill_page_0a(v_keyArray, v_valueArray, v_sql_select, v_sql_fromWhere, v_sql_order, a_out_count);
  --返回结果集
  open a_out_cursor for v_sql;
end;

