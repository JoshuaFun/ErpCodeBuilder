/*********************************************************************************PROC_BO*/
create or replace procedure p_${model.procName}_bo(
<#list model.formParams?keys as key>
${'\t'}${'\t'}${'\t'}    a_${key}            in <#if model.formParams[key]?index_of("number")!=-1>number<#else>varchar2</#if>,
</#list>
<#list model.formParamsArray?keys as key>
${'\t'}${'\t'}${'\t'}    a_${key}_array in ${(model.formParamsArray[key])},
</#list>
${'\t'}${'\t'}${'\t'}    a_userTcRowid		 in number,
${'\t'}${'\t'}${'\t'}    a_out_rtn           out number,
${'\t'}${'\t'}${'\t'}    a_out_success       out varchar2,
${'\t'}${'\t'}${'\t'}    a_out_msg           out varchar2) is
  /*
  -- ${model.devUserName} ${model.devDate}
  -- 模块功能：${model.procMsg}
  */
begin
  p_${model.procName}_bro(
  <#list model.formParams?keys as key>
  a_${key},
  </#list>
  <#list model.formParamsArray?keys as key>
  a_${key}_array,
  </#list>
  a_userTcRowid,
  a_out_rtn,
  a_out_success,
  a_out_msg);
  commit;
exception
  when others then
    rollback;
    a_out_success := 'false';
    a_out_msg     := sqlerrm || '(' || sqlcode || ')';
end;

