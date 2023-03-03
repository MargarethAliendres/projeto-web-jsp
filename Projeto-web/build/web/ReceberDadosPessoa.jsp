<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="persistencia.PessoaDao"%>
<%@page import="classes.Pessoa"%>p



<%
    //receber os valores da tela HTML/
    //aqui que captura os dados cadastrados/informados na tela.
    
String vnomepessoa = request.getParameter("nome");
String vemail = request.getParameter("email");

        

           Pessoa pessoa = new Pessoa();
          
          PessoaDao pesDAO = new PessoaDao();
          
          pessoa.setNome(vnomepessoa);
          pessoa.setEmail(vemail);
          
                    
            if (pesDAO.incluirPessoa(pessoa)) {             // quando ele terminar a inclusao ele volra para o cadastar pessoa
             response.sendRedirect("CadastrarPessoa.jsp?msgSucesso=Pessoa cadastrada com sucesso!");
            } else {
             response.sendRedirect("CadastrarPessoa.jsp?msgFalha=Falha ao tentar Incluir a 'Pessoa'!");
    }
   
  
      
   
%>
