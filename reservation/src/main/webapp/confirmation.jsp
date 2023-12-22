
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirmation Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        form {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input, button {
            display: block;
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            box-sizing: border-box;
        }

        button {
            background-color: #DB7093;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        h1 {
            color: #DB7093;
        }
    </style>
</head>
<body>
<h1>Бронирование успешно!</h1>

<p>Ваш столик в ресторане с id <%= request.getParameter("id") %> был успешно зарезервирован.</p>

</body>
</html>
