package model;

import java.util.HashMap;
import java.util.Map;

public class ProcJson extends BaseProc {
	private Map<String,Object> formParamsArray = new HashMap<String,Object>();//表单数组参数
	public Map<String, Object> getFormParamsArray() {
		return formParamsArray;
	}
	public void putFormParamsArrayObj(String key, Object value) {
		this.formParamsArray.put(key, value);
	}
}
