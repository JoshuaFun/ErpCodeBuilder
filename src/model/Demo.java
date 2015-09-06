package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户实体类
 * 
 * @author ole_fun
 * @time 2010-2-6下午04:05:25
 * @version 1.0
 */
public class Demo {
	private String name;
	private Map<String, Object> params = new HashMap<String, Object>();
	private List<String> list = new ArrayList<String>();
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Map<String, Object> getParams() {
		return params;
	}
	public void setParams(String key, Object value) {
		this.params.put(key, value);
	}
	
	public List<String> getList() {
		return list;
	}
	public void addListObj(String s){
		this.list.add(s);
	}
}