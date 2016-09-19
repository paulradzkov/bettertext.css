---
title: "Типографика для сайтов"
layout: default
description: "Улучшенная типографика для голого HTML и Markdown"
---

# Типографика bettertext.css

[![npm version](https://badge.fury.io/js/bettertext.css.svg)](http://badge.fury.io/js/bettertext.css) [![bower version](https://badge.fury.io/bo/bettertext.css.svg)](http://badge.fury.io/bo/bettertext.css)

Делает текст опрятным, а структуру страницы легко различимой, предотвращает распространенные баги. Легко настраивается, не содержит классов и не мешает стилям шаблона. Используйте в готовом виде или как основу для собственной типографики.

<div class="row">
    <div class="col-xs-shrink">
        <p>
        **Документация**  
        [Установка и подключение](#install)  
        [Настройка LESS-версии](#settings)  
        [Параметры по-умолчанию](#defaults)  
        [Переопределение настроек](#customization)
        </p>
    </div>
    <div class="col-xs-shrink">
        <p>
        **Ссылки**  
        [Скачать][releases]  
        [GitHub проекта][github]  
        [Сообщить о баге][issues]  
        [Настроить онлайн][codepen]
        </p>
    </div>
    <div class="col-xs-shrink">
        <p>
        **О проекте**  
        [Как bettertext.css делает текст лучше](#features)  
        [Из чего состоит bettertext.css](story)  
        [Демо-страница](testpage)
        </p>
    </div>
</div>

<a name="features" id="features"></a>

## Как bettertext.css делает текст лучше

Bettertext.css создан для того, чтобы решить типичные проблемы дефолтных стилей браузера, предотвратить распространенные баги и подготовить качественную основу для собственной типографики.

<div class="row" style="max-width: calc(50rem + 30px);">
    <div class="col-xs-12 col-sm-6">
        <p>
        **Соблюдаются классические пропорции и теория близости**  
        Размеры заголовков вычисляются по классическим печатным пропорциям из размера основного текста и вертикального ритма. Верхние и нижние отступы подобраны с учетом теории близости. Это визуально подчеркивает структуру страницы и облегчает ориентирование по разделам страницы.
        </p>
    </div>
    <div class="col-xs-12 col-sm-6">
        <p>
        **Адаптивные размеры для заголовков**  
        Чтобы заголовки аккуратно выглядели на маленьких экранах и не было проблем с длинными словами, в типографике предусмотрен отдельный набор размеров для экранов меньше 768px.
        </p>
    </div>
    <div class="col-xs-12 col-sm-6">
        <p>
        **Правильное обтекание картинок и списков**  
        Вёрстка содержит исправления для типичных багов обтекания текстом: никаких разрывов текста из-за длинных слов, а буллиты списков не налезут на картинку. Умные отступы предотвратят проблемы с многоколоночным текстом.
        </p>
    </div>
    <div class="col-xs-12 col-sm-6">
        <p>
        **Не содержит классов и не мешает стилям шаблона**  
        CSS написан так, чтобы верстальщику не приходилось ничего обнулять и переопределять в коде шаблона. Стили для структурных тегов section, article, figure, а также для списков ul, ol и таблиц применяются только когда на тегах нет классов.
        </p>
    </div>
</div>

<a name="install" id="install"></a>

## Установить и подключить

Подключается после normalize.css и веб-шрифтов. Скомпилированная версия не нуждается в настройке и весит всего 4 kb.

**Подключить через CDN**
```bash
https://unpkg.com/bettertext.css@latest/bettertext.css
https://unpkg.com/bettertext.css@latest/bettertext.min.css
https://unpkg.com/bettertext.css@latest/bettertext.min.css.map
```

**Установить через NPM**
```bash
npm install bettertext.css --save-dev
```

**Установить через Bower**
```bash
bower install bettertext.css --save
```

## Настроить под свой дизайн

Bettertext.css написан на LESS и настраивается при помощи 11 переменных. Остальные 40 вычисляются по формулам, но их тоже можно переопределить.

Если вы не используете LESS, [настройте типографику онлайн][codepen] и пользуйтесь скомпилированной версией:

* настройте переменные по вашему вкусу;
* протестируйте на вашем HTML или Markdown коде;
* нажмите "View Compiled" и заберите скомпилированный CSS.

<a name="settings" id="settings"></a>

## Подключить и настроить LESS-версию

Подключите bettertext.less к стилям вашего проекта.

```less
@import (less) "node_modules/bettertext.css/bettertext.less";
```

<a name="defaults" id="defaults"></a>

### Парамерты по-умолчанию

У компонента есть глобальный миксин с настройками:

```less
.bettertext-settings() {

    //settings
    @fz: 16px;                         // default font-size in px
    @fz-small: 0.8em;                  // smaller font-size (em)
    @rythm: 24px;                      // vertical rythm = line-height in pixels
    @linel: 50rem;                     // max-width for text (em or rem)
    @font-body: sans-serif;            // body
    @font-headers: sans-serif;         // headers
    @font-code: monospace, monospace;  // code (duplication is intentional)
    @scale1: 1.125;                    // header size multiplier for small screens
    @scale2: 1.250;                    // header size multiplier for large screens
    @section-pad: 5vw;                 // padding for article and section

    @bettertext-breakpoint: ~"(min-width: 768px)";

    //calculations
    // ...
}
```

<a name="customization" id="customization"></a>

### Собственные настройки

Вы можете настроить типографику через переменные. Например, поменять размер шрифта основного текста, шрифты:

```less
@import (less) "node_modules/bettertext.css/bettertext.less";

.bettertext-settings() {

    //settings
    @fz: 14px;                          // default font-size
    @font-body: 'Arial', sans-serif;    // body
    @font-headers: 'Georgia', serif;    // headers

    @bettertext-breakpoint: ~"(min-width: 50em)"; // large screens starts from that value

}
```

Если базовых настроек не достаточно, вы можете переопределить любую формулу из раздела *calculations* внутри миксина `bettertext-settings` (см. [исходный код][source]).
Например, поменять верхний отступ у заголовков (можно использовать готовые значения и формулы):

```less
@import (less) "node_modules/bettertext.css/bettertext.less";

.bettertext-settings() {

    //settings
    @fz: 14px;                          // default font-size
    @font-body: 'Arial', sans-serif;    // body
    @font-headers: 'Georgia', serif;    // headers

    @bettertext-breakpoint: ~"(min-width: 50em)"; // large screens starts from that value

    //redefining header margin-top
    @h1-mt: 3em;
    @h2-mt: 2.5em;
    @h3-mt: 2em;
    @h4-mt: 1.5em;
    @h5-mt: unit((2 * @lh * @fz / @h5-fz), em);
    @h6-mt: unit((2 * @lh * @fz / @h6-fz), em);
}
```

---

<small>Автор [Павел Радьков](http://paulradzkov.com), MIT License</small>

<p class="likely">
    <span class="facebook">Поделиться</span>
    <span class="twitter">Твитнуть</span>
    <span class="gplus">Плюсануть</span>
    <span class="vkontakte">Поделиться</span>
    <span class="telegram">Отправить</span>
</p>



[github]: https://github.com/paulradzkov/bettertext.css
[releases]: https://github.com/paulradzkov/bettertext.css/releases
[issues]: https://github.com/paulradzkov/bettertext.css/issues
[codepen]: http://codepen.io/paulradzkov/pen/Mygdrb
[source]: https://github.com/paulradzkov/bettertext.css/blob/master/bettertext.less
