/*********************************************************************************PROC_UPLOAD_INS_BRO*/
create or replace procedure p_upload_xls_${model.procName}_ins_bro(
${'\t'}${'\t'}${'\t'}    a_tempTable   in varchar2,
<#list model.formParams?keys as key>
${'\t'}${'\t'}${'\t'}    a_${key}      in <#if model.formParams[key]?index_of("number")!=-1>number<#else>varchar2</#if>,
</#list>
${'\t'}${'\t'}${'\t'}    a_out_success out varchar2) is
  /*
  -- ${model.devUserName} ${model.devDate}
  -- 模块功能：${model.procMsg}
  */
  v_sql varchar2(30000);
begin
  ----------------------插入正式表------------------------
  v_sql := 'select 1 from dual';
  execute immediate v_sql;
  --返回结果
  a_out_success := 'true';
exception
  when others then
    rollback;
    a_out_success := 'false';
    raise_application_error(-20001, sqlerrm || '(' || sqlcode || ')');
end;



 