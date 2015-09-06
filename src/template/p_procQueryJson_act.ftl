/*********************************************************************************PROC_ACTION*/
create or replace procedure p_${model.procName}_act(
${'\t'}${'\t'}${'\t'}    a_key_array         in array_varchar2_50,
${'\t'}${'\t'}${'\t'}    a_value_array       in array_varchar2_50,
${'\t'}${'\t'}${'\t'}    a_out_success       out varchar2,
${'\t'}${'\t'}${'\t'}    a_out_msg           out varchar2,
${'\t'}${'\t'}${'\t'}    a_out_keyArray      out array_varchar2_50,
${'\t'}${'\t'}${'\t'}    a_out_valueArray	 out array_varchar2_50,
${'\t'}${'\t'}${'\t'}    a_out_cursor        out sys_refcursor) is
  /*
  -- ${model.devUserName} ${model.devDate}
  -- 模块功能：${model.procMsg}
  */
  --表单参数
  <#list model.formParams?keys as key>
  v_${key} ${(model.formParams[key])};
  </#list>
  --内置参数
  v_user_rowid number;
begin
  --获取表单参数
  <#list model.formParams?keys as key>
  v_${key} := f_get_value_by_key_in_array(a_key_array, a_value_array, '${key}');
  </#list>
  v_user_rowid := f_get_value_by_key_in_array(a_key_array, a_value_array, 'userTcRowid');
  --业务逻辑处理
  p_${model.procName}_bro(
  <#list model.formParams?keys as key>
  ${'\t'}${'\t'}v_${key},
  </#list>
  ${'\t'}${'\t'}v_user_rowid,
  ${'\t'}${'\t'}a_out_cursor);
  --返回信息标志
  a_out_success := 'true';
  a_out_msg     := 'OK';
exception
  when others then
    rollback;
    a_out_success := 'false';
    a_out_msg     := replace(sqlerrm, 'ORA-20000:');
    open a_out_cursor for
      select 0 from dual where 1 = 0;
    -- raise_application_error(-20000, 'ddddsfdsd');
end;

