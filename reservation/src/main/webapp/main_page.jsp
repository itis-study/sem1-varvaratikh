<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Booking</title>
    <style>
        body {
            background-color: #4070f4;
            color: white;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        header, main, footer {
            padding: 20px;
        }

        h1 {
            font-size: 36px;
            font-weight: bold;
            margin-top: 50px;
        }

        .restaurant-list {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .restaurant {
            width: 300px;
            margin: 10px;
            padding: 10px;
            border: 1px solid white;
            border-radius: 5px;
        }

        .restaurant h2 {
            font-size: 24px;
        }

        .restaurant p {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .restaurant img {
            max-width: 100%;
            border-radius: 5px;
        }

        p.entry-link,
        p.registration-link {
            position: absolute;
            top: 10px;
        }

        p.entry-link {
            left: 10px;
        }

        p.registration-link {
            right: 10px;
        }

        a.entry-link,
        a.registration-link {
            color: white;
            text-decoration: none;
            font-weight: bold;
            margin: 0 20px;
        }
    </style>
</head>
<body>
<p class="entry-link"><a href="login.jsp" class="entry-link">Вход</a></p>
<p class="registration-link"><a href="registration.jsp" class="registration-link">Регистрация</a></p>
<h1>Restaurants</h1>
<div class="restaurant-list">
<%--    <c:forEach items="${restaurants}" var="restaurant">--%>
<%--        <div class="restaurant">--%>
<%--            <h2>${restaurant.name}</h2>--%>
<%--            <p>${restaurant.description}</p>--%>
<%--            <img src="${restaurant.image}" alt="${restaurant.name}" width="200" height="150">--%>
<%--            <a href="booking?id=${restaurant.id}">Book Now</a>--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
    <div class="restaurant">
        <h2>Мармелад</h2>
        <p>уютное место с домашней атмосферой, где можно насладиться изысканными десертами и разнообразными напитками.</p>
        <img src="https://sun9-40.userapi.com/impg/hCBCBLWvtYoaxD_sGqgj2iTxP2ph07KnuXjAsA/JKEFEe0IGPo.jpg?size=1024x1024&quality=96&sign=d4641ced0cf36fea777fd076b032c515&type=album" alt="Мармелад" width="200" height="200">
        <a href="restaurant.jsp?id=1" class="book-now-link">Зарезервировать</a>
    </div>

    <div class="restaurant">
        <h2>Паста и Вино</h2>
        <p>идеальное место для любителей итальянской кухни, где можно насладиться свежей пастой и отличным вином.</p>
        <img src="https://sun9-11.userapi.com/impg/_hKZpkDeP63Zp_LnY3EY243V7s0oQiwQ3GjC8w/XLzXK_TRgyI.jpg?size=1024x1024&quality=96&sign=0ada7da94eead9df4669d6b512e93292&type=album" alt="Паста и Вино" width="200" height="200">
        <a href="restaurant.jsp?id=2" class="book-now-link">Зарезервировать</a>
    </div>

    <div class="restaurant">
        <h2>СушиМастер</h2>
        <p>здесь вы можете насладиться свежими и качественными
            суши, роллами и другими японскими блюдами.</p>
        <img src="https://sun9-57.userapi.com/impg/nKAL9zVNazG4QU9BrTQJYEMxoRefMtkgQfta_g/3AndXwV0_lU.jpg?size=1024x1024&quality=96&sign=b47d97ad4b4e28f4788e22b440e96636&type=album" alt="СушиМастер" width="200" height="200">
        <a href="restaurant.jsp?id=3" class="book-now-link">Зарезервировать</a>
    </div>

    <div class="restaurant">
        <h2>СтейкХаус</h2>
        <p>это место для ценителей сочных стейков и мясных деликатесов,
            поданных с изысканными соусами и гарнирами.</p>
        <img src="https://sun9-10.userapi.com/impg/B0gR4YuZ-8Lr3DPB1XfZaYdhwElpFNKvTQqj2A/S-XU2Mxz1ZA.jpg?size=1024x1024&quality=96&sign=ff666e8324d5eb594c70cd14f7234305&type=album" alt="СтейкХаус" width="200" height="200">
        <a href="restaurant.jsp?id=4" class="book-now-link">Зарезервировать</a>
    </div>
    <div class="restaurant">
        <h2>Пекинский Дракон</h2>
        <p>здесь вы можете отведать аутентичные китайские блюда,
            приготовленные по традиционным рецептам.</p>
        <img src="https://sun9-56.userapi.com/impg/S8bI2SBcN7OX1l4-E7AVO69LOEzeIK9S50GoDA/fQgRzsIMA28.jpg?size=1024x1024&quality=96&sign=2cc8113f91d7039b5a1eb424a8bcbae1&type=album" alt="Пекинский Дракон" width="200" height="200">
        <a href="restaurant.jsp?id=5" class="book-now-link">Зарезервировать</a>
    </div>
    <div class="restaurant">
        <h2>Мексиканский Сомбреро</h2>
        <p>настоящий уголок Мексики с аутентичными блюдами, пикантными
            соусами и разнообразными текилой и маргаритой.</p>
        <img src="https://sun36-1.userapi.com/impg/8N4gOO9m_Wqs8dUyF8rm3eUvGpQ6LHFR7d1j5Q/nNHthYMWXlc.jpg?size=1024x1024&quality=96&sign=47a8708ce9604148749e6831ad14886e&type=album" alt="Мексиканский Сомбреро" width="200" height="200">
        <a href="restaurant.jsp?id=6" class="book-now-link">Зарезервировать</a>
    </div>
    <div class="restaurant">
        <h2>Итальянская Вечеря</h2>
        <p>это место, где вы можете насладиться классическими итальянскими
            блюдами, приготовленными по старинным рецептам.</p>
        <img src="https://sun9-21.userapi.com/impg/znOKusENGUQXsVPWVy47zsjLiOlkTI82U5Xxkg/iPalzQ-k19w.jpg?size=1024x1024&quality=96&sign=479f6df170db27e407f81d4b97fbc968&type=album" alt="Итальянская Вечеря" width="200" height="200">
        <a href="restaurant.jsp?id=7" class="book-now-link">Зарезервировать</a>
    </div>
    <div class="restaurant">
        <h2>Французский Бистро</h2>
        <p>здесь вы окунетесь в атмосферу Парижа и насладитесь
            изысканной французской кухней и отличными винами.</p>
        <img src="https://sun9-19.userapi.com/impg/kIA1_8mPMwHXt3HzsGo07bnmViMRARFUgXWOvg/iNK6MILvN8s.jpg?size=1024x1024&quality=96&sign=7f96e7a669edce0a7ea60119917e28f5&type=album" alt="Французский Бистро" width="200" height="200">
        <a href="restaurant.jsp?id=8" class="book-now-link">Зарезервировать</a>
    </div>
    <div class="restaurant">
        <h2>Японский Сад</h2>
        <p>это место, где вы можете отведать изысканные японские блюда,
            насладиться традиционным чаем и уютной атмосферой.</p>
        <img src="https://sun9-48.userapi.com/impg/HvkQsWUlawYox1huPqHZUUscWkDXIjO_Ma3UxA/yLuALI2FEbk.jpg?size=1024x1024&quality=96&sign=425ac4eb844cfa898e4f221c213c13bd&type=album" alt="Японский Сад" width="200" height="200">
        <a href="restaurant.jsp?id=9" class="book-now-link">Зарезервировать</a>
    </div>
    <div class="restaurant">
        <h2>Тайский Закат</h2>
        <p>здесь вы окунетесь в атмосферу Таиланда и попробуете разнообразные тайские блюда,
            приготовленные с использованием свежих трав и специй.</p>
        <img src="https://sun9-35.userapi.com/impg/S283FfGV-InUdL_IDPf8HjeZDCBI-4FZRz86lQ/H-XUmek10k0.jpg?size=1024x1024&quality=96&sign=8bd8eea3a5f501dca2facb70d1d4b789&type=album" alt="Тайский Закат" width="200" height="200">
        <a href="restaurant.jsp?id=10" class="book-now-link">Зарезервировать</a>
    </div>
    <div class="restaurant">
    <h2>Испанский Фламенко</h2>
    <p>то место, где вы можете насладиться аутентичной испанской кухней,
        традиционными тапас и живой музыкой фламенко.</p>
    <img src="https://sun9-42.userapi.com/impg/WaqE-XfaEp9Q216hmP4kbk9cXv2kPYMR6hd8Kg/H2FDslD2Wzw.jpg?size=1024x1024&quality=96&sign=173c415e9a3787ae93b7c1cdb0772ade&type=album" alt="Испанский Фламенко" width="200" height="200">
        <a href="restaurant.jsp?id=11" class="book-now-link">Зарезервировать</a>
    </div>
    <div class="restaurant">
        <h2>Греческий Оливковый</h2>
        <p>здесь вы окунетесь в атмосферу Греции и попробуете разнообразные греческие
            блюда, приготовленные с использованием оливкового масла и свежих овощей.</p>
        <img src="https://sun9-64.userapi.com/impg/CTB5A4JRNc-yjPG7E8FKEOru5IikVeFiFLtAiQ/NTP2kwQMQe8.jpg?size=1024x1024&quality=96&sign=2063402043c55c91fcb34794c373fceb&type=album" alt="Греческий Оливковый" width="200" height="200">
        <a href="restaurant.jsp?id=12" class="book-now-link">Зарезервировать</a>
    </div>
    <div class="restaurant">
        <h2>Индийский Эпицентр</h2>
        <p>это место, где вы можете отведать разнообразные индийские блюда,
            насладиться острыми специями и традиционной индийской гостеприимностью.</p>
        <img src="https://sun9-32.userapi.com/impg/ZtDWJbACcPtJOcriu85hj1XbXU4qKqsvHS1K6w/EntDF2FoRc4.jpg?size=1024x1024&quality=96&sign=97dde7aebd94c60f1f1458f9a8fec248&type=album" alt="Индийский Эпицентр" width="200" height="200">
        <a href="restaurant.jsp?id=13" class="book-now-link">Зарезервировать</a>
    </div>

    <div class="restaurant">
        <h2>Бразильская Страсть</h2>
        <p>здесь вы окунетесь в атмосферу Бразилии и попробуете разнообразные
            бразильские блюда, сопровождаемые живой музыкой и танцами.</p>
        <img src="https://sun9-62.userapi.com/impg/e65pOcmU7P13h6Jp6kBUiCuxJjtE-1sJO462Ww/mPG_0KLYE5E.jpg?size=1024x1024&quality=96&sign=456a1d6b1923a95e027a4158084e746c&type=album" alt="Бразильская Страсть" width="200" height="200">
        <a href="restaurant.jsp?id=14" class="book-now-link">Зарезервировать</a>
    </div>

    <div class="restaurant">
        <h2>Aмериканский Дайнер</h2>
        <p>это место для любителей американской кухни, где вы можете
            насладиться классическими бургерами, хот-догами и молочными коктейлями.</p>
        <img src="https://sun36-2.userapi.com/impg/g7FAX6itlkdkuXpj-G2rmBD-nclAFDIwf6iwXA/H1J4-OXKVcE.jpg?size=1024x1024&quality=96&sign=f4286028947ac4b4e63fcf4bb5832aa4&type=album" alt="Aмериканский Дайнер" width="200" height="200">
        <a href="restaurant.jsp?id=15" class="book-now-link">Зарезервировать</a>
    </div>




</div>
</body>
</html>
