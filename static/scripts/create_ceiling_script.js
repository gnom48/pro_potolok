$(function () {
    let gridWidth = 10;
    let minRightPanelWidth = 100;
    let minRightPanelHeight = 100;
    let maxRightPanelWidth = 800;
    let maxRightPanelHeight = 600;
    let aspectRatio;
    let rightPanel, widthValue, heightValue;
    let pricePerMeter = 600;
    let totalPrice, square, meter_square;
    let media = 1;

    if (window.matchMedia("(max-width: 768px)").matches) {
        media = 0.3;
    }

    rightPanel = $('#rightPanel');
    widthValue = $('#widthValue').find('input');
    heightValue = $('#heightValue').find('input');

    rightPanel.css({
        'maxWidth': maxRightPanelWidth,
        'maxHeight': maxRightPanelHeight
    });

    function addPrice(newItem, coef) {
        let price = $('#totalPrice').text(); // текущая цена

        if (price == null || price === "") price = parseInt(0);
        else price = parseInt(price);

        let data = newItem.data("value"); // цена нового элемента

        let size = newItem.data("size");
        if (size == "" || size == null) size = 1;
        else size = size / 100;

        data = size * data * coef;
        totalPrice = parseInt(price + data);
        $('#totalPrice').text(totalPrice);
        $('#biggerPrice').text(totalPrice + 1000);
        if (20000 - (totalPrice + 1000) < 3000 && coef > 0 && 20000 - (totalPrice + 1000) > 0) {
            document.getElementById('offer-modal').showModal();
            $('#elementsLeft').text(20000 - (totalPrice + 1000));
        }
    }

    function clearShadowFloating() {
        // Удаление доп. элементов
        $('#rightPanel .shadow').remove();
        $('#rightPanel .floating').remove();

        if (rightPanel.children().length == 3) {
            rightPanel.resizable('enable');
            rightPanel.addClass('clear');
            var newElement = $('<div class="clear-div"><p>Просто добавь сюда элементы потолка</p><p class="highlight">+</p></div>');
            rightPanel.children().eq(0).before(newElement);
            $('.ui-resizable-handle').css("background-color", "#555");
            $('#rightPanel > span').css("font-weight", 200);
        }
        pricePerMeter = 600;
    }

    $('input[type=radio][name=type]').change(function () {
        if (this.id === 'classic_checkbox') {
            // Обработка изменения для классического типа
            clearShadowFloating();
        } else if (this.id === 'shadow_checkbox') {
            // Обработка изменения для теневого типа
            clearShadowFloating();
            
            // Добавление теневого потолка
            var rightPanelWidth = rightPanel.width();
            var rightPanelHeight = rightPanel.height();
            var rectangle = $('<div class="shadow"></div>').css({
                'width': rightPanelWidth - 20,
                'height': rightPanelHeight - 20,
                'border': '1.5px solid black',
                'position': 'relative',
                'top': '10px',
                'left': '10px'
            });
            rightPanel.children().eq(0).before(rectangle);

            if (rightPanel.hasClass('clear')) {
                rightPanel.resizable('disable');
                rightPanel.children().eq(1).remove();
                rightPanel.removeClass('clear');
            }

            pricePerMeter = 500;
        } else if (this.id === 'floating_checkbox') {
            // Обработка изменения для парящего типа
            clearShadowFloating();
            
            // Добавление парящего потолка
            var rightPanelWidth = rightPanel.width();
            var rightPanelHeight = rightPanel.height();
            var rectangle = $('<div class="floating"></div>').css({
                'width': rightPanelWidth - 20,
                'height': rightPanelHeight - 20,
                'border': '1.5px solid black',
                'position': 'relative',
                'top': '10px',
                'left': '10px'
            });
            rightPanel.children().eq(0).before(rectangle);

            if (rightPanel.hasClass('clear')) {
                rightPanel.resizable('disable');
                rightPanel.children().eq(1).remove();
                rightPanel.removeClass('clear');
            }

            pricePerMeter = 500;
        }
    });

    handleEnteredValues();
    resizeInput(widthValue);
    resizeInput(heightValue);

    function handleEnteredValues() {
        let width = parseFloat(widthValue.val());
        let height = parseFloat(heightValue.val());
        let newWidth, newHeight;
        if (width > height) {
            aspectRatio = maxRightPanelWidth / width * 100;
            newWidth = maxRightPanelWidth;
            newHeight = height / 100 * aspectRatio;

            if (newHeight > maxRightPanelHeight) {
                newHeight = maxRightPanelHeight;
            }
            if (newHeight < minRightPanelHeight) {
                newHeight = minRightPanelHeight;
            }

            aspectRatio = newHeight / height * 100;
            newWidth = width / 100 * aspectRatio;
        }
        else {
            aspectRatio = maxRightPanelHeight / height * 100;
            newHeight = maxRightPanelHeight;
            newWidth = width / 100 * aspectRatio;

            if (newWidth > maxRightPanelWidth) {
                newWidth = maxRightPanelWidth;
            }
            if (newWidth > minRightPanelWidth) {
                newWidth = minRightPanelWidth;
            }

            aspectRatio = newWidth / width * 100;
            newHeight = height / 100 * aspectRatio;
        }

        rightPanel.css({
            'width': (newWidth * media) + 'px',
            'height': (newHeight * media) + 'px'
        });
        square = Math.ceil(width * height);
        meter_square = square / 10000;
        
        $('#santi-square').text(square);
        $('#meter-square').text(meter_square.toFixed(2));

        totalPrice = Math.ceil(pricePerMeter * meter_square);
        $('#totalPrice').text(totalPrice);
        $('#biggerPrice').text(totalPrice + 1000);
    }

    function updateValues() {
        $(document).ready(function () {
            let width = rightPanel.width();
            let height = rightPanel.height();
            width = width / aspectRatio;
            height = height / aspectRatio;
            let santiWidth = width * 100;
            let santiHeight = height * 100;
            widthValue.val(`${Math.round(santiWidth)}`);
            heightValue.val(`${Math.round(santiHeight)}`);
            resizeInput(widthValue);
            resizeInput(heightValue);

            square = Math.ceil(santiWidth * santiHeight);
            meter_square = square/10000;
            
            $('#santi-square').text(square);
            $('#meter-square').text(meter_square.toFixed(2));

            totalPrice = Math.ceil(pricePerMeter * meter_square);
            $('#totalPrice').text(totalPrice);
            $('#biggerPrice').text(totalPrice + 1000);

            
        });
    }

    $('.orig').draggable({
        containment: "#create-ceiling-container",
        grid: [2 * gridWidth, 2 * gridWidth],
        snap: "#rightPanel", // прижатие к границам при приближении 
        snapMode: "both",
        snapTolerance: 20, // расстояние для прижатия 
        helper: function () {
            var newItem = $(this).find('.div-image').clone();

            var element = $(this).find('.div-image').find('img'); // получаем элемент, который нужно повернуть 

            var originalWidth = element.width() // Получаем исходную ширину изображения 
            var originalHeight = element.height(); // Получаем исходную высоту изображения 

            // Update the parent div dimensions 
            newItem.width(originalWidth);
            newItem.height(originalHeight);

            var newDiv = $('<div class="moved-container"></div>');
            newDiv.append(newItem);

            var currentHeight = newItem.height();  // получить высоту после добавления 
            var newHeight = currentHeight + 30; 
            newItem.css('height', newHeight + 'px'); 

            var currentWidth = newItem.width();  // получить высоту после добавления 
            var newWidth = currentWidth + 30; 
            newItem.css('width', newWidth + 'px');

            return newDiv;
        },
    });


    $('#leftPanel').droppable({
        accept: ".moved",
        hoverClass: "hover",
        drop: function (event, ui) {
            addPrice(ui.helper.find('.div-image'), -1);
            ui.draggable.remove();
            if (rightPanel.children().length == 3) {
                rightPanel.resizable('enable');
                rightPanel.addClass('clear');
                $('#roomDimensionsForm button').prop('disabled', false);
                var newElement = $('<div class="clear-div"><p>Просто добавь сюда элементы потолка</p><p class="highlight">+</p></div>');
                rightPanel.children().eq(0).before(newElement);
                $('.ui-resizable-handle').css("background-color", "#555");
                $('#rightPanel > span').css("font-weight", 200);
            }
        }
    });

    rightPanel.droppable({
        hoverClass: "hover",
        drop: function (event, ui) {
            if (!ui.helper.hasClass('moved')) {
                if ($(this).hasClass('clear')) {
                    $(this).resizable('disable');
                    $('#roomDimensionsForm button').prop('disabled', true);
                    $(this).children().eq(0).remove();
                    $(this).removeClass('clear');
                }

                $('.ui-resizable-handle').css("background-color", "#aaa")
                $('#rightPanel > span').css("font-weight", 700);

                // Code to handle dropping 
                var element = ui.helper;

                // Create a new element with the image and text 
                var newItem = element.clone();
                newItem.addClass('moved');
                // newItem.removeClass('orig'); 
                newItem.draggable({
                    containment: "#create-ceiling-container",
                    grid: [gridWidth, gridWidth],
                    snap: "#rightPanel",
                    snapMode: "both",
                    snapTolerance: 20
                });

                if (newItem.find('.div-image').hasClass('customizable')) {
                    // Show modal for size input 
                    var newSize = prompt("Введите размер элемента в см");
                    //debugger; 
                    if (newSize == null) return;
                    newItem.append('<p class="size-label">' + newSize + 'см.</p>');
                    newItem.data("size", newSize);
                }
                rightPanel.append(newItem);
                addPrice(newItem.find('.div-image'), 1);
            }
        }
    });

    rightPanel.on('mouseenter', '.moved', function () {
        if ($(this).find('.div-image').hasClass('customizable')) {
            var $rotateImage = $('<div class="rotateButton"><img class="rotateImage" src="../static/images/rotate_icon.png" width="20" height="20"></div>')
                .click(function () {
                    // обработка клика по изображению 
                    var element = $(this).parent().find('.div-image'); // получаем элемент, который нужно повернуть 
                    // Получаем текущее значение угла наклона элемента 
                    debugger;
                    var currentRotation = (element.data('rotation') || 0) - 15;
                    element.css('transform', 'rotate(' + currentRotation + 'deg)');
                    element.data('rotation', currentRotation); // сохраняем угол поворота для элемента 

                    // Обновление родительского div 
                    element = element[0];
                    var parentDiv = element.parentElement; // Получаем родительский div 
                    var originalWidth = element.getBoundingClientRect().width; // Получаем исходную ширину изображения 
                    var originalHeight = element.getBoundingClientRect().height + 50; // Получаем исходную высоту изображения 

                    debugger;
                    // Поворачиваем размеры, учитывая текущий угол поворота 
                    //var radians = currentRotation * Math.PI / 180; 
                    //var sin = Math.abs(Math.sin(radians)); 
                    //var cos = Math.abs(Math.cos(radians)); 
                    //var newWidth = originalWidth * cos + originalHeight * sin; 
                    //var newHeight = originalHeight * cos + originalWidth * sin + 20; 

                    // Update the parent div dimensions 
                    parentDiv.style.width = originalWidth + 'px';
                    parentDiv.style.height = originalHeight + 'px';
                });
            $(this).append($rotateImage);
        }
    });

    rightPanel.on('mouseleave', '.moved', function () {
        $(this).find('.rotateButton').remove();
    });

    rightPanel.resizable({
        handler: "e, s, se", // Или любое другое необходимое направление масштабирования
        resize: function (event, ui) {
            updateValues();
        },
        stop: function () {
            if (20000 - (totalPrice + 1000) < 3000 && 20000 - (totalPrice + 1000) > 0) {
                document.getElementById('offer-modal').showModal();
                $('#elementsLeft').text(20000 - (totalPrice + 1000));
            }
        }
    });

    widthValue.on('input', function () {
        var inputNumber = parseInt($(this).val());

        // Проверка, является ли введенное значение числом
        if ($.isNumeric(inputNumber) && inputNumber > 0) {
            resizeInput($(this));
            handleEnteredValues();
        } else {
            document.getElementById('error-modal').showModal();
        }
    });

    heightValue.on('input', function () {
        var inputNumber = parseInt($(this).val());

        // Проверка, является ли введенное значение числом
        if ($.isNumeric(inputNumber) && inputNumber > 0) {
            resizeInput($(this));
            handleEnteredValues();
        } else {
            document.getElementById('error-modal').showModal();
        }
    });

    function resizeInput(input) {
        let length = input.val().length;
        if (window.matchMedia("(max-width: 768px)").matches) {
            input.css('width', (length + 2) + 'ch');
            return;
        }
        input.css('width', (length + 1) + 'ch');
    }
});