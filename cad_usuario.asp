<% @ LANGUAGE="VBSCRIPT" %>
<!--#include file="includes/conexao.asp" -->

<%
    id = replace(Request.Form("id"),"'","")
    name = replace(Request.Form("name"),"'","")
    email = replace(Request.Form("email"),"'","")
    city = replace(Request.Form("city"),"'","")
    country = replace(Request.Form("country"),"'","")

    curr_time = FormatDateTime(Now())
    
    if trim(id) = "" or isnull(id) or trim(id) = "0" then
		id = 0
	end if

    if cint(id) <> 0 then
        strSQL = "update users set name = '"&name&"', email = '"&email&"', created_at = '"&curr_time&"', city = '"&city&"', country = '"&country&"' where id = " & id
        conDB.execute(strSQL)

        Response.Redirect("index.asp?strStatus=ALT")
        Response.End

    else
        strSQL = "insert into users (name, email, created_at, city, country) values ('"&name&"','"&email&"','"&curr_time&"','"&city&"','"&country&"');"

        conDB.execute(strSQL)

        Response.Redirect("index.asp?strStatus=INC")
        Response.End
    end if
%>