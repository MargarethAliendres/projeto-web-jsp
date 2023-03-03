<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="classes.Pessoa"%>
<%@page import="persistencia.PessoaDao"%>


<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <script src="jQuery-1.11.2/"> </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"> </script>
        <script src="bootstrap3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/fontawesome.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/fontawesome.min.css">
        <link rel="stylesheet" href="bootstrap3.3.7/css/bootstrap.min.css">
        
    </head>
    
    <body>
        <%
           int idpessoa = Integer.parseInt(request.getParameter("idpessoa"));
           Pessoa pess = new PessoaDao().consultarPessoa(idpessoa);
                   
            
        %>
        <div>
            <div class="container" >
                <form id="pessoa" action="ReceberEditarPessoa.jsp" method="POST">
                    
                    <h3> Alterar Pessoa</h3>
                    <p></p>
                    
                    <fieldset>
                        <div class ="idpessoa">
                            <label> Pessoa </label>
                            <input type="text" name="idpessoa"  readonly="true"  value="<%out.write("" + pess.getIdPessoa());%>"/>
                       </div>
                    </fieldset>
                    
                    
                    <fieldset>
                        <div class ="nome">
                            <label> Nome </label>
                            <input type="text" name="nome" required maxlength ="40" value="<%out.write(String.valueOf(pess.getNome()));%>" style="text-center"/> 
                       </div>
                    </fieldset>
                    
                    <fieldset>
                        <div class="email">
                            <label>email <label>
                            <input type="email"  name="email"  required maxlength =" 50" value="<%out.write(String.valueOf(pess.getEmail()));%>" />
                        </div>
                    </fieldset> 
                        <div class="row" >
                            <div class="form-group col-md-3 h-10 " >
                                <input type="submit" value="Alterar" class="btn btn-primary">  <!-- botao alterar-->
                            </div 
                            <div class ="form-group col-md-3 h-10 " >
                                <input type="reset" value="Cancelar" class="btn btn-danger">   <!-- botao cancelar-->
                            <div>
                      </div>
                    </div>
                </form>   
           </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"> </script>
        <script src="bootstrap3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
