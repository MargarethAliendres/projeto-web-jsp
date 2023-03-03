<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="classes.Pessoa"%>
<%@page import="persistencia.PessoaDao"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <link rel="stylesheet" href="bootstrap3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"> </script>
           <script src="https://kit.fontawesome.com/f49d415fdb.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
    </head>
    <body>
        <div class="container">
            <form id="pessoa" action="ReceberDadosPessoa.jsp" method="POST">     <!-- recebe a entrada de dados no formulario-->
                <h3 class="text-center"> Cadastro de Pessoas</h3> 
                <p></p>
                <label id="msg" class="cabecalho">
                  <% 
                      String msgSucesso = request.getParameter("msgSucesso"); //escreve a mensagem configurado no receber dadoa no cadastro
                      String msgFalha = request.getParameter("msgFalha"); //escreve a mensagem configurado no receber dadoa no cadastro
                   %>
                    <span style="color: blue"><%=(msgSucesso != null? msgSucesso: "")%> <br /></span>
                    <span style="color: red"><%=(msgFalha != null? msgFalha: "")%> <br /></span>
                </label>
                    <!-- NOME-->
                    <fieldset>
                       <label> Nome </label>
                         <div class="nome">
                       <input type="text" id=nome name="nome" placehoder="informe o nome" required maxlength="40">
                       </div>
                    </fieldset>
                    
                    <fieldset >
                          <label> Email </label>
                        <div class="email">
                            <input type="email" id=email name="email" placehoder="informe o email" required maxlength="50">
                        </div>
                    </fieldset> <br>
                    
                    <div>            <!-- tamanho da mesclagem do botao-->
                        <div class="form-group col-md-3 h-10">                    
                            <input type="submit" value="Cadastrar" class="btn btn-primary" onclick="EnviarForm()" />  <!--botao de eNviar cadastro-->
                        </div> 
                                      <!--tamanho da mesclagem do botao-->
                        <div class="form-group col-md-3 h-10">              
                            <input type="reset" value="Cancelar" class="btn btn-danger" />    <!-- botao de CANCELAR-->
                        </div> 
                    </div>
            </form>    
        </div>  
        
    </body>
</html>
