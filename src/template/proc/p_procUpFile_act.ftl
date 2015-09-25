/*********************************************************************************PROC_UPLOAD_ACT*/
create or replace procedure p_upload_xls_${model.procName}_act(
${'\t'}${'\t'}${'\t'}    a_keyArray         in array_varchar2_50,
${'\t'}${'\t'}${'\t'}    a_valueArray       in array_varchar2_50,
${'\t'}${'\t'}${'\t'}    a_dataArray        in array_varchar2_50,--EXCEL内容，一行一串逗号隔开
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
  v_sql         varchar2(30000);
  v_userid      varchar2(100);
  v_tempTable   varchar2(100);
  v_saveMode    varchar2(10);
  <#list model.formParams?keys as key>
  v_${key} ${(model.formParams[key])};
  </#list>
  v_outColCount number(2);
  v_success     varchar2(100);
  v_msg         varchar2(3000);
begin
  a_success  := '1';
  a_message  := ' ';
  a_out_info := 'data';
  --获取表单参数
  <#list model.formParams?keys as key>
  v_${key} := f_get_value_by_key_in_array(a_keyArray, a_valueArray, '${key}');
  </#list>
  --导入方式
  v_saveMode := f_get_value_by_key_in_array(a_keyarray, a_valuearray, 'saveMode');
  --用户rowid
  v_userid := f_get_value_by_key_in_array(a_keyarray, a_valuearray, 'userId');
  if v_userid is null then
    v_userid := 1;
  end if;
  ------------------------------------插入临时表------------------------------------
  p_upload_xls_to_tmpp_bro(a_dataArray,
                           v_tempTable,
                           v_outColCount,
                           v_success,
                           v_msg);
  ------------------------------------验证------------------------------------
  p_upload_xls_${model.procName}_chk_bro(
  v_tempTable, 
  v_saveMode, 
  <#list model.formParams?keys as key>
  v_${key},
  </#list>
  v_success, 
  v_msg);
  ------------------------------------插入正式表------------------------------------
  if v_success = 'true' then
    p_upload_xls_${model.procName}_ins_bro(
    v_tempTable,
    <#list model.formParams?keys as key>
    v_${key},
    </#list>
    v_success);
  end if;
  --返回结果
  if v_success = 'true' then
    a_success := '1';
    a_message := '恭喜你,';
  else
    a_success := '0';
    a_message := v_msg;
  end if;
  --输出数组
  a_out_keyArray   := array_varchar2_50();
  a_out_valueArray := array_varchar2_50();
  a_out_keyArray.extend;
  a_out_keyArray(a_out_keyArray.count) := 'errorInfo';
  a_out_valueArray.extend;
  a_out_valueArray(a_out_valueArray.count) := '错误资料信息';
  --返回错误信息提示到xls
  if v_success = 'true' then
    open a_out_cursor for
      select 1 from dual where 1 = 0;
  else
    v_sql := 'select';
    for i in 1..v_outColCount loop
      v_sql := v_sql||' tc_'||i||',';
    end loop;
    v_sql := v_sql||' tc_err_msg from '||v_tempTable;
    open a_out_cursor for v_sql;
  end if;
exception
  when others then
    a_success := '0';
    a_message := '导入资料失败';
    open a_out_cursor for
      select 1 from dual where 1 = 0;
    raise_application_error(-20001, sqlerrm || '(' || sqlcode || ')');
end;

