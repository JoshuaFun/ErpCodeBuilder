/*********************************************************************************PROC_ACTION*/
create or replace procedure p_${model.procName}_act(
${'\t'}${'\t'}${'\t'}    a_keyArray         in array_varchar2_50,
${'\t'}${'\t'}${'\t'}    a_valueArray       in array_varchar2_50,
${'\t'}${'\t'}${'\t'}    a_storePermission  in varchar2,
${'\t'}${'\t'}${'\t'}    a_storeRowidArray  in array_num,
${'\t'}${'\t'}${'\t'}    a_out_count         out number,
${'\t'}${'\t'}${'\t'}    a_out_cursor        out sys_refcursor,
${'\t'}${'\t'}${'\t'}    a_out_success       out varchar2,
${'\t'}${'\t'}${'\t'}    a_out_msg           out varchar2) is
  /*
  -- ${model.devUserName} ${model.devDate}
  -- 模块功能：${model.procMsg}
  */
  --表单参数
  <#list model.formParams?keys as key>
  v_${key} ${(model.formParams[key])};
  </#list>
  --内置参数
  v_userTcRowid number(18);
  v_start varchar2(10);
  v_limit varchar2(10);
begin
  --获取表单参数
  <#list model.formParams?keys as key>
  v_${key} := f_get_value_by_key_in_array(a_keyArray, a_valueArray, '${key}');
  </#list>
  v_userTcRowid := f_get_value_by_key_in_array(a_keyArray, a_valueArray, 'userTcRowid');
  v_start := f_get_value_by_key_in_array(a_keyArray, a_valueArray, 'start');
  v_limit := f_get_value_by_key_in_array(a_keyArray, a_valueArray, 'limit');
  --业务逻辑处理
  p_${model.procName}_bro(
  <#list model.formParams?keys as key>
  ${'\t'}${'\t'}v_${key},
  </#list>
  ${'\t'}${'\t'}v_userTcRowid,
  ${'\t'}${'\t'}a_storePermission,
  ${'\t'}${'\t'}a_storeRowidArray,
  ${'\t'}${'\t'}v_start,
  ${'\t'}${'\t'}v_limit,
  ${'\t'}${'\t'}a_out_count,
  ${'\t'}${'\t'}a_out_cursor);
  --返回信息标志
  a_out_success := 'true';
  a_out_msg     := 'OK';
exception
  when others then
    rollback;
    a_out_success := 'false';
    a_out_msg     := replace(sqlerrm, 'ORA-20000:');
    a_out_count   := 0;
    open a_out_cursor for
      select 0 from dual where 1 = 0;
    -- raise_application_error(-20000, 'ddddsfdsd');
end;

