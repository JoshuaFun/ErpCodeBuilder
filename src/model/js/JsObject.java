package model.js;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class JsObject {
	private String moduleName;
	private Map<String, String> formItems = new LinkedHashMap<String, String>();//form Items
	private List<String> gridColumnMappingList = new ArrayList<String>();

	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	
	public Map<String, String> getFormItems() {
		return formItems;
	}
	/**
	 * Form表单元素对象，key-value键值对
	 * @param objName 表单元素对象_英文名称(驼峰命名)
	 * @param fieldLabel 表单元素对象_属性fieldLabel名称
	 */
	public void putFormItems(String objName, String fieldLabel) {
		this.formItems.put(objName, fieldLabel);
	}
	
	public List<String> getGridColumnMappingList() {
		return gridColumnMappingList;
	}
	/**
	 * 逗号相隔字符串
	 * @param str "header中文,dataIndex英文(驼峰命名),mapping英文（对应sql select语句列别名）,editor(true/false)"
	 */
	public void addGridColumnMappingList(String str) {
		this.gridColumnMappingList.add(str);
	}

}
