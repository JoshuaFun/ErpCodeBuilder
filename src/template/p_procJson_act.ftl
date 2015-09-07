/*********************************************************************************PROC_ACTION*/
create or replace procedure p_${model.procName}_act(
${'\t'}${'\t'}${'\t'}    a_keyArray         in array_varchar2_50,
${'\t'}${'\t'}${'\t'}    a_valueArray       in array_varchar2_50,
<#list model.formParamsArray?keys as key>
${'\t'}${'\t'}${'\t'}    a_${key}Array in ${(model.formParamsArray[key])},
</#list>
${'\t'}${'\t'}${'\t'}    a_out_success       out varchar2,
${'\t'}${'\t'}${'\t'}    a_out_msg           out varchar2,
${'\t'}${'\t'}${'\t'}    a_out_keyArray      out array_varchar2_50,
${'\t'}${'\t'}${'\t'}    a_out_valueArray    out array_varchar2_50) is
  /*
  -- ${model.devUserName} ${model.devDate}
  -- 模块功能：${model.procMsg}
  */
  --表单参数
  <#list model.formParams?keys as key>
  v_${key} ${(model.formParams[key])};
  </#list>
  --内置参数
  v_userTcRowid number;
  --返回值
  v_out_rtn varchar2(100);
begin
  --获取表单参数
  <#list model.formParams?keys as key>
  v_${key} := f_get_value_by_key_in_array(a_keyArray, a_valueArray, '${key}');
  </#list>
  v_userTcRowid := f_get_value_by_key_in_array(a_keyArray, a_valueArray, 'userTcRowid');
  --业务逻辑处理
  p_${model.procName}_bo(
  <#list model.formParams?keys as key>
  v_${key},
  </#list>
  <#list model.formParamsArray?keys as key>
  a_${key}Array,
  </#list>
  v_userTcRowid,
  v_out_rtn,
  a_out_success,
  a_out_msg);
  --设返回值
  a_out_keyArray := new array_varchar2_50();
  a_out_valueArray := new array_varchar2_50();

  a_out_keyArray.Extend;
  a_out_valueArray.Extend;
  a_out_keyArray(a_out_keyArray.Count) := 'rtn_val';
  a_out_valueArray(a_out_valueArray.Count) := v_out_rtn;
end;

