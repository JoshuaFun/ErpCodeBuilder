import model.js.JsObject;
import engine.FreeMarkerEngine;

public class BuildJs {
	static String TEMP_PATH = "E:/projs/ErpCodeBuilder/bin/template/js";
	
	public static void main(String[] args){
//		Demo demo = new Demo();
//		demo.setName("测试");
//		demo.setParams("param1", "p1");
//		demo.setParams("param2", "p2");
//		demo.setParams("param3", "p3");
//		demo.addListObj("l1");
//		demo.addListObj("l2");
//		demo.addListObj("l3");
//	    FreeMarkerEngine.buildDemo(demo, TEMP_PATH);

		JsObject model = new JsObject();
		//必须首字母大写
		model.setModuleName("DemoBase13");
		//逗号相隔字符串，顺序必须依次为：header中文、dataIndex英文(驼峰命名)、mapping英文（对应sql select语句列别名）、editor(true/false)
		model.addGridColumnMappingList("主键, tcRowid, tc_rowid, false");
		model.addGridColumnMappingList("代号, tcCode, tc_code, true");
		model.addGridColumnMappingList("名称, tcName, tc_name, true");
		//key-value键值对，顺序必须依次为：objName英文(驼峰命名)， fieldLabel中文
		model.putFormItems("tcRowid", "主键");
		model.putFormItems("tcCode", "代号");
		model.putFormItems("tcName", "名称");
		FreeMarkerEngine.buildCodeJs(model, TEMP_PATH);
	}
}
