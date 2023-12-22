<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Бронирование столика</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f0f0;
    }

    form {
      max-width: 600px;
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
      background-color: #4070f4;
      color: #fff;
      border: none;
      cursor: pointer;
    }
  </style>
</head>
<body>
<form action="/reservation" method="post">
  <h2>Бронирование столика</h2>

  <input type="text" name="tableName" placeholder="Название столика" required>

  <label for="reservationTime">Дата и время бронирования:</label>
  <input type="datetime-local" id="reservationTime" name="reservationTime" required>

  <button type="submit">Забронировать</button>
</form>
</body>
</html>
