<% @ LANGUAGE="VBSCRIPT" %>
<!--#include file="includes/conexao.asp" -->

<%
	id = Request.QueryString("id")

	if trim(id) = "" or isnull(id) then
		id = 0
	end if

	if not isnumeric(id) then
		Response.Write "ID Invalido"
		Response.end
	end if

	if cint(id) <> 0 then
		strSQL = "select * from users where id = " & id
		set ObjRst = conDB.execute(strSQL)

		if not ObjRst.EOF then
			id = ObjRst("id")
			name = ObjRst("name")
			email = ObjRst("email")
			city = ObjRst("city")
			country = ObjRst("country")
		end if

		set ObjRst = Nothing

	end if
%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>Tutorial CRUD ASP Clássico</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
    	body {
		  padding-top: 50px;
		}
		.starter-template {
		  padding: 40px 15px;
		  text-align: center;
		}
    </style>
  </head>
  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.asp">CRUD ASP</a>
        </div>
      </div>
    </nav>

    <div class="container">

    	<div class="starter">
    		<div class="row">
    			<div class="col-sm-6">
		    	    <h1>Formulário Usuário</h1>
			        <div class="modal-body">
		    			<form role="form" id="db-form" name="db-form" method="post" action="cad_usuario.asp">
		    				<div class="form-group-attached">
		    					<div class="row">
	    							<div class="form-group">
	    								<label>Nome</label>
	    								<input type="text" name="name" id="name" class="form-control" placeholder="Informe o nome" value="<%=name%>" required>
	    							</div>
		    						
		    					</div>			
		    					<div class="row">
	    							<div class="form-group">
	    								<label>Email</label>
	    								<input type="email" name="email" id="email" class="form-control" placeholder="Informe o e-mail" value="<%=email%>" required>
	    							</div>
		    						
		    					</div>
								<div class="row">
	    							<div class="form-group">
	    								<label>city</label>
	    								<input type="text" name="city" id="city" class="form-control" placeholder="Informe a cidade" value="<%=city%>" required>
	    							</div>
		    						
		    					</div>
								<div class="row">
	    							<div class="form-group">
	    								<label>País</label>
	    								<input type="text" name="country" id="country" class="form-control" placeholder="Informe o país" value="<%=country%>" required>
	    							</div>
		    						
		    					</div>

		    				</div>
		    				<div class="row">
		    					<div class="form-group">
									<input type="hidden" id ="id" name ="id" value = "<%=id%>">
		    						<button type="submit" class="btn btn-primary">Salvar</button>
		    						<a href="index.asp" class="btn btn-info">Voltar</a>
		    					</div>
		    				</div>
		    			</form>	    
		    		</div>
		    	</div>
		    </div>
    	</div>	  
    </div><!-- /.container -->

    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</html>