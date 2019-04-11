<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.ufpr.tads.tcc.beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>Criar conta</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/clientesAlterar.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="js/jquery.mask.js" type="text/javascript"></script>
        <script src="js/clientesForm.js" type="text/javascript"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="maskedinput-1.3.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
                 <c:if test="${(param.form == \"erro\")}" >
                    <div class="row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-4 alert alert-danger" role="alert">
                            <p>E-mail ou CPF não conferem</p>
                        </div>
                    </div>
                </c:if>
            <h1><c:out value="${( param.form == \"enviado\") ? \"E-mail enviado!\" : \"Recuperar senha\"}"/></h1>

            <div><c:out value="${( param.form == \"enviado\") ? \"Uma nova senha foi enviada para o seu e-mail, por favor aguarde um periodo de 3 minutos e caso não encontre o email por favor cheque a sua caixa de spam!\" : \"Um e-mail com a senha será enviado para o email cadastrado\"}"/></div>
            <c:if test="${(param.form == \"recuperar\" || param.form == \"erro\")}" >
                <form action="RecuperarSenhaServlet?action=recuperar" method="POST">
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label>Email da conta:</label>
                            <input class="form-control" type="email" name="email" maxlength="100" value="" required/><br/>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="cpf">CPF:</label>
                            <input class="form-control" type="text" name="cpf"  maxlength="11" value="" id="cpf"required/><br/>
                        </div>
                    </div>
                    <input class="btn btn-outline-success" type="submit" value="Enviar nova senha"/>
                    <a class="btn btn-outline-danger" href="index.jsp">Voltar</a>
                </form>
            </div>
        </c:if>
        <c:if test="${( param.form == \"enviado\")}" >
            <a class="btn btn-outline-danger" href="index.jsp">Voltar</a>
        </c:if>

        <script type="text/javascript">

            jQuery(document).ready(function ($) {
                $('#cpf').mask('999.999.999-99');
            });

        </script>
    </body>
</html>
