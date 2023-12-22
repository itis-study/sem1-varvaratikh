<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Резервирование стола в ресторане</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #add8e6; /* светло-синий цвет на фоне */
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            text-align: center;
        }

        .tables-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin: 10px;
        }

        .table {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #4070f4;
            margin: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: #fff;
        }

        .reserved {
            background-color: #808080;
        }

        form {
            margin-top: 30px;
        }

        input, button {
            display: block;
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            box-sizing: border-box;
        }

        button {
            background-color: #4070f4;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Схема зала ресторана</h2>
    <div class="tables-container">
        <div class="table" onclick="reserveTable(1)" id="table1">1</div>
        <div class="table" onclick="reserveTable(2)" id="table2">2</div>
        <div class="table" onclick="reserveTable(3)" id="table3">3</div>
        <div class="table" onclick="reserveTable(4)" id="table4">4</div>
        <div class="table" onclick="reserveTable(5)" id="table5">5</div>
        <div class="table" onclick="reserveTable(6)" id="table6">6</div>
        <div class="table" onclick="reserveTable(7)" id="table7">7</div>
    </div>

    <form action="/reservation" method="post">
        <h2>Бронирование столика</h2>
        <input type="text" name="tableName" placeholder="Название столика" required>
        <label for="reservationTime">Дата и время бронирования:</label>
        <input type="datetime-local" id="reservationTime" name="reservationTime" required>
        <button type="submit">Забронировать</button>
    </form>
</div>

<script>
    function reserveTable(tableNumber) {
        var table = document.getElementById('table' + tableNumber);

        if (!table.classList.contains('reserved')) {
            table.classList.add('reserved');

            var xhr = new XMLHttpRequest();
            xhr.open('POST', '/reserveTable', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            var params = 'tableNumber=' + tableNumber;

            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var response = xhr.responseText;
                    console.log(response);
                }
            }
            xhr.send(params);
        } else {
            alert('Этот стол уже зарезервирован.');
        }
    }
</script>
</body>
</html>
