$(function () {
    let gridWidth = 10;
    let minRightPanelWidth = 100;
    let minRightPanelHeight = 500;
    let maxRightPanelWidth = 1200;
    let maxRightPanelHeight = 800;
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
        if (size === "" || size == null) size = 1;
        else size /= 100;

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

    $(document).ready(function () {

        let width = 600;
        let height = 300;
        rightPanel.css({
            'width': width + 'px',
            'height': height + 'px'
        });
    });

    function handleEnteredValues() {
        let width = parseFloat(widthValue.val());
        let height = parseFloat(heightValue.val());
        //let newWidth, newHeight;
        //if (width > height) {
        //    aspectRatio = maxRightPanelWidth / width * 100;
        //    newWidth = maxRightPanelWidth;
        //    newHeight = height / 100 * aspectRatio;

        //    if (newHeight > maxRightPanelHeight) {
        //        newHeight = maxRightPanelHeight;
        //    }
        //    if (newHeight < minRightPanelHeight) {
        //        newHeight = minRightPanelHeight;
        //    }

        //    aspectRatio = newHeight / height * 100;
        //    newWidth = width / 100 * aspectRatio;
        //}
        //else {
        //    aspectRatio = maxRightPanelHeight / height * 100;
        //    newHeight = maxRightPanelHeight;
        //    newWidth = width / 100 * aspectRatio;

        //    if (newWidth > maxRightPanelWidth) {
        //        newWidth = maxRightPanelWidth;
        //    }
        //    if (newWidth > minRightPanelWidth) {
        //        newWidth = minRightPanelWidth;
        //    }

        //    aspectRatio = newWidth / width * 100;
        //    newHeight = height / 100 * aspectRatio;
        //}

        //rightPanel.css({
        //    'width': (newWidth * media) + 'px',
        //    'height': (newHeight * media) + 'px'
        //});

        rightPanelWidth = rightPanel.width();
        rightPanelHeight = rightPanel.height();

        rightPanel.find('.shadow').css({
            'width': rightPanelWidth - 20,
            'height': rightPanelHeight - 20
        });
        rightPanel.find('.floating').css({
            'width': rightPanelWidth - 20,
            'height': rightPanelHeight - 20
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

    var size_inputted;

    $('#size-input-modal').dialog({
        autoOpen: false,
        modal: true,
        buttons: {
            'Отмена': function () {
                $(this).dialog('close');
            },
            'ОК': function () {
                size_inputted = parseFloat($('#number').val());

                if (!isNaN(number)) {
                    // обработка введенного числа
                    console.log('Введено число:', number);
                    $(this).dialog('close');
                } else {
                    // вывод сообщения об ошибке
                    alert('Введено некорректное значение.');
                }
            }
        }
    });

    let _currentWidget;
    let _currentParent;
    let _clone;
    var _draggables = document.querySelectorAll("div[class='orig']");
    console.log(_draggables);
    var _leftPanel = document.getElementById('leftPanel');
    var _rightPanel = document.getElementById('rightPanel');
    var _container = document.querySelector("#create-ceiling-container");
    var isTouchDevice = 'ontouchstart' in window;
    if (isTouchDevice) {
        // если устройство поддерживает сенсорный ввод
        _draggables.forEach(draggable => {
            draggable.draggable = true;
            draggable.addEventListener('touchmove', touchMove);
            draggable.addEventListener('touchend', touchEnd);
        });
    }
    else {
        // если устройство поддерживает сенсорный ввод
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

                //var currentHeight = newItem.height();  // получить высоту после добавления
                //var newHeight = currentHeight + 16;
                //newItem.css('height', newHeight + 'px');

                //var currentWidth = newItem.width();  // получить высоту после добавления
                //var newWidth = currentWidth - 4;
                //newItem.css('width', newWidth + 'px');
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
                var $rotateImage = $(this).find('.rotateButton');
                debugger;
                if ($rotateImage.length != 0) {
                    $rotateImage.show();
                    return;
                }
                $rotateImage = $('<div class="rotateButton"><img class="rotateImage" src="../static/images/rotate_icon.png" width="20" height="20"></div>')
                    .click(function () {
                        // обработка клика по изображению
                        var element = $(this).parent().find('.div-image'); // получаем элемент, который нужно повернуть
                        // Получаем текущее значение угла наклона элемента
                        var currentRotation = (element.data('rotation') || 0) - 15;
                        element.css('transform', 'rotate(' + currentRotation + 'deg)');
                        element.data('rotation', currentRotation); // сохраняем угол поворота для элемента

                        // Обновление родительского div
                        element = element[0];
                        var parentDiv = element.parentElement; // Получаем родительский div
                        var originalWidth = element.getBoundingClientRect().width; // Получаем исходную ширину изображения
                        var originalHeight = element.getBoundingClientRect().height + 50; // Получаем исходную высоту изображения

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
            $(this).find('.rotateButton').hide();
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
    }

    function touchMove(event) {
        event.preventDefault();
        this.isPressed = false;
        this.isMoved = true;
        //console.log(event);
        //debugger;
        var divImage = event.target;
        //console.log(event);
        if (this.classList === undefined || !this.classList.contains('div-image')) {
            while (divImage.classList === undefined || divImage.classList == null || divImage.classList.length == 0 || !divImage.classList.contains('orig')) {
                //console.log(divImage);
                divImage = divImage.parentNode;
            }
            divImage = divImage.querySelector("div.div-image");
        }
        else {
            divImage = this;
        }
            
        //debugger;
        _clone = divImage.cloneNode(true);
        _clone.style.position = 'relative';
        _clone.style.top = `0px`;
        _clone.style.left = `0px`;
        
        //console.log(divImage);
        //debugger;
        
        let touch = event.targetTouches[0];

        var element = divImage.querySelector('img');
        divImage.style.width = `${element.offsetWidth}px`;
        divImage.style.height = `${element.offsetHeight}px`;

        var top = touch.pageY - (_container.offsetTop) - (divImage.offsetHeight / 2);
        var left = touch.pageX - (_container.offsetLeft) - (divImage.offsetWidth / 2);

        //console.log(`${touch.pageY} - ${_container.offsetTop} - (${divImage.offsetHeight} / 2) = ${top}`);
        //console.log(`${touch.pageX} - ${_container.offsetLeft} - (${divImage.offsetWidth} / 2) = ${left}`);
        
        divImage.style.position = 'absolute';
        divImage.style.top = `${top}px`;
        divImage.style.left = `${left}px`;

        //var div = document.createElement("div");
        //var _width = divImage.offsetWidth;
        //var _height = divImage.offsetHeight;

        //div.style.width = `${_width}px`;
        //div.style.height = `${_height}px`;
        //div.classList.add('moved-container');

        //div.appendChild(divImage);

        _currentWidget = divImage;
        _currentParent = divImage.parentNode;
            
        //debugger;
    }

    function touchEnd() {
        this.isPressed = false;
        //debugger;

        // если нажатие не было движением, то генерируем событие клика
        //debugger;
        if (!this.isMoved) {
            this.click();
        }
        else {
            if (!_currentWidget.classList.contains('moved')) {
                _currentParent.insertBefore(_clone, _currentParent.children[0]);
                if (isInRightPanel(_currentWidget)) {

                    _currentWidget.addEventListener('touchmove', touchMove);
                    _currentWidget.addEventListener('touchend', touchEnd);

                    if (_currentWidget.classList.contains('customizable')) {
                        _currentWidget.addEventListener('touchstart', function (event) {
                            event.preventDefault();
                            // установка флага нажатия
                            this.isPressed = true;
                        });
                        _currentWidget.addEventListener('touchcancel', function (event) {
                            // сброс флага нажатия при прерывании события
                            this.isPressed = false;
                        });
                        $(_currentWidget).click(function () {
                            // обработка клика по изображению

                            // Получаем текущее значение угла наклона элемента
                            var currentRotation = ($(this).data('rotation') || 0) - 15;
                            $(this).find('img').css('transform', 'rotate(' + currentRotation + 'deg)');
                            $(this).data('rotation', currentRotation); // сохраняем угол поворота для элемента
                        });
                        var newSize = prompt("Введите размер элемента в см");

                        if (newSize !== null) {
                            // преобразование строки в число
                            newSize = parseFloat(newSize);

                            // проверка на корректность ввода
                            if (!isNaN(newSize)) {
                                // обработка введенного числа
                                console.log('Введено число:', newSize);
                                $(_currentWidget).append('<p class="size-label">' + newSize + 'см.</p>');
                                $(_currentWidget).data("size", newSize);
                            } else {
                                // вывод сообщения об ошибке
                                alert('Введено некорректное значение.');
                                return;
                            }
                        } else {
                            // вывод сообщения об отмене ввода
                            console.log('Ввод отменен.');
                            return;
                        }
                    }

                    _currentWidget.classList.add('moved');
                    //debugger;
                    _rightPanel.append(_currentWidget);
                    addPrice($(_currentWidget), 1);
                }
                else {
                    _currentWidget.remove();
                    addPrice($(_currentWidget), -1);
                }
            }
            else
                if (!isInRightPanel(_currentWidget)) {
                    _currentWidget.remove();
                    addPrice($(_currentWidget), -1);
                }

            this.isMoved = false;
        }
    }

    function isInRightPanel(node) {
        //console.log(`top | ${node.offsetTop} | ${_rightPanel.offsetTop}`);
        //console.log(`left | ${node.offsetLeft} | ${_rightPanel.offsetLeft}`);
        //console.log(`left + width | ${node.offsetLeft + node.offsetWidth} | ${_rightPanel.offsetLeft + _rightPanel.offsetWidth}`);
        //console.log(`top + height | ${node.offsetTop + node.offsetHeight} | ${_rightPanel.offsetTop + _rightPanel.offsetHeight}`);

        if (node.offsetTop > _rightPanel.offsetTop &&
            node.offsetLeft > _rightPanel.offsetLeft &&
            (node.offsetLeft + node.offsetWidth) < (_rightPanel.offsetLeft + _rightPanel.offsetWidth) &&
            (node.offsetTop + node.offsetHeight) < (_rightPanel.offsetTop + _rightPanel.offsetHeight))
            return true;
        return false;
    }

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