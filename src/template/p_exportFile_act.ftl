/*********************************************************************************PROC_EXPORT_ACT*/
create or replace procedure p_export_${model.procName}_data_act(
${'\t'}${'\t'}${'\t'}    a_keyArray         in array_varchar2_50,
${'\t'}${'\t'}${'\t'}    a_valueArray       in array_varchar2_50,
<#if model.storePermission>
${'\t'}${'\t'}${'\t'}    a_storePermission   in varchar2,
${'\t'}${'\t'}${'\t'}    a_storeRowidArray   in array_num,
<#else></#if>
<#if model.pluPermission>
${'\t'}${'\t'}${'\t'}    a_pluRowidRrray     in array_num,
${'\t'}${'\t'}${'\t'}    a_pluSQL            in varchar2,
<#else></#if>
${'\t'}${'\t'}${'\t'}    a_success        out varchar2,
${'\t'}${'\t'}${'\t'}    a_message        out varchar2,
${'\t'}${'\t'}${'\t'}    a_out_keyArray   out array_varchar2_50,
${'\t'}${'\t'}${'\t'}    a_out_valueArray out array_varchar2_50,
${'\t'}${'\t'}${'\t'}    a_out_cursor     out sys_refcursor,
${'\t'}${'\t'}${'\t'}    a_out_info       out varchar2) is
  /*
  -- ${model.devUserName} ${model.devDate}
  -- 模块功能：${model.procMsg}
  */
  v_count number(18);
begin
  a_out_info := 'data';
  --业务逻辑处理
  p_${model.procName}_query_act(
  ${'\t'}${'\t'}a_keyArray,
  ${'\t'}${'\t'}a_valueArray,
  <#if model.storePermission>
  ${'\t'}${'\t'}a_storePermission,
  ${'\t'}${'\t'}a_storeRowidArray,
  <#else></#if>
  <#if model.pluPermission>
  ${'\t'}${'\t'}a_pluRowidRrray,
  ${'\t'}${'\t'}a_pluSQL,
  <#else></#if>
  ${'\t'}${'\t'}v_count,
  ${'\t'}${'\t'}a_out_cursor,
  ${'\t'}${'\t'}a_success,
  ${'\t'}${'\t'}a_message);
end;

