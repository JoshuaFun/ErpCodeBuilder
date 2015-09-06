#遍历demo基本属性
${model.name}

#遍历demo对象中的map
<#list model.params?keys as key>
${key} : ${(model.params[key])}
</#list>

#遍历demo对象中的list
<#list model.list as item>
${item}
</#list>