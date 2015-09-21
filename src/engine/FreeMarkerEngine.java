package engine;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import model.js.JsObject;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreeMarkerEngine {
	/**
	 * 解析存储过程模版
	 * @param templateName
	 *            模板文件名称
	 * @param templateEncoding
	 *            模板文件的编码方式
	 * @param templatePath
	 *            模板文件的路径
	 * @param root
	 *            数据模型根对象
	 */
	@SuppressWarnings("deprecation")
	public static void analysisTemplate(String templateName, String templateEncoding, String templatePath, Map<?, ?> root) {
		try {
			/**
			 * 创建Configuration对象
			 */
			Configuration config = new Configuration();
			/**
			 * 指定模板路径
			 */
			File file = new File(templatePath);
			/**
			 * 设置要解析的模板所在的目录，并加载模板文件
			 */
			config.setDirectoryForTemplateLoading(file);
			/**
			 * 设置包装器，并将对象包装为数据模型
			 */
			config.setObjectWrapper(new DefaultObjectWrapper());
	
			/**
			 * 获取模板,并设置编码方式，这个编码必须要与页面中的编码格式一致
			 */
			Template template = config.getTemplate(templateName, templateEncoding);
			/**
			 * 合并数据模型与模板
			 */
			Writer out = new OutputStreamWriter(System.out);
			template.process(root, out);
			out.flush();
//			out.close();//注释掉后方可同时生成多个模版代码
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 解析js模版
	 * @param moduleName
	 * 			     模块名称
	 * @param fileName
	 *            文件名称
	 * @param suffix
	 *            文件后缀
	 * @param templateName
	 *            模板文件名称
	 * @param templateEncoding
	 *            模板文件的编码方式
	 * @param templatePath
	 *            模板文件的路径
	 * @param root
	 *            数据模型根对象
	 */
	@SuppressWarnings("deprecation")
	public static void analysisTemplateJs(String moduleName, String fileName, String suffix, String templateName, String templateEncoding, String templatePath, Map<?, ?> root) {
		try {
			/**
			 * 创建Configuration对象
			 */
			Configuration config = new Configuration();
			/**
			 * 指定模板路径
			 */
			File file = new File(templatePath);
			/**
			 * 设置要解析的模板所在的目录，并加载模板文件
			 */
			config.setDirectoryForTemplateLoading(file);
			/**
			 * 设置包装器，并将对象包装为数据模型
			 */
			config.setObjectWrapper(new DefaultObjectWrapper());
			/**
			 * 获取模板,并设置编码方式，这个编码必须要与页面中的编码格式一致
			 */
			Template template = config.getTemplate(templateName, templateEncoding);
			/**
			 * 创建js代码存放目录
			 */
			//创建模块目录
			String dirPath = "C:" + File.separator + "CodeTemp" + File.separator + moduleName.toLowerCase();
			//创建模块js目录
			if (suffix.equals("js")) dirPath = dirPath + File.separator + "js";
			createDirs(dirPath);
			//
			File f = new File(dirPath + File.separator + fileName + "." + suffix);

			/**
			 * 合并数据模型与模板
			 */
			Writer out=new FileWriter(f);//覆盖
//			Writer out=new FileWriter(f,true);//追加
			template.process(root, out);
			out.flush();
//			out.close();//注释掉后方可同时生成多个模版代码
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 创建层级文件目录
	 * @param dirPath 目录路径
	 */
	private static void createDirs(String dirPath) {
		File dir =new File(dirPath);
		if (!dir.exists() && !dir.isDirectory()) dir.mkdirs();  
	}
	
	//-----------------------------------------DEMO-------------------------------------------------------//
	public static void buildDemo(Object model, String tempPath) {
	    Map<String, Object> root = new HashMap<String, Object>();
	    root.put("model", model);
	    FreeMarkerEngine.analysisTemplate("demo.ftl","utf-8",tempPath,root);
	}
	
	//-----------------------------------------存储过程-------------------------------------------------------//
	public static void buildPageQueryJson(Object model, String tempPath) {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("model", model);
		FreeMarkerEngine.analysisTemplate("p_pageQueryJson_bro.ftl","utf-8",tempPath,root);
		FreeMarkerEngine.analysisTemplate("p_pageQueryJson_act.ftl","utf-8",tempPath,root);
	}
	
	public static void buildProcJson(Object model, String tempPath) {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("model", model);
		FreeMarkerEngine.analysisTemplate("p_procJson_bro.ftl","utf-8",tempPath,root);
		FreeMarkerEngine.analysisTemplate("p_procJson_bo.ftl","utf-8",tempPath,root);
		FreeMarkerEngine.analysisTemplate("p_procJson_act.ftl","utf-8",tempPath,root);
	}
	
	public static void buildProcQueryJson(Object model, String tempPath) {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("model", model);
		FreeMarkerEngine.analysisTemplate("p_procQueryJson_bro.ftl","utf-8",tempPath,root);
		FreeMarkerEngine.analysisTemplate("p_procQueryJson_act.ftl","utf-8",tempPath,root);
	}
	
	public static void buildExportFile(Object model, String tempPath) {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("model", model);
		FreeMarkerEngine.analysisTemplate("p_exportFile_act.ftl","utf-8",tempPath,root);
	}
	
	public static void buildProcUpFile(Object model, String tempPath) {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("model", model);
		FreeMarkerEngine.analysisTemplate("p_procUpFile_ins_bro.ftl","utf-8",tempPath,root);
		FreeMarkerEngine.analysisTemplate("p_procUpFile_chk_bro.ftl","utf-8",tempPath,root);
		FreeMarkerEngine.analysisTemplate("p_procUpFile_act.ftl","utf-8",tempPath,root);
	}

	//-----------------------------------------js界面-------------------------------------------------------//
	public static void buildCodeJs(JsObject model, String tempPath) {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("model", model);
		//js
		FreeMarkerEngine.analysisTemplateJs(model.getModuleName(), "Epo.Erp."+model.getModuleName()+".ButtonAble", "js", "ButtonAble_js.ftl", "utf-8", tempPath, root);
		FreeMarkerEngine.analysisTemplateJs(model.getModuleName(), "Epo.Erp."+model.getModuleName()+".Function.Comm", "js", "Function_Comm_js.ftl", "utf-8", tempPath, root);
		FreeMarkerEngine.analysisTemplateJs(model.getModuleName(), "Epo.Erp."+model.getModuleName()+".Function.Handler", "js", "Function_Handler_js.ftl", "utf-8", tempPath, root);
		FreeMarkerEngine.analysisTemplateJs(model.getModuleName(), "Epo.Erp."+model.getModuleName()+".Function.Listeners", "js", "Function_Listeners_js.ftl", "utf-8", tempPath, root);
		FreeMarkerEngine.analysisTemplateJs(model.getModuleName(), "Epo.Erp."+model.getModuleName()+".URL", "js", "URL_js.ftl", "utf-8", tempPath, root);
		FreeMarkerEngine.analysisTemplateJs(model.getModuleName(), "Epo.Erp."+model.getModuleName()+".Init", "js", "Init_js.ftl", "utf-8", tempPath, root);
		FreeMarkerEngine.analysisTemplateJs(model.getModuleName(), "Epo.Erp."+model.getModuleName()+".View.Bottom", "js", "View_Bottom_js.ftl", "utf-8", tempPath, root);
		FreeMarkerEngine.analysisTemplateJs(model.getModuleName(), "Epo.Erp."+model.getModuleName()+".View.Center.Grid", "js", "View_Center_Grid_js.ftl", "utf-8", tempPath, root);
		FreeMarkerEngine.analysisTemplateJs(model.getModuleName(), "Epo.Erp."+model.getModuleName()+".View.Center", "js", "View_Center_js.ftl", "utf-8", tempPath, root);
		FreeMarkerEngine.analysisTemplateJs(model.getModuleName(), "Epo.Erp."+model.getModuleName()+".View.Top.Form", "js", "View_Top_Form_js.ftl", "utf-8", tempPath, root);
		FreeMarkerEngine.analysisTemplateJs(model.getModuleName(), "Epo.Erp."+model.getModuleName()+".View.Top.Toolbar", "js", "View_Top_Toolbar_js.ftl", "utf-8", tempPath, root);
		FreeMarkerEngine.analysisTemplateJs(model.getModuleName(), "Epo.Erp."+model.getModuleName()+".View.Top", "js", "View_Top_js.ftl", "utf-8", tempPath, root);
		FreeMarkerEngine.analysisTemplateJs(model.getModuleName(), "Epo.Erp."+model.getModuleName()+".Viewport", "js", "Viewport_js.ftl", "utf-8", tempPath, root);
//		//jsp
		FreeMarkerEngine.analysisTemplateJs(model.getModuleName(), "init", "jsp", "init_jsp.ftl", "utf-8", tempPath, root);
	}
}
