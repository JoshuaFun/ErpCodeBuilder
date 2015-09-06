package model;

import java.util.LinkedHashMap;
import java.util.Map;

public class BaseProc {
	private String devUserName;
	private String devDate;
	private String procName;//存储过程名
	private String procMsg;//功能说明
	private Map<String,Object> formParams = new LinkedHashMap<String,Object>();//表单参数
	
	public String getDevUserName() {
		return devUserName;
	}
	public void setDevUserName(String devUserName) {
		this.devUserName = devUserName;
	}
	public String getDevDate() {
		return devDate;
	}
	public void setDevDate(String devDate) {
		this.devDate = devDate;
	}
	public String getProcName() {
		return procName;
	}
	public void setProcName(String procName) {
		this.procName = procName;
	}
	public String getProcMsg() {
		return procMsg;
	}
	public void setProcMsg(String procMsg) {
		this.procMsg = procMsg;
	}
	public Map<String, Object> getFormParams() {
		return formParams;
	}
	public void putFormParamsObj(String key, Object value) {
		this.formParams.put(key, value);
	}
}
