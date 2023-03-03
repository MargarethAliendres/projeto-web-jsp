<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.Pessoa"%>
<%@page import="persistencia.PessoaDao"%>


<%
    //receber os valores da tela HTML//int
    //aqui que captura os dados cadastrados/informados na tela.
 
int vidpessoa = Integer.parseInt(request.getParameter("idpessoa"));
String vnomepessoa = request.getParameter("nome");
String vemail= request.getParameter("email");    


          Pessoa pessoa = new Pessoa();
          
          PessoaDao pesDAO = new PessoaDao();
          pessoa.setIdPessoa(vidpessoa);
          pessoa.setNome(vnomepessoa);
          pessoa.setEmail(vemail);
          
          
            if (pesDAO.alterarPessoa(pessoa)) {        
             response.sendRedirect( "ConsultarPessoa.jsp?pmensagem=Pessoa alterada com sucesso com sucesso");
            } else {
             response.sendRedirect( "ConsultarPessoa.jsp?pmensagem=Problemas ao salvar Pessoa");
        
                  }
  
%>