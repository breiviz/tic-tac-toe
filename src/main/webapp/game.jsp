<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="game.GameBean.GameState" %>
<%@page import="game.Cell" %>
<%@page import="game.Line" %>
<jsp:useBean id="gameBean" scope="session" class="game.GameBean" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tic Tac Toe</title>
    <style>
        /* Estilos para que el tablero se vea ordenado y las imágenes no sean gigantes */
        table {
            border-collapse: collapse;
            margin: 20px auto; /* Centra la tabla */
            background-color: #f0f0f0;
        }
        td {
            width: 100px;  /* Tamaño de la celda */
            height: 100px; 
            padding: 0;
            text-align: center;
            border: 2px solid #333;
        }
        td img {
            width: 100px;  /* Fuerza a la imagen a medir 100px */
            height: 100px;
            display: block;
        }
        h1, h2 {
            text-align: center;
            font-family: Arial, sans-serif;
        }
        .controls {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Tic Tac Toe</h1>

    <table>
        <c:forEach var="line" items="${gameBean.gridLines}">
            <tr>
                <c:forEach var="cell" items="${gameBean.getGridStatus(line)}">
                    <td>
                        <c:choose>
                            <%-- Caso cuando es X --%>
                            <c:when test="${cell.state == 'X'}">
                                <img src="img/state_x.png" alt="X"/>
                            </c:when>
                            
                            <%-- Caso cuando es O --%>
                            <c:when test="${cell.state == 'O'}">
                                <img src="img/state_o.png" alt="O"/>
                            </c:when>
                            
                            <%-- Caso cuando la celda está vacía --%>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${winner == null}">
                                        <a href="GameServlet?Line=${cell.line}&Col=${cell.col}">
                                            <img src="img/state_null.png" alt="vacio"/>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="img/state_null.png" alt="vacio"/>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>

    <div class="controls">
        <c:if test="${winner != null}">
            <h2>¡Ganó ${winner}!</h2>
            <form action="index.jsp" method="post">
                <input type="submit" name="Replay" value="Jugar de nuevo">
            </form>
        </c:if>
    </div>
</body>
</html>