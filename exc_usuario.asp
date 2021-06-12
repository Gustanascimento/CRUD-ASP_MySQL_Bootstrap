<% @ LANGUAGE="VBSCRIPT" %>
<!--#include file="includes/conexao.asp" -->

<%
id = Request.QueryString("id")

if trim(id) = "" or isnull(id) or trim(id) = "0" then
		Response.write "<script>('ID incorreto. ERRID_NULL'); document.location='index.asp';</script>" 
        Response.End
	end if

    strSQL = "delete from users where id = " & id

    conDB.execute(strSQL)

    Response.Redirect("index.asp?strStatus=DEL")
    Response.End

%>