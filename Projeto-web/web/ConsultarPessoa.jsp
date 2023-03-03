<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="classes.Pessoa"%>
<%@page import="persistencia.PessoaDao"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
         
         <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
        
       
           <script src="https://kit.fontawesome.com/f49d415fdb.js" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        

<script src="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">></script>

    </head>  
  
    <body>
         <!--diferente do cadastrar, aqui tenho que instanciar a classe pessoaDao-->
        <%
           
            PessoaDao pes = new PessoaDao();
            List<Pessoa> listapessoas = pes.consultarPessoas();   //pego a lista de pessoas 
                       
        %>    
       
                <h4 class="text-center"> Consulta pessoas</h4> 
               
                <!--label para lançcar mensagens de feedback de atualiazação -->
                <label id="msg" class="cabecalho">
                  <% 
                    if(request.getParameter("pmensagem") !=null) {     //escreve a mensagem configurado no receber dadoa no cadastro
                        out.write(request.getParameter("pmensagem"));
                    } %>
                </label>
                     <table id="consulta" class="table">
                       <thead class="thead-dark">         <!-- cabeçalho da tabela-->
                            <th>Nome</th>
                            <th>email</th>
                            <th>Editar</th>
                            <th>Excluir</th>
                       </thead>
                       <tbody>           
                               <!--for echc    aqui  fazendo um for each-->  <!-- muito importante essa abertura de chave -->     
                         <%
                            for(Pessoa pessoa : listapessoas) {
                         %>     <!--conteudo que vai esta dentro da tabela abaixo-->
                         <tr>  <!-- linha-->
                             <td><% out.write(pessoa.getNome()); %></td>    <!-- coluna-->
                             <td><% out.write(pessoa.getEmail()); %></td>
                             
                             
                               <!-- botao editar-->
                             <td> <% out.write("<a href=EditarPessoa.jsp?idpessoa=" + "" + pessoa.getIdPessoa()+ ">" + "<i class='fa-solid fa-file-pen' style='color:green'></i>" + "</a>");%></td> 
                             
                             
                             <td>     <!--botao excluir-->
                                 <button type="button" id="botaoexcluir" onclick="mostrarExclusao(<%out.write("" + pessoa.getIdPessoa());%>)"> <i class='fa-solid fa-trash' style='color:red'></i></button> 
                             </td>             
                         </tr>
                        <%}%>        <!-- muito importante esse fechamento de chaves do java-->         
                        </tbody>       
                       </table>
                     <!-- popup de confirmacao e exclusao-->
                    <div class="msg-popup2">
                        <h5 class="text-center" style="color: #ffffff; font-family: arial-bold"> EXCLUSAO </h5>
                        <h5 class="text-center" style="color: #ffffff;"> Confirma a <b>exclusão</b> do registro? </h5>
                        <div class="text-center">
                        <a href=""> <button class="btn btn-dark" onclick="cancela()"> Nâo </button></a>  <!--funcao cancela-->
                        <a id="exclui" href="#"><button class="btn btn-danger" id="excluir"> Sim </button></a>
                      </div> 
                    </div>
                     <script>
                         
                        function cancela(){
                         document.getElementsByClassName("msg-popup2")[0].style.display='none';
                        }
                      function mostrarExclusao(pessoa) {
                         document.getElementsByClassName("msg-popup2")[0].style.display='block';
                            var link = document.getElementById('exclui');
                            link.href = "ReceberExcluirPessoa.jsp?idpessoa=" + pessoa;
                        }
                     </script>    

         </body>  
         <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </html>