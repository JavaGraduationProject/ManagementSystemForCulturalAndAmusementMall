<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>��Ʒ�����ѯ</TITLE>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
	<link rel="stylesheet" href="images/bootstrap.min.css" type="text/css">
	</head>
	<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td>
					<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
						<tr align="left" bgcolor="#F2FDFF">
							<td colspan="17" background="images/table_header.gif">��Ʒ�����б�</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr valign="top">
			  <td bgcolor="#FFFFFF">
			  <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
						
					<tr align="right" bgcolor="#ebf0f7">
					  <td colspan="21">
					  <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" >
						<tr align="left" >
							<td colspan="17">
								<form action="" name="myform" method="post">
									��ѯ   �������ƣ�<input name="wenwanmingcheng" type="text" id="wenwanmingcheng" class="form-control2" /> �������<select name='wenwanleibie' id='wenwanleibie' class="form-control2"><option value="">����</option><%=connDbBean.hsggetoption("leibie","wenwanleibie")%></select>  ����۸�<input name="wenwanjiage" type="text" id="wenwanjiage" class="form-control2" />
									<input type="submit" value="��ѯ" class="btn btn-info btn-small" />
								</form>								</td>
						</tr></table>
					  </td>
			    </tr>
					
						<tr align="center">
						<td style="padding-left:0px; padding-right:0px;"><table width="100%" border="1" align="center" cellpadding="4" cellspacing="1" bordercolor="#F3F3F3" bgcolor="#ebf0f7" class="table table-striped table-bordered table-hover">
                          <tr>
                            <td width="30px" height="50" align="center" bgcolor="#ebf0f7">���</td>
                            <td align='center' bgcolor='#ebf0f7'>������</td>    <td align='center' bgcolor='#ebf0f7'>��������</td>    <td align='center' bgcolor='#ebf0f7'>�������</td>    <td  width='90' align='center' bgcolor='#ebf0f7'>����ͼƬ</td>    <td align='center' bgcolor='#ebf0f7'>���</td>    <td align='center' bgcolor='#ebf0f7'>����۸�</td>        
                            <td width="150px" height="50" align="center" bgcolor="#ebf0f7"> ���ʱ�� </td>
                            <td width="150px" height="50" align="center" bgcolor="#ebf0f7"> ���� </td>
                          </tr>
                          <%
    int i=0;
   String sql="select * from xinpinwenwan where 1=1";
   if(request.getParameter("wenwanmingcheng")=="" ||request.getParameter("wenwanmingcheng")==null ){}else{String nwenwanmingcheng=new String(request.getParameter("wenwanmingcheng").getBytes("8859_1"));if(nwenwanmingcheng.contains("?")){nwenwanmingcheng=request.getParameter("wenwanmingcheng");}sql=sql+" and wenwanmingcheng like '%"+nwenwanmingcheng+"%'";}if(request.getParameter("wenwanleibie")=="" ||request.getParameter("wenwanleibie")==null ){}else{sql=sql+" and wenwanleibie like '%"+request.getParameter("wenwanleibie")+"%'";}if(request.getParameter("wenwanjiage")=="" ||request.getParameter("wenwanjiage")==null ){}else{String nwenwanjiage=new String(request.getParameter("wenwanjiage").getBytes("8859_1"));if(nwenwanjiage.contains("?")){nwenwanjiage=request.getParameter("wenwanjiage");}sql=sql+" and wenwanjiage like '%"+nwenwanjiage+"%'";}
   sql=sql+" order by id desc";
ResultSet RS_result=connDbBean.executeQuery(sql);
			while(RS_result.next())
			{
				i++;
			%>
                            <tr align="center">
                              <td height="50" align="center"><%=i%></td>
                             <td><%=RS_result.getString("wenwanbianhao")%></td>    <td><%=RS_result.getString("wenwanmingcheng")%></td>    <td><%=RS_result.getString("wenwanleibie")%></td>    <td width='90' align='center' bgcolor='#ebf0f7'><a href='<%=RS_result.getString("wenwantupian")%>' target='_blank'><img src='<%=RS_result.getString("wenwantupian")%>' width=88 height=99 border=0 /></a></td>    <td><%=RS_result.getString("kucun")%></td>    <td><%=RS_result.getString("wenwanjiage")%></td>    
                              <td height="50" align="center"><%=RS_result.getString("addtime")%> </td>
                              <td height="50" align="center"> <!--lianjie1--> <a class="btn btn-info btn-small" href="xpwwDetail.do?id=<%=RS_result.getString("id")%>" target="_blank">��ϸ</a></td>
                            </tr>
                        	<%
  }
   %>
                        </table></td>
						</tr>
					</table>
					
					
			  </td>
	  </tr>
		</table>
			
	</body>
</html>
