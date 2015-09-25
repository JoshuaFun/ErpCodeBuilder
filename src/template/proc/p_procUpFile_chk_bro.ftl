/*********************************************************************************PROC_UPLOAD_CHK_BRO*/
create or replace procedure p_upload_xls_${model.procName}_chk_bro(
${'\t'}${'\t'}${'\t'}    a_tempTable   in varchar2,
${'\t'}${'\t'}${'\t'}    a_saveMode    in varchar2,
<#list model.formParams?keys as key>
${'\t'}${'\t'}${'\t'}    a_${key}      in <#if model.formParams[key]?index_of("number")!=-1>number<#else>varchar2</#if>,
</#list>
${'\t'}${'\t'}${'\t'}    a_out_success out varchar2,
${'\t'}${'\t'}${'\t'}    a_out_msg     out varchar2) is
  /*
  -- ${model.devUserName} ${model.devDate}
  -- 模块功能：${model.procMsg}
  */
  v_sql      varchar2(30000);
  v_chkWrong number;
  v_success  varchar2(100);
  v_msg      varchar2(3000);
begin
    --chk_double
    v_sql :='
    update '||a_tempTable||' t1
       set t1.tc_err_msg = t1.tc_err_msg||'||'''代号(重复);'''||'
     where exists (select 1 from '||a_tempTable||' t2
                    where t1.tc_1 = t2.tc_1
                   having count(1)>1
                    group by t2.tc_1)';
    execute immediate v_sql;
    --chk_exist
    v_sql :='
    update '||a_tempTable||' t1
       set t1.tc_err_msg = t1.tc_err_msg||'||'''代号(已存在);'''||'
     where exists (select 1 from tb_${model.procName}_0a t2
                    where t1.tc_1 = t2.tc_code)';
    execute immediate v_sql;
    --检测是否存在错误数据
    v_sql :='select count(1) from '||a_tempTable||' where tc_err_msg is not null';
    execute immediate v_sql into v_chkWrong;
    --有传入导入方式
    if a_saveMode is not null then
      if a_saveMode = '1' then--全部导入
        if v_chkWrong>0 then
          v_success := 'false';
          v_msg     := '存在错误数据,';
        else
          v_success := 'true';
        end if;
      else--部分导入
        v_success := 'true';
      end if;
    --没有传入导入方式
    else
      if v_chkWrong>0 then
        v_success := 'false';
        v_msg     := '存在错误数据,';
      else
        v_success := 'true';
      end if;
    end if;  
  --返回结果
  a_out_success := v_success;
  a_out_msg     := v_msg;
exception
  when others then
    a_out_success := 'false';
    a_out_msg     := '';
    --raise_application_error(-20001, sqlerrm || '(' || sqlcode || ')');
end;



 