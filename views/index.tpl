<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/css-animation/1.1.1/css/animation.min.css">

    
   
    <title>PRO Потолок</title>
    <style>
        body {
            font-family: 'Inter', sans-serif;;
            margin: 0;
            padding: 0;
            background-color: white;
            color: #333;
            justify-content: center;
        }

         /* Устанавливаем GIF как фон для всей страницы */
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://media.giphy.com/media/y3wBjXMffuFjy/giphy.gif') no-repeat center center fixed;
            background-size: cover;
            z-index: -1; /* Помещаем фон позади всех элементов */
            opacity: 0.5; /* Добавьте прозрачность, если хотите */
        }

        header, section {
            text-align: center;
            margin-bottom: 20px;
        }


        .main-header {
            background-color: #fff;
            border-bottom: 1px solid #ddd;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .main-header img {
            width: 50px;
            border-radius: 50%;
        }
        .main-header .company-info {
            display: flex;
            align-items: center;
        }
        .main-header .company-info h1 {
            font-size: 28px;
            margin: 0 10px;
            color: #483185;
            font-weight: 800;
            
        }
        .main-header .phone-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background-color: #000;
            color: #fff;
            border-radius: 50%;
            text-decoration: none;
            font-size: 20px;
            margin-right: 2%;
        }

        .call-now {
            background-color: #000;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            margin-top: 10px;
        }

        .arrow {
            position: absolute;
            width: 50px; /* Adjust as needed */
            height: 50px; /* Adjust as needed */
        }

        .arrow-left {
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
        }

        .arrow-right {
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
        }
        
        .description img {
            width: 100%;
            border-radius: 10px;
            margin-top: 4%;
        }

        

        .features {
            background-color: #F2F2F2;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center; /* Центрирование по вертикали */
        }

        .features div{
            display: flex; /* Используем Flexbox для детей */
            flex-direction: column; /* Колонка, чтобы изображение было сверху, а текст снизу */
            align-items: center; /* Центрирование по горизонтали */
            justify-content: center; /* Центрирование по вертикали */
            width: 30%;
            text-align: center;
            box-sizing: border-box;
            padding: 20px; /* Опционально, для внутреннего отступа */
        }

        .features img {
            width: 30%; /* Ширина изображения на 100% контейнера */
            max-width: 100%;
            height: auto; /* Автоматическое изменение высоты */
            margin-bottom: 10px; /* Отступ снизу для изображения */
        }


        .types div {
            display: inline-block;
            width: 30%;
            text-align: center;
            margin-bottom: 20px;
        }
        .types img {
            width: 100%;
            border-radius: 10px;
        }
        .contact img {
            width: 100%;
            border-radius: 10px;
        }

        .startSection {
            display: flex;
            align-items: center;
            justify-content: center;
            background: #E2E2E2;
            padding: 20px; /* Добавляем padding для отступа внутри секции */
            text-align: center; /* Центрирование текста внутри контейнера */;
        }

        .startSection .textSection {
            max-width: 35%; /* Ограничиваем максимальную ширину текста */
            color: #000;
            font-weight: 1500;

        }

        .startSection h2 {
            font-size: 36px;
            font-weight: 1500; /* Используем числовое значение для "extraBold", если требуется */
            margin: 0; /* Убираем дополнительные отступы */
        }

        .startSection p {
            font-size: 18px;
            margin: 20px 0; /* Устанавливаем отступы для абзаца */
        }

        .startSection a {
            display: inline-block;
            margin-top: 20px;
            padding: 15px 30px;
            background-color: black;
            color: white;
            text-decoration: none;
            font-size: 18px;
            border-radius: 25px; /* Исправляем значение радиуса */
        }

        .startSection a:hover {
            background-color: darkgray;
        }

        .startSection img {
            border-radius: 20px;
            margin-left: 20px; /* Отступ слева для изображения */
            max-width: 100%;
            height: auto; /* Автоматическая высота изображения */
        }

        .imageSection img {
            height: 80%;
        }

        .ProPotolComand {
            display: flex;
            align-items: center;
            background-color: white;
            justify-content: center;
            margin-top: 20px;
        }

        .ProPotolComand img {
            margin-right: 20px; /* Adjust margin as needed */
            max-width: 40%; /* Adjust max-width as needed */
        }

        .ProPotolComand .textContent1 {
            max-width: 30%; /* Adjust max-width as needed */
        }

        .ProPotolComand h2 {
            font-size: 24px;
            margin: 0 0 10px 0;
        }

        .ProPotolComand p {
            font-size: 12px;
            margin: 0;
            max-width: 100%; 
            text-align: center;

        }


        .types {
            text-align: center;
            align-items: center !important;
            justify-content: center !important;
        }

        .types h2 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        

        .card.reverse {
            flex-direction: row-reverse; 
            align-items: center;/* Изменяем порядок элементов для .card.reverse на мобильных устройствах */
        }

        .card.reverse img {
            margin-right: 0px;
        }

        .card img {
            width: 50%; /* Ширина изображения на 100% карточки */
            margin: 0; /* Убираем разрывы между изображением и текстом */
            border-radius: 50px; /* Скругляем углы изображения так же, как и у карточки */
            border-bottom-left-radius: 0; /* Оставляем нижние углы не скругленными */
            border-bottom-right-radius: 0; /* Оставляем нижние углы не скругленными */
        }


        .textContent {
            flex: 1; /* Занимаем доступное пространство внутри flex-контейнера */
            text-align: left; /* Выравниваем текст внутри .textContent по левому краю */
            margin-top: 0;
            margin-bottom: 0;
            top: 0;
            transform: none;
            font-size: 14px;
        }

        .card:not(.reverse) .textContent {
            right: 7%; /* Положение слева на 0 для .card */
        }

        .card.reverse .textContent {
            left: 7%; /* Положение справа на 0 для .card.reverse */
        }

        .textContent h3,
        .textContent p,
        .textContent a {
            text-align: center; /* Выравниваем текст внутри .textContent по центру по горизонтали */
        }

        .textContent a {
            display: inline-block;
            padding: 10px 20px;
            background-color: black;
            color: white;
            text-decoration: none;
            font-size: 14px;
            border-radius: 25px;
        }

        .textContent a:hover {
            background-color: darkgray;
        }

        .ProPotolComand img {
            border-radius: 35px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1), 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        @media (min-width: 768px) {

            .card {
                display: flex !important; /* Используем flexbox для размещения элементов */
                flex-direction: row; /* Для мобильных устройств размещаем элементы по колонке */
                background-color: white;
                border: none; /* Убираем стандартную границу */
                padding: 0 !important; /* Убираем padding */
                margin-bottom: 20px !important;
                width: 90% !important; /* Уменьшаем ширину для мобильных устройств */
                max-width: 90% !important;
                margin: 20px auto !important;
           
                align-items: center; /* Выравниваем элементы по вертикали внутри flex-контейнера */
                box-shadow: 0 0 0 2px #000; /* Добавляем черную тень для имитации границы */
                border-radius: 82px; /* Скругляем углы до 35px */
                overflow: hidden; /* Прячем всё, что выходит за пределы карточки */
            }

            .ProPotolComand h2 {

                font-size: 36px;
                margin: 30px 0 10px 0;
            }

            .ProPotolComand p {
                font-size: 20px;
                margin-bottom: 5px;
                max-width: 100%; 
                text-align: center;

            }

            .ProPotolComand img {
                border-radius: 35px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1), 0 6px 20px rgba(0, 0, 0, 0.1);
            }

            .card {
                flex-direction: row; /* Для больших экранов размещаем элементы по ряду */
                width: 50% !important; /* Ширина карточки 50% */
                max-width: 50% !important;
            }

            .card.reverse {
                flex-direction: row-reverse; /* Изменяем порядок элементов для .card.reverse */
            }

            .card img {
                height: 10% !important;
                width: 50% !important; /* Ширина изображения 50% карточки */
                border-radius:50px; /* Скругляем углы изображения */
                margin-right: 20px; /* Отступ между изображением и текстом */
            }

            .card.reverse img {
                margin-right: 0px;
            }

                

            .textContent {
                flex: 1; /* Занимаем доступное пространство внутри flex-контейнера */
                text-align: left; /* Выравниваем текст внутри .textContent по левому краю */
                margin-top: 0;
                margin-bottom: 0;
                top: 0;
                transform: none;
            }

            .card:not(.reverse) .textContent {
                right: 7%; /* Положение слева на 0 для .card */
            }

            .card.reverse .textContent {
                left: 7%; /* Положение справа на 0 для .card.reverse */
            }

            .carousel {
                width: 40%;
                margin: auto;
                overflow: hidden;
                position: relative;
                background: white;
            }

            .carousel-track {
                display: flex;
                transition: transform 0.5s ease-in;
            }

            .carousel-item {
                min-width: 100%;
                max-width: 100%;
                width: 80%;
                box-sizing: border-box;
                padding: 20px;
            }

            .testimonial {
                background: #f9f9f9;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 30px;
                text-align: center;
                
            }
            .testimonial p {
                font-size: 18px;
                color: #555;
            }
            .testimonial h3 {
                margin-top: 10px;
                font-size: 22px;
                color: #333;
            }
            .carousel-buttons {
                position: absolute;
                top: 50%;
                width: 100%;
                display: flex;
                justify-content: space-between;
                transform: translateY(-50%);

            }
            .carousel-button {
                background: none;
                border: none;
                font-size: 30px;
                cursor: pointer;
            }
            .avatar {
                width: 80px;
                height: 80px;
                border-radius: 50%;
                margin-bottom: 10px;
            }


            .contact {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 80%;
                margin: 40px auto;
                max-width: 1200px;
            }

            .contact-text {
                max-width: 20%;
                margin-right: 20px;
                text-align: left;
            }

            .contact-text h1 {
                font-size: 26px;
                margin-bottom: 10px;
            }

            .contact-text h2 {
                font-size: 24px;
                margin: 0 0 0 0;
                margin-bottom: 1%;
            }

            .contact-text p {
                font-size: 18px;
                margin-bottom: 10px;
                margin-top: 0px;
            
            }

            .contact-text a {
                color: black;
                text-decoration: none;
            }

            .contact-text a:hover {
                text-decoration: underline;
            }

            .contact-map {
                border-radius: 35px;
                overflow: hidden;
                width: 40%;
            }

            .contact-map iframe {
                width: 100%;
                height: 400px;
                border: none;
                border-radius: 35px;
            }

            footer {
                padding: 20px;
                background-color:#f9f9f9;
                text-align: center;

            }

            .social-icons {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin-top: 10px;
            }

            .social-icon {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 40px;
                height: 40px;
                background-color: #9B9B9B; /* Темно-серый цвет */
                border-radius: 50%;
                transition: background-color 0.3s;
            }

            .social-icon img {
                width: 24px;
                height: 24px;
            }

            .social-icon:hover {
                background-color: #555;
            }

            .footer-text {
                margin-top: 10px;
                font-size: 14px;
                color: #333;
            }

            .registered {
                font-size: 12px;
                vertical-align: super;
            }

            .callus a {
                display: inline-block;
                margin-top: 10px;
                padding: 15px 30px;
                background-color: black;
                color: white;
                text-decoration: none;
                font-size: 18px;
                border-radius: 25px; /* Исправляем значение радиуса */
            }
        }



        .callus {
            background-color: #E2E2E2;
        }

        .carousel {
            width: 100%; /* Задаем карусели ширину в 100% */
            margin: auto;
            overflow: hidden;
            position: relative;
            background: white;
            align-items: center;
        }

        .carousel-track {
            display: flex;
            transition: transform 0.5s ease-in;
            align-items: center;
        }

        .carousel-item {
            min-width: 80%;
            max-width: 80%;
            width: 100%; /* Устанавливаем ширину карточек на 100% */
            box-sizing: border-box;
            padding: 20px;
            align-items: center;
        }

        .carousel img {
            width: 150px;
            height: 150px;
        }

        .testimonial {
            background: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            text-align: center;
        }

        .testimonial p {
            font-size: 18px;
            color: #555;
        }

        .testimonial h3 {
            margin-top: 10px;
            font-size: 22px;
            color: #333;
        }

        .carousel-buttons {
            position: absolute;
            top: 50%;
            width: calc(100% - 40px); /* Ширина карусели с отступами для кнопок */
            display: flex;
            justify-content: space-between;
            transform: translateY(-50%);
            padding: 0 20px; /* Отступы для кнопок */
            box-sizing: border-box;
        }



            
        .carousel-button {
            background: none;
            border: none;
            font-size: 30px;
            cursor: pointer;
        }

        .avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 10px;
        }


            .contact {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 90%;
                margin: 40px auto;
                max-width: 1200px;
            }

            .contact-text {
                max-width: 20%;
                margin-right: 20px;
                text-align: left;
            }

            .contact-text h1 {
                font-size: 26px;
                margin-bottom: 10px;
            }

            .contact-text h2 {
                font-size: 24px;
                margin: 0 0 0 0;
                margin-bottom: 1%;
            }

            .contact-text p {
                font-size: 18px;
                margin-bottom: 10px;
                margin-top: 0px;
            
            }

            .contact-text a {
                color: black;
                text-decoration: none;
            }

            .contact-text a:hover {
                text-decoration: underline;
            }

            .contact-map {
                border-radius: 35px;
                overflow: hidden;
                width: 40%;
            }

            .contact-map iframe {
                width: 100%;
                height: 400px;
                border: none;
                border-radius: 35px;
            }

            footer {
                padding: 20px;
                background-color:#f9f9f9;
                text-align: center;

            }

            .social-icons {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin-top: 10px;
            }

            .social-icon {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 40px;
                height: 40px;
                background-color: #483185; /* Темно-серый цвет */
                border-radius: 50%;
                transition: background-color 0.3s;
            }

            .social-icon img {
                width: 24px;
                height: 24px;
            }

            .social-icon:hover {
                background-color: #555;
            }

            .footer-text {
                margin-top: 10px;
                font-size: 14px;
                color: #333;
            }

            footer img {
                width: 5%;
                height: auto;
            }

            .registered {
                font-size: 12px;
                vertical-align: super;
            }

            .callus a {
                display: inline-block;
                margin-top: 10px;
                padding: 15px 30px;
                background-color: black;
                color: white;
                text-decoration: none;
                font-size: 18px;
                border-radius: 25px; /* Исправляем значение радиуса */
                margin-bottom: 10px;
            }

            .callus p {    
            
                margin-top: 10px;
            }

            .callus {
                background-color: #E2E2E2;
                display: flex;
                flex-direction: column;
                align-items: center; /* Центрирование по горизонтали */
                text-align: center; /* Центрирование текста */
                padding: 20px;
                position: relative; /* Позиционирование относительно родительского элемента */
            }

            .callus img {
                position: absolute; /* Абсолютное позиционирование */
                top: 50%; /* Центрирование по вертикали относительно родителя */
                transform: translateY(-50%); /* Центрирование по вертикали */
                width: 20%; /* Задаем ширину изображений */
                max-width: 200px; /* Максимальная ширина изображений */
                height: auto; /* Автоматическое изменение высоты для сохранения пропорций */
            }

            .callus img:first-of-type {
                left: 12%; /* Позиционирование первой картинки слева */
            }

            .callus img:last-of-type {
                right: 12%; /* Позиционирование второй картинки справа */
            }

            .callus h2 {
                font-size: 48px;
                color: #333;
                margin: 25px 0 0 0; /* Отступы сверху и снизу */
                position: relative; /* Относительное позиционирование для перекрытия */
                z-index: 1; /* Поднятие текста над изображениями */
            }

            /* Стили модального окна */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            text-align: center;
        }

        .modal a {
            display: inline-block;
            margin-top: 10px;
            padding: 15px 30px;
            background-color: black;
            color: white;
            text-decoration: none;
            font-size: 18px;
            border-radius: 25px; /* Исправляем значение радиуса */
            margin-bottom: 10px;
        }

        .modal-content h2 {
            margin-bottom: 10px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .highlighter {
            color: #483185;
        }

        footer a {
            color: black;
            text-decoration: none; /* Убираем подчеркивание по умолчанию */
        }

        footer a:hover {
            text-decoration: underline; /* Добавляем подчеркивание при наведении */
        }

        .banner {
            background-color: #483185;
            color: white;
            width: 100%;
            padding: 20px 0;
            text-align: center;
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center; /* Центрируем содержимое */
            cursor: pointer; /* Указываем, что баннер кликабелен */
            transition: transform 0.3s ease-in-out; /* Добавляем плавный переход */
        }

        .banner:hover {
            transform: scale(1.05); /* Увеличиваем баннер при наведении */
        }

        .banner a {
            text-decoration: none;
            color: white;
            display: flex;
            white-space: nowrap;
            animation: marquee 20s linear infinite;
        }

        .banner-content span {
            font-size: 24px;
            font-weight: bold;
            margin: 0 20px;
        }

        .fa-phone-alt {
            margin: 0 20px;
            font-size: 24px;
            color: white;
        }

        @keyframes marquee {
            0% { transform: translateX(0%); }
            100% { transform: translateX(-30%); }
        }

        #myModal .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            max-width: 80%;
            text-align: center;
        }

        .avatar-div {
            width: 310px;
            height: 310px;
            background-image: url('https://media.giphy.com/media/l2Sqgo31Jf0D0hRJK/giphy.gif');
            background-size: cover;
            background-position: center;
        }


            
    </style>
    <script src="../static/scripts/jquery-ui-1.13.3/external/jquery/jquery.js"></script>
    <script src="../static/scripts/jquery-ui-1.13.3/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="../static/content/animation.css">

    <link rel="stylesheet" href="../static/content/create_ceiling_styles.css">
    <link rel="stylesheet" href="../static/content/create_ceiling_mobile_styles.css">
    <link rel="stylesheet" href="../static/content/create_ceiling_mobile.css">
    
    <script src="../static/scripts/create_ceiling_script.js"></script>
</head>
<body>  
    <header class="main-header animate-dropDown">
        <div class="company-info">
            <img src="static/images/avatar-2.png" alt="Avatar" class="animate animate-dropDown">
            <h1 class="animate animate-dropDown">PRO Потолок</h1>
        </div>
        <a href="tel:+79785858080" class="phone-icon animate animate-dropDown" style='background-color: #483185;'>&#x260E;</a>
    </header>

    <section  class="create-ceiling animate animate-dropDown">
        <!--<img src="static/images/arrow-left.png" alt="Левая стрелка" class="arrow arrow-left">-->
        <h1><span class="highlighter">Нарисуй</span> свой потолок сам и узнай <span class="highlighter">цену</span></h1>
        <div id="ceiling-type-grid">
            <h2>Для начала давай определимся с материалом и типом потолка:</h2>

            <div id="material-radio-div">
                <div>
                    <input type="radio" id="satin_radio" name="finish" value="satin" checked>
                    <label for="satin_radio">Сатиновый</label>
                </div>

                <div>
                    <input type="radio" id="matte_radio" name="finish" value="matte">
                    <label for="matte_radio">Матовый</label><br>
                </div>

                <div>
                    <input type="radio" id="glossy_radio" name="finish" value="glossy">
                    <label for="glossy_radio">Глянцевый</label>
                </div>
            </div>
            <div class="separator"></div>
            <div id="type-check-div">
                <div>
                    <input type="radio" id="classic_checkbox" name="type" checked>
                    <label for="shadow_checkbox">Классический</label>
                </div>

                <div>
                    <input type="radio" id="shadow_checkbox" name="type">
                    <label for="shadow_checkbox">Теневой</label>
                </div>

                <div>
                    <input type="radio" id="floating_checkbox" name="type">
                    <label for="shadow_checkbox">Парящий</label>
                </div>
            </div>

            <div class="avatar-div">
            </div>

            <h2>Теперь просто перетаскивай элементы в область ниже</h2>
        </div>

        <div id="create-ceiling-container">
            <div id="leftPanel">
                <div id="lamp-div" class="orig">
                    <div class="div-image" data-value="400">
                        <img src="../static/images/lamp_element.png" alt="Светильник">
                    </div>
                    <div class="info">
                        <p>Светильник</p>
                        <span class="price">400</span><span>руб</span>
                    </div>
                </div>
                <div class="separator"></div>
                <div id="lustre-div" class="orig">
                    <div class="div-image" data-value="300">
                        <img src="../static/images/lustre_element.png" alt="Люстра">
                    </div>
                    <div class="info">
                        <p>Люстра</p>
                        <span class="price">300</span><span>руб</span>
                    </div>
                </div>
                <div class="separator"></div>
                <div id="track-div" class="orig">
                    <div class="div-image customizable" data-value="400">
                        <img src="../static/images/track_element.png" alt="Трек">
                    </div>
                    <div class="info">
                        <p>Трек</p>
                        <span class="price">400</span><span>руб/м</span>
                    </div>
                </div>
                <div class="separator"></div>
                <div id="line-div" class="orig">
                    <div class="div-image customizable" data-value="2000">
                        <img src="../static/images/line_element.png" alt="Световая линия">
                    </div>
                    <div class="info">
                        <p>Световая линия</p>
                        <span class="price">2000</span><span>руб/м</span>
                    </div>
                </div>
                <div class="separator"></div>
                <div id="cornice-div" class="orig">
                    <div class="div-image customizable" data-value="400">
                        <img src="../static/images/cornice_element.png" alt="Карниз">
                    </div>
                    <div class="info">
                        <p>Карниз</p>
                        <span class="price">400</span><span>руб/м</span>
                    </div>
                </div>
            </div>

            <dialog id="offer-modal">
                <span>Добавьте элементов ещё на </span><span id="elementsLeft"></span><span>р. и получите 3 светильника в подарок!</span>
                <button onclick="document.getElementById('offer-modal').close();">Закрыть</button>
            </dialog>

            <div id="rightPanel-container">
                <div id="rightPanel" class="clear">
                    <div class="clear-div">
                        <p>Просто добавь сюда элементы потолка</p>
                        <p class="highlighter">+</p>
                    </div>
                </div>

                <div id="widthValue">
                    <input type="number" step="1" value="600" required><span class="highlighter" oninput="resizeInput(this)">см</span>
                </div>

                <div id="heightValue">
                    <input type="number" step="1" value="300" required><span class="highlighter" oninput="resizeInput(this)">см</span>
                </div>

                <dialog id="error-modal">
                    <span>Некорректное число!</span>
                    <button onclick="document.getElementById('error-modal').close();">Закрыть</button>
                </dialog>

                <div id="price-calculation" style="text-align: right;">
                    <div>
                        <label for="santi-square">Площадь:  </label>
                        <label id="santi-square"></label><span class="highlighter">см<sup>2</sup> = </span><label id="meter-square"></label><span class="highlight">м<sup>2</sup></span>
                    </div>
                    <div>
                        <label for="totalPrice">Примерная цена (рубли): </label>
                        <label id="totalPrice"></label><span> - </span><label id="biggerPrice"></label>
                        <!--<div class="animation leFlyInTop sequence">Все точные замеры выполняются замерщиками</div> -->
                    </div>
                </div>

                
            </div>
        </div>

        
        
        <!--<img src="static/images/arrow-right.png" alt="Правая стрелка" class="arrow arrow-right">-->
    </section>

    <div class="banner" onclick="window.location.href='tel:+79785858080'">
        <a href="tel:+79785858080">
            <div class="banner-content">
                <span>Позвонить</span>
                <i class="fas fa-phone-alt"></i>
                <span>Позвонить</span>
                <i class="fas fa-phone-alt"></i>
                <span>Позвонить</span>
                <i class="fas fa-phone-alt"></i>
                <span>Позвонить</span>
                <i class="fas fa-phone-alt"></i>
                <!-- Дублируем содержимое для бесшовной анимации -->
                <span>Позвонить</span>
                <i class="fas fa-phone-alt"></i>
                <span>Позвонить</span>
                <i class="fas fa-phone-alt"></i>
                <span>Позвонить</span>
                <i class="fas fa-phone-alt"></i>
                <span>Позвонить</span>
                <i class="fas fa-phone-alt"></i>
                <!-- Дублируем содержимое для бесшовной анимации -->
                <span>Позвонить</span>
                <i class="fas fa-phone-alt"></i>
                <span>Позвонить</span>
                <i class="fas fa-phone-alt"></i>
                <span>Позвонить</span>
                <i class="fas fa-phone-alt"></i>
                <span>Позвонить</span>
                <i class="fas fa-phone-alt"></i>
            </div>
        </a>
    </div>

    <div class="startSection">
        <div class="textSection animate animate-fadeInLeft">
            <h2>Лучший потолок прямо сейчас c гарантией на 10 лет!</h2>
            <p>Мы являемся лидерами на рынке и делаем все быстро и качественно.</p>
            <a href="#">Позвонить сейчас!</a>
        </div>
        <div class="imageSection animate animate-fadeInRight">
            <img src="static/images/sticker.webp" alt="АватарГиф">
        </div>
    </div>

    <section class="ProPotolComand animate animate-fadeInRight">
        <img src="static/images/dreamteam.webp" alt="Команда ProПотолок">
        <div class="textContent1">
            <h2>PRO Потолок</h2>
            <p>Команда опытных и аккуратных монтажников, технологов и менеджеров, любящих свое дело. Мы возьмемся за проект любой сложности: от матового потолка в зале с одной люстрой до коттеджа со сложными линиями и встроенными трековыми системами и тканевой потолок.</p>
        </div>
    </section>


    <section class="description">
        <div class="features">
            <div>
                <img src="static/images/resize.png" alt="Выполнение замеров абсолютно бесплатно">
                <p>Выполнение замеров абсолютно бесплатно<span class="modal-open" data-text="Эта услуга платная">*</span></p>
            </div>

            <div>
                <img src="static/images/safety.png" alt="Работаем с пылесосами и укрываем обои пленкой">
                <p>Работаем с пылесосами и укрываем стены пленкой <span class="modal-open" data-text="Эта услуга платная">**</span></p>
            </div>

            <div>
                <img src="static/images/payy.png" alt="Оплата после выполнения всех работ">
                <p>Оплата после выполнения всех работ</p>
            </div>
        </div>
    </section>



   <section class="types">
        <h2>Виды потолков</h2>
        <div class="card">
            <img src="static/images/track.png" alt="Трековый">
            <div class="textContent">
                <h3>Трековый</h3>
                <p>Удобное сочетание акцентного и рассеянного света. Легкая перестановка и добавление светильников.</p>
                <a href="#" class="show-modal">Узнать больше</a>
            </div>
        </div>
        <div class="card reverse">
            <img src="static/images/pars.png" alt="Парящий">
            <div class="textContent">
                <h3>Парящий</h3>
                <p>Уникальный и элегантный дизайн с эффектом парящего потолка. Идеально подходит для современных интерьеров.</p>
                <a href="#" class="show-modal">Узнать больше</a>
            </div>
        </div>
        <div class="card">
            <img src="static/images/svets_line.png" alt="Контурный">
            <div class="textContent">
                <h3>Контурный</h3>
                <p>Идеально ровная подсветка контура потолка, которая придаст вашему интерьеру изысканность и современный вид.</p>
                <a href="#" class="show-modal">Узнать больше</a>
            </div>
        </div>
        <div class="card reverse">
            <img src="static/images/svets_line.png" alt="Еще один вид">
            <div class="textContent">
                <h3>Световые линии</h3>
                <p>Оригинальный способ подсветки, который добавит вашему интерьеру уникальность и стиль.</p>
                <a href="#" class="show-modal">Узнать больше</a>
            </div>
        </div>
        <div class="card">
            <img src="static/images/shadow.png" alt="Последний">
            <div class="textContent">
                <h3>Теневой</h3>
                <p>Эффект теневого потолка создает впечатление визуальной легкости и уникального стиля в вашем интерьере.</p>
                <a href="#" class="show-modal">Узнать больше</a>
            </div>
        </div>
    </section>

    <!-- Модальное окно -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2></h2>
            <p class="modal-description"></p>
            <a href="tel:+79785858080" class="phone-icon">&#x260E; Позвонить</a>
        </div>
    </div>


    <section class="callus">
        <img src="static/images/1234.png" alt="Телефон"></img>
        
        <h2>Лучшие технологии в вашем доме</h2>

        <img src="static/images/4321.png" alt="Телефон"></img>
        <div>
            <a href="#">Позвонить сейчас!</a>
        </div>
    </section>

    <div class="carousel">
        <h2 style="font-size:36px; text-align: center;">Наши отзывы</h2>
        <div class="carousel-track">
            <div class="carousel-item">
            <div class="testimonial">
                <img src="static/images/fedor.webp" alt="Avatar of Федор" class="avatar">
                <h3>Федор</h3>
                <p>"PRO потолок преобразил мой дом. Качество материала и монтаж на высшем уровне!"</p>
            </div>
        </div>
        <div class="carousel-item">
            <div class="testimonial">
                <img src="static/images/julia.webp" alt="Avatar of Юлия" class="avatar">
                <h3>Юлия</h3>
                <p>"Мы заказали натяжные потолки в детскую комнату. Теперь там светло и уютно. Спасибо PRO потолок!"</p>      
            </div>
        </div>
        <div class="carousel-item">
            <div class="testimonial">
                <img src="static/images/nikita.webp" alt="Avatar of Никита" class="avatar">
                <h3>Никита</h3>
                <p>"Рекомендую PRO потолок всем, кто хочет качественный и красивый потолок. Сервис на высоте!"</p>
            </div>
        </div>
        </div>
        <div class="carousel-buttons">
            <button class="carousel-button" id="prevButton">&#10094;</button>
            <button class="carousel-button" id="nextButton">&#10095;</button>
        </div>
    </div>


    <section class="contact">
        <div class="contact-text">
            <h1>Звони и получи подарок на выбор</h1>
            <p></p>
            <h2>Наш E-mail</h2>
            <p>pro-potolok92@mail.ru</p>
            <p></p>

            <h2>Наш телефон</h2>
            <a href="tel:+79785858080">+7 (978) 585 80 80</a>
            <p></p>

            <h2>Адрес</h2>
            <p>г. Севастополь, ул Новороссийская, 56</p>
        </div>
       <div class="contact-map">
            <iframe src="https://yandex.ru/map-widget/v1/?um=constructor%3A7348c0311ccf0fcb91ee08b0e19f5205fbd12eeee48be37efa930ddfb96f3072&amp;source=constructor" width="320" height="240" frameborder="0"></iframe>
       </div>
    </section>


    <footer>
        <p>* - Замеры абсолютно бесплатно только на территории города Севастополя.</p>
        <p>** - Стены укрываются по желанию клиента. Услуга оплачивается отдельно.</p>
        
        <img src="static/images/avatar-2.png" alt="Avatar">
        <div class="social-icons">
            <a href="https://vk.com/pro_potoloksev" target="_blank" class="social-icon">
                <img src="static/images/VK1.png" alt="VK">
            </a>
            <a href="https://t.me" target="_blank" class="social-icon">
                <img src="static/images/tg.png" alt="Telegram">
            </a>
        </div>
        <p class="footer-text">2024 PRO Потолок. Все права защищены.<span class="registered">&reg;</span></p>
        <p>Сайт разработан компанией <a href="https://t.me/Darik097">DariX</a>.</p>
        <p>Все права на контент принадлежат правообладателям. Незаконное копирование и распространение материалов запрещено.<span class="registered">&reg;</span></p>

    </footer>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const h2Element = document.querySelector('.callus h2');
            const phoneNumber = '+79785858080'; // Замените на ваш номер телефона

            h2Element.addEventListener('click', () => {
                window.location.href = 'tel:' + phoneNumber;
            });
        });

        document.addEventListener("DOMContentLoaded", function() {
            const observerOptions = {
                threshold: 0.1
            };

            const observer = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const animationClass = entry.target.dataset.animationClass;
                        console.log(`Element is intersecting: Adding class ${animationClass}`); // Отладка
                        entry.target.classList.add(animationClass);
                        observer.unobserve(entry.target);
                    }
                });
            }, observerOptions);

            document.querySelectorAll('.animate').forEach(element => {
                const animationClass = Array.from(element.classList).find(cls => cls.startsWith('animate-'));
                console.log(`Observing element with class ${animationClass}`); // Отладка
                element.dataset.animationClass = animationClass;
                observer.observe(element);
            });
        });


        document.addEventListener('DOMContentLoaded', () => {
            const track = document.querySelector('.carousel-track');
            const prevButton = document.getElementById('prevButton');
            const nextButton = document.getElementById('nextButton');
            let items = Array.from(track.children);
            let currentIndex = 1; // Начальный индекс на второй карточке (после первого клонирования)
            let itemWidth = items[0].getBoundingClientRect().width;

            // Клонируем первый и последний элементы для циклического перехода
            const firstClone = items[0].cloneNode(true);
            const lastClone = items[items.length - 1].cloneNode(true);
            track.appendChild(firstClone);
            track.insertBefore(lastClone, items[0]);

            items = Array.from(track.children); // Обновляем массив элементов после добавления клонов
            const totalItems = items.length;

            // Функция для обновления карусели
            function updateCarousel() {
                itemWidth = items[0].getBoundingClientRect().width; // Обновляем ширину элемента при изменении размеров окна

                // Перемещаемся в начало, если достигли последнего элемента (клон первого)
                if (currentIndex === totalItems - 1) {
                    currentIndex = 1;
                    track.style.transition = 'transform 0.5s ease-in';
                    updateCarouselPosition();
                } 
                // Перемещаемся в конец, если достигли первого элемента (клон последнего)
                else if (currentIndex === 0) {
                    currentIndex = totalItems - 2;
                    track.style.transition = 'transform 0.5s ease-in';
                    updateCarouselPosition();
                } 
                // Просто обновляем позицию карусели в противном случае
                else {
                    track.style.transition = 'transform 0.5s ease-in';
                    updateCarouselPosition();
                }
            }


            // Функция для обновления позиции карусели
            function updateCarouselPosition() {
                const translateXValue = -currentIndex * itemWidth + ((window.innerWidth - itemWidth) / 2);
                track.style.transform = `translateX(${translateXValue}px)`;
            }

            // Обработчик клика на кнопку "назад"
            prevButton.addEventListener('click', () => {
                currentIndex--;
                updateCarousel();
            });

            // Обработчик клика на кнопку "вперёд"
            nextButton.addEventListener('click', () => {
                currentIndex++;
                updateCarousel();
            });

            // Инициализация карусели
            updateCarousel();

            // Обновление размеров элементов при изменении размеров окна
            window.addEventListener('resize', () => {
                updateCarousel();
            });
        });





            document.addEventListener("DOMContentLoaded", function() {
                const modal = document.getElementById('modal');
                const modalContent = document.querySelector('.modal-content');
                const modalTitle = modalContent.querySelector('h2');
                const modalDescription = modalContent.querySelector('.modal-description');
                const closeModal = modalContent.querySelector('.close');
                const showModalLinks = document.querySelectorAll('.show-modal');

                // Обработчик для открытия модального окна
                showModalLinks.forEach(link => {
                    link.addEventListener('click', function(event) {
                        event.preventDefault();
                        const card = this.closest('.card');
                        const title = card.querySelector('h3').textContent;
                        const description = card.querySelector('p').textContent;
                        modalTitle.textContent = title;
                        modalDescription.textContent = description;
                        modal.style.display = 'block';
                    });
                });

                // Обработчик для закрытия модального окна
                closeModal.addEventListener('click', function() {
                    modal.style.display = 'none';
                });

                // Закрытие модального окна при клике вне его области
                window.addEventListener('click', function(event) {
                    if (event.target === modal) {
                        modal.style.display = 'none';
                    }
                });
            });
        


            
    </script>
</body>
</html>
