import model.PageQueryJson;
import model.ProcJson;
import model.ProcQueryJson;
import engine.FreeMarkerEngine;

public class Build {
	static String TEMP_PATH = "E:/projs/ProcCodeBuilder/bin/template";
	
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
		
//		PageQueryJson model = new PageQueryJson();
//		model.setProcName("demo_query");
//		model.setDevUserName("jun");
//		model.setDevDate("20150907");
//		model.setProcMsg("demo_查询");
//		model.putFormParamsObj("tcRowid", "number(18)");
//		model.putFormParamsObj("tcCode", "varchar2(60)");
//		model.putFormParamsObj("tcName", "varchar2(100)");
//		FreeMarkerEngine.buildPageQueryJson(model,TEMP_PATH);
		
		ProcJson model = new ProcJson();
		model.setProcName("demo_del");
		model.setDevUserName("jun");
		model.setDevDate("20150907");
		model.setProcMsg("demo_删除");
		model.putFormParamsArrayObj("rowid", "array_varchar2_50");
		FreeMarkerEngine.buildProcJson(model,TEMP_PATH);
		
//		ProcQueryJson model = new ProcQueryJson();
//		model.setProcName("demo_query");
//		model.setDevUserName("jun");
//		model.setDevDate("20150901");
//		model.setProcMsg("demo演示");
//		model.putFormParamsObj("tcRowid", "number(18)");
//		model.putFormParamsObj("tcCode", "varchar2(100)");
//		FreeMarkerEngine.buildProcQueryJson(model,TEMP_PATH);
		
	}
}
