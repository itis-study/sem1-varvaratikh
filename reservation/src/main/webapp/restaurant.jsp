<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ресторан</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #add8e6;
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

    p {
      text-align: center;
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
  <h2>${restaurant.name}</h2>
  <p>${restaurant.description}</p>

  <form method="post" action="/submitReview">
    <input type="hidden" name="restaurantId" value="${restaurant.id}">
    <label for="review">Оставьте свой отзыв:</label>
    <textarea id="review" name="review" rows="4" required></textarea>
    <button type="submit" formaction="restaurant.jsp">Отправить отзыв</button>
  </form>

  <form method="post">
    <input type="hidden" name="restaurantId" value="${restaurant.id}">
    <button type="submit" formaction="reservation.jsp">Зарезервировать столик</button>
  </form>
</div>

</body>
</html>
