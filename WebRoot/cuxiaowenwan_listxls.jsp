<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=cuxiaowenwan.xls");
%>
<html>
  <head>
    <title>��������</title>
  </head>

  <body >

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1">  
  <tr>
    <td width="30" align="center">���</td>
    <td align='center'>������</td>    <td align='center'>��������</td>    <td align='center'>�������</td>    <td align='center'>����ͼƬ</td>    <td align='center'>���</td>    <td align='center'>ԭ�۸�</td>    <td align='center'>�����ۿ�</td>    <td align='center'>�����۸�</td>    <td align='center'>������</td>    
	
    <td width="120" align="center" >���ʱ��</td>
    
  </tr>
   <%
    int i=0;
   String sql="select * from cuxiaowenwan  order by id desc";
ResultSet RS_result=connDbBean.executeQuery(sql);
			while(RS_result.next())
			{
				i++;
			%>
  <tr>
    <td  align="center"><%=i %></td>
    <td><%=RS_result.getString("wenwanbianhao")%></td>    <td><%=RS_result.getString("wenwanmingcheng")%></td>    <td><%=RS_result.getString("wenwanleibie")%></td>    <td><%=RS_result.getString("wenwantupian")%></td>    <td><%=RS_result.getString("kucun")%></td>    <td><%=RS_result.getString("yuanjiage")%></td>    <td><%=RS_result.getString("cuxiaozhekou")%></td>    <td><%=RS_result.getString("cuxiaojiage")%></td>    <td><%=RS_result.getString("wenwanjianjie")%></td>    
	
	<td><%=RS_result.getString("addtime")%></td>
   
  </tr>
  	<%
  }
   %>
   
</table>
<br>
  </body>
</html>

