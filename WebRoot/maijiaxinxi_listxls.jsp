<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=maijiaxinxi.xls");
%>
<html>
  <head>
    <title>�����Ϣ</title>
  </head>

  <body >

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1">  
  <tr>
    <td width="30" align="center">���</td>
    <td align='center'>����˺�</td>    <td align='center'>����</td>    <td align='center'>ͷ��</td>    <td align='center'>�������</td>    <td align='center'>�Ա�</td>    <td align='center'>��ҵ绰</td>    <td align='center'>�ջ���ַ</td>    
	
    <td width="120" align="center" >���ʱ��</td>
    
  </tr>
   <%
    int i=0;
   String sql="select * from maijiaxinxi  order by id desc";
ResultSet RS_result=connDbBean.executeQuery(sql);
			while(RS_result.next())
			{
				i++;
			%>
  <tr>
    <td  align="center"><%=i %></td>
    <td><%=RS_result.getString("maijiazhanghao")%></td>    <td><%=RS_result.getString("mima")%></td>    <td><%=RS_result.getString("touxiang")%></td>    <td><%=RS_result.getString("maijiaxingming")%></td>    <td><%=RS_result.getString("xingbie")%></td>    <td><%=RS_result.getString("maijiadianhua")%></td>    <td><%=RS_result.getString("shouhuodizhi")%></td>    
	
	<td><%=RS_result.getString("addtime")%></td>
   
  </tr>
  	<%
  }
   %>
   
</table>
<br>
  </body>
</html>

