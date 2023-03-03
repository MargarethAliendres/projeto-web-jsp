<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.Pessoa"%>
<%@page import="persistencia.PessoaDao"%>
<%
    int idPessoa = Integer.parseInt(request.getParameter("idpessoa"));
    
    Pessoa pess =  new Pessoa();
    
    PessoaDao pess2 = new PessoaDao();
    
    pess.setIdPessoa(idPessoa);
    
             if (pess2.excluirPessoa(pess.getIdPessoa())){
                  response.sendRedirect("ConsultarPessoa.jsp?pmensagem=Pessoa excluida com sucesso");
           } else {
                 response.sendRedirect("ConsultarPessoa.jsp?pmensagem=Problemas excluir Pessoa");
    }
  
   
%>

