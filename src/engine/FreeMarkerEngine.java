package engine;

import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreeMarkerEngine
{
	/**
	 * 
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
	public static void analysisTemplate(String templateName, String templateEncoding, String templatePath, Map<?, ?> root) 
	{
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
	
	public static void buildDemo(Object model, String tempPath){
	    Map<String, Object> root = new HashMap<String, Object>();
	    root.put("model", model);
	    FreeMarkerEngine.analysisTemplate("demo.ftl","utf-8",tempPath,root);
	}
	
	public static void buildPageQueryJson(Object model, String tempPath){
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("model", model);
		FreeMarkerEngine.analysisTemplate("p_pageQueryJson_bro.ftl","utf-8",tempPath,root);
		FreeMarkerEngine.analysisTemplate("p_pageQueryJson_act.ftl","utf-8",tempPath,root);
	}
	
	public static void buildProcJson(Object model, String tempPath){
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("model", model);
		FreeMarkerEngine.analysisTemplate("p_procJson_bro.ftl","utf-8",tempPath,root);
		FreeMarkerEngine.analysisTemplate("p_procJson_bo.ftl","utf-8",tempPath,root);
		FreeMarkerEngine.analysisTemplate("p_procJson_act.ftl","utf-8",tempPath,root);
	}
	
	public static void buildProcQueryJson(Object model, String tempPath){
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("model", model);
		FreeMarkerEngine.analysisTemplate("p_procQueryJson_bro.ftl","utf-8",tempPath,root);
		FreeMarkerEngine.analysisTemplate("p_procQueryJson_act.ftl","utf-8",tempPath,root);
	}
	
	public static void buildExportFile(Object model, String tempPath){
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("model", model);
		FreeMarkerEngine.analysisTemplate("p_exportFile_act.ftl","utf-8",tempPath,root);
	}
}
