﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<TITLE>新品购物车查询</TITLE>
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
							<td height="30" colspan="17" background="images/table_header.gif">新品购物车列表</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr valign="top">
			  <td bgcolor="#FFFFFF">
			  <table width="100%" border="1" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
						
					<tr align="right" bgcolor="#ebf0f7">
					  <td colspan="21">
					  <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" >
						<tr align="left" >
							<td colspan="17">
								<form action="xinpingouwucheList.do" name="myform" method="post">
									查询   文玩编号：<input name="wenwanbianhao" type="text" id="wenwanbianhao" class="form-control2" />  文玩名称：<input name="wenwanmingcheng" type="text" id="wenwanmingcheng" class="form-control2" />  文玩类别：<input name="wenwanleibie" type="text" id="wenwanleibie" class="form-control2" />
									<input type="submit" value="查询" class="btn btn-info btn-small" /> <input type="button" value="导出excel" onClick="javascript:location.href='xinpingouwuche_listxls.jsp';" class="btn btn-info btn-small" />
								</form>								</td>
						</tr></table>
					  </td>
			    </tr>
					
						<tr align="center">
						<td style="padding-left:0px; padding-right:0px;"><table width="100%" border="1" align="center" cellpadding="4" cellspacing="1" bordercolor="#F3F3F3" bgcolor="#ebf0f7" class="table table-striped table-bordered table-hover">
                          <tr>
                            <td align="center" bgcolor="#ebf0f7" width="30px" height="50">序号</td>
                            <td align='center' bgcolor='#ebf0f7'>文玩编号</td>    <td align='center' bgcolor='#ebf0f7'>文玩名称</td>    <td align='center' bgcolor='#ebf0f7'>文玩类别</td>    <td align='center' bgcolor='#ebf0f7'>文玩价格</td>    <td align='center' bgcolor='#ebf0f7'>购买数量</td>    <td align='center' bgcolor='#ebf0f7'>应付金额</td>    <td align='center' bgcolor='#ebf0f7'>买家账号</td>    <td align='center' bgcolor='#ebf0f7'>买家姓名</td>    <td align='center' bgcolor='#ebf0f7'>买家电话</td>    <td align='center' bgcolor='#ebf0f7'>收货地址</td>    <td  width='80' align='center' bgcolor='#ebf0f7'>是否支付</td>    <td  width='80' align='center' bgcolor='#ebf0f7'>是否发货</td>
                            <td width="150px" height="50" align="center" bgcolor="#ebf0f7"> 添加时间 </td>
                            <td width="150px" height="50" align="center" bgcolor="#ebf0f7"> 操作 </td>
                          </tr>
                          <%
					int i=0;
				%>
                          <c:forEach items="${list }" var="u">
                            <%
					i++;
				%>
                            <tr align="center">
                              <td height="50" align="center"><%=i%></td>
                             <td>${u.wenwanbianhao}</td>    <td>${u.wenwanmingcheng}</td>    <td>${u.wenwanleibie}</td>    <td>${u.wenwanjiage}</td>    <td>${u.goumaishuliang}</td>    <td>${u.yingfujine}</td>    <td>${u.maijiazhanghao}</td>    <td>${u.maijiaxingming}</td>    <td>${u.maijiadianhua}</td>    <td>${u.shouhuodizhi}</td>    <td align='center' bgcolor='#ebf0f7'>${u.iszf} </td>    <td align='center'>${u.issh} <input type="button" value="审核" onclick="javascript:location.href='sh.jsp?id=${u.id}&yuan=${u.issh}&tablename=xinpingouwuche'"/></td>
                              <td height="50" align="center" > ${u.addtime } </td>
                              <td height="50" align="center"><a class="btn btn-info btn-small" href="doUpdateXinpingouwuche.do?id=${u.id }">编辑</a>  <a class="btn btn-info btn-small" href="deleteXinpingouwuche.do?id=${u.id }"
										onclick="{if(confirm('确定要删除吗?')){return true;}return false;}">删除</a> <a class="btn btn-info btn-small" href="xpgwcDetail.do?id=${u.id}" target="_blank">详细</a></td>
                            </tr>
                          </c:forEach>
                        </table></td>
						</tr>
					</table>
					
					
			  </td>
	  </tr>
		</table>
		
		
		
			<p align="center" class="fy"> <c:if test="${sessionScope.p==1 }">
		 <c:if test="${page.page>1}">
              <a href="xinpingouwucheList.do?page=1" >首页</a>
             <a href="xinpingouwucheList.do?page=${page.page-1 }"> 上一页</a>             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="xinpingouwucheList.do?page=${page.page+1 }">下一页</a>
			<a href="xinpingouwucheList.do?page=${page.totalPage }">末页</a>		    </c:if>		
	</c:if>
	</p>
			
			
			
			
			
	</body>
</html>
