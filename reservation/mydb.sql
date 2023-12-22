CREATE TABLE restaurants (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    image BYTEA
);

INSERT INTO restaurants (name, description, image) VALUES 
('Мармелад', 'уютное место с домашней атмосферой, где можно 
 насладиться изысканными десертами и разнообразными напитками.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image1.jpg'),
 
('Паста и Вино', 'идеальное место для любителей итальянской кухни, где 
 можно насладиться свежей пастой и отличным вином.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image2.jpg'),

('СушиМастер', 'здесь вы можете насладиться свежими и качественными 
 суши, роллами и другими японскими блюдами.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image3.jpg'),

('СтейкХаус', 'это место для ценителей сочных стейков и мясных деликатесов, 
 поданных с изысканными соусами и гарнирами.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image4.jpg'),

('Пекинский Дракон', 'здесь вы можете отведать аутентичные китайские блюда,
 приготовленные по традиционным рецептам.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image5.jpg'),

('Мексиканский Сомбреро', 'настоящий уголок Мексики с аутентичными блюдами, пикантными 
 соусами и разнообразными текилой и маргаритой.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image6.jpg'),

('Итальянская Вечеря', 'это место, где вы можете насладиться классическими итальянскими
 блюдами, приготовленными по старинным рецептам.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image7.jpg'),

('Французский Бистро', 'здесь вы окунетесь в атмосферу Парижа и насладитесь 
 изысканной французской кухней и отличными винами.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image8.jpg'),

('Японский Сад', 'это место, где вы можете отведать изысканные японские блюда, 
 насладиться традиционным чаем и уютной атмосферой.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image9.jpg'),

('Тайский Закат', 'здесь вы окунетесь в атмосферу Таиланда и попробуете разнообразные тайские блюда, 
 приготовленные с использованием свежих трав и специй.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image10.jpg'),

('Испанский Фламенко', 'это место, где вы можете насладиться аутентичной испанской кухней, 
 традиционными тапас и живой музыкой фламенко.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image11.jpg'),

('Греческий Оливковый', 'здесь вы окунетесь в атмосферу Греции и попробуете разнообразные греческие 
 блюда, приготовленные с использованием оливкового масла и свежих овощей.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image12.jpg'),

('Индийский Эпицентр', 'это место, где вы можете отведать разнообразные индийские блюда, 
 насладиться острыми специями и традиционной индийской гостеприимностью.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image13.jpg'),

('Бразильская Страсть', 'здесь вы окунетесь в атмосферу Бразилии и попробуете разнообразные 
 бразильские блюда, сопровождаемые живой музыкой и танцами.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image14.jpg'),

('Aмериканский Дайнер', 'это место для любителей американской кухни, где вы можете
 насладиться классическими бургерами, хот-догами и молочными коктейлями.', 'C:\Users\Вадим\IdeaProjects\reservation\res\image15.jpg');