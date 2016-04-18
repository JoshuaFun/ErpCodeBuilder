package model.proc;

import java.util.LinkedHashMap;

public class ProcJson extends BaseProc {
	private LinkedHashMap<String,Object> formParamsArray = new LinkedHashMap<String,Object>();//表单数组参数
	public LinkedHashMap<String, Object> getFormParamsArray() {
		return formParamsArray;
	}
	public void putFormParamsArrayObj(String key, Object value) {
		this.formParamsArray.put(key, value);
	}
}
