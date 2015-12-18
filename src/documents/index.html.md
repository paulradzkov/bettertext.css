---
title: BetterText.css
layout: default
---

# Типографика BetterText.css

## 1. Основной текст

Создание типографики начинается с подбора стилей для основного текста. Первым делом, создайте несколько абзацев текста, подберите для них шрифт, размер шрифта и межстрочное расстояние.

На основе размера шрифта и интерлиньяжа вычисляется осовная константа типографики — **шаг вертикального ритма**.

Для основного текста я взял кроссплатформенный Arial размером 16px и line-height: 1.5, чтобы высота строки для удобства расчетов равнялась целому числу пикселей — 24px.

css:

```css
body {
  font-family: "Open Sans", Arial, serif;
  font-size: 16px;
  line-height: 1.5;
}
```

↓

less:

```less
@fz: 16px;
@rythm: 24px;
@font1: "Open Sans", Arial, serif;

body {
  font-family: @font1;
  font-size: @fz;
  line-height: unit(@rythm / @fz);
}
```

Уделите особое внимание основному тексту, так как такого текста больше всего на информационном сайте.

Главный критерий — текст должен легко читаться. Для этого он должен быть достаточно крупным.

Выбирайте размер от 14px до 25px. Если текста будет много, шрифт рекомендуется выбирать не меньше 16px.

Высота строки из диапазона 1.2–1.8.
Меньше 1.4, чтобы блоки текста создавали плотные контрастные прямоугольники. Больше 1.6, чтобы добиться визуальной легкости.

## 2. Абзацы

Основной текст обычно состоит из абзацев. Выберем расстояние между абзацами равное вертикальному ритму.

Оставим только нижний отступ — это избавит нас от таких проблем, как неровный верхний края при использовании многоколоночного текста, от ненужного верхнего отступа у первого абзаца внутри li элемента.

Рекомендуемая максимальная длина строки текста должна быть в пределах 60–90 символов.

Слишком длинные строки утомительно читать, потому что глазу тяжелее находить начало строки.

css:

```css
p {
  margin: 0 0 1.5em;
  max-width: 40em;
}
```

↓

less:

```less
@linel: 40em;

p {
  margin: 0 0 unit(@rythm / @fz, em);
  max-width: @linel;
}
```

## 3. Обтекание картинок

Первоисточник: https://css-tricks.com/minimum-paragraph-widths/

Когда текст обтекает картинки, может случиться ситуация, при которой длинные слова не помещаются в оставшееся для текста простанство и переносятся под картинку, создавая неприятный разрыв.

![](https://css-tricks.com/wp-content/uploads/2012/03/TheProblem.png)

Зададим параграфу псевдо-элемент с минимальной шириной. Если оставшееся свободное место меньше этой минимальной ширины, псевдо-элемент вытолкнет абзац под картинку.

![](https://css-tricks.com/wp-content/uploads/2012/03/PseudoElement.png)

Применим этот трюк к абзацам и спискам. Но так как списки могут использоваться в навигации и других местах, выбирать будем только списки, у которых нет класса.

Пусть минимальная ширина псевдоэлемента равна 10em. Псевдо-элемент не занимает вертикального пространства.

```css
p:before,
ol:not([class]):before,
ul:not([class]):before {
    content: '';
    display: block;
    width: 10em;
    overflow: hidden;
}

li p:before {
    content: none;
}
```

## 4. Заголовки. Размер

Заголовки должны обладать контрастом по отношению к основному тексту, тогда читатель беглым взглядом без труда сможет определить иерархию документа по заголовкам. Создать контраст можно при помощи шрифта, размера текста, отступов и цвета.

Для информационных сайтов обычно хватает четырех типов заголовка h1 .. h4. Заголовки h5 и h6 почти не используются. Поэтому для h1 .. h4 создадим контраст при помощи размера, а h5 и h6 оставим на потом.

Размер заголовков в классической типографике принято выбирать в соответствии с каким-либо законом. Например, увеличивать размер шрифта в X раз с каждым шагом.

Сайты, на которых можно подобрать размеры шрифта по классическим типографским пропорциям:

* [http://type-scale.com/]()
* [http://www.modularscale.com/]()
* [http://www.gridlover.net/app/]()

Для адаптивной типографики нам понадобится как минимум два набора размеров заголовков. Для больших экранов самый крупный заголовок может быть больше основного текста в 3-4 раза. Для маленьких экранов это соотношение рекомендуется делать не больше 2х. Иначе на маленьких экранах мобильных устройств, где длина строки составляет 30-40 символов, заголовки будут занимать слишком много строк, отъедая ценное вертикальное пространство, могут появиться проблемы с переносами длинных слов.

<figure>
![](http://typecast.com/images/uploads/modernscale-one-scale.jpg)

<figcaption>Иллюстрация с  сайта http://typecast.com/blog/a-more-modern-scale-for-web-typography</figcaption>
</figure>

Поэтому для малых экранов выберем соотношение 1.125

<figure>
    ![1.125 - Major Second](http://joxi.ru/L21JXNMIxVeBAX.jpg)
    <figcaption>1.125 - Major Second</figcaption>
</figure>

А для экранов больше 768px шириной выберем контраст повыше — 1.250

<figure>
    ![1.250 - Major Third](http://joxi.ru/MAjebgWHOZz52e.jpg)
    <figcaption>1.250 - Major Third</figcaption>
</figure>

Значение 768px выбрано потому, что с этой ширины экрана начинаются типичные планшеты (iPad в портретной ориентации).

less:

```less
@scale1: 1.125;
@scale2: 1.250;
@breakpoint: ~"(min-width: 768px)";

  h1 { font-size: round(@fz * pow(@scale1, 4)); }
  h2 { font-size: round(@fz * pow(@scale1, 3)); }
  h3 { font-size: round(@fz * pow(@scale1, 2)); }
  h4 { font-size: round(@fz * @scale1); }

@media @breakpoint {
  h1 { font-size: round(@fz * pow(@scale2, 4)); }
  h2 { font-size: round(@fz * pow(@scale2, 3)); }
  h3 { font-size: round(@fz * pow(@scale2, 2)); }
  h4 { font-size: round(@fz * @scale1); }
}
```

Получим:

> # Header 1
> ## Header 2
> ### Header 3
> #### Header 4
>
> Paragraph text

## 4. Заголовки. Межстрочное расстояние

Чем крупнее шрифт, тем меньшая высота строки должна быть у заголовков. Подберем высоту строк так, чтобы межстрочный просвет был оптически равным у абзацев и заголовков всех уровней.

```css
h1 { line-height: 1.1; }
h2 { line-height: 1.2; }
h3 { line-height: 1.3; }
h4 { line-height: 1.4; }
```

## 4. Заголовки. Отступы

Нельзя оставлять у заголовков одинаковые отступы сверху и снизу: заголовок зависнет между последним абзацем предыдущего раздела и первым абзацем своего раздела на одинаковом расстоянии. По теории близости заголовок должен быть ближе к тексту, идущему за ним. Это создает дополнительную оптическую связь.

Пусть нижний отступ у всех заголовков будет равен отступу между абзацами. Тогда сохранится ритм, а заголовок и текст будут визуально составлять единое целое.

Верхний отступ должен быть больше, чем нижний. Чем выше уровень заголовка, тем больше отступ. У h1 верхний отступ больше, чем у h4. Это создаст дополнительную визуальную иерархию в структуре контента.

```less
//calculations for small screens
@fzh1: round(@fz * pow(@scale1, 4));
@fzh2: round(@fz * pow(@scale1, 3));
@fzh3: round(@fz * pow(@scale1, 2));
@fzh4: round(@fz * pow(@scale1, 1));

h1 {
  font-size: @fzh1;
  line-height: 1.1;
  margin-top: 4em;
  margin-bottom: unit( @lh * @fz / @fzh1, em);
}

h2 {
  font-size: @fzh2;
  line-height: 1.2;
  margin-top: 3.5em;
  margin-bottom: unit( @lh * @fz / @fzh2, em);
}

h3 {
  font-size: @fzh3;
  line-height: 1.3;
  margin-top: 3em;
  margin-bottom: unit( @lh * @fz / @fzh3, em);
}

h4 {
  font-size: @fzh4;
  line-height: 1.4;
  margin-top: 2.5em;
  margin-bottom: unit( @lh * @fz / @fzh4, em);
}

//calculations for large screens
@fzh1-l: round(@fz * pow(@scale2, 4));
@fzh2-l: round(@fz * pow(@scale2, 3));
@fzh3-l: round(@fz * pow(@scale2, 2));
@fzh4-l: round(@fz * pow(@scale2, 1));

@media @breakpoint {
  h1 {
    font-size: @fzh1-l;
    margin-bottom: unit( @lh * @fz / @fzh1-l, em);
  }

  h2 {
    font-size: @fzh2-l;
    margin-bottom: unit( @lh * @fz / @fzh2-l, em);
  }

  h3 {
    font-size: @fzh3-l;
    margin-bottom: unit( @lh * @fz / @fzh3-l, em);
  }

  h4 {
    font-size: @fzh4-l;
    margin-bottom: unit( @lh * @fz / @fzh4-l, em);
  }
}
```

При этом, если заголовок любого уровня является первым ребенком какого-либо контейнера (:first-child), верхний отступ заголовка должен быть обнулен. Отступ от верхней границы контейнера должен задаваться паддингом этого контейнера, а не маргином элемента внутри контейнера. Это позволяет избежать многих проблем, как, например, в случае с верхним отступом абзаца и многоколоночным текстом.

```css
h1:first-child,
h2:first-child,
h3:first-child,
h4:first-child,
h5:first-child,
h6:first-child {
  margin-top: 0;
}
```

Если после заголовка идет подзаголовок, а не абзац текста, то большой отступ между заголовками не нужен. В семантически правильном документе после заголовка h1 не может идти сразу h3, поэтому перечислим все правильные варианты для h2, h3 и h4 (потому что им мы задавали увеличенный верхний отступ).

```css
/* double headers */
h1 + h2 { margin-top: 1.2em; }
h2 + h3 { margin-top: 1.3em; }
h3 + h4 { margin-top: 1.4em; }
```

Теперь вернемся к оформлению заголовков h5 и h6. H5 пусть выглядит как жирный основной текст.
H6 — уменьшенный размер шрифта, все буквы заглавные и немного разрежены. У обоих заголовков нижний отступ, как у абзаца, равен вертикальному ритму. А верхний отступ равен двойному вертикальному ритму.

```less
@fzh5: @fz;
@fzh6: round(@fz * 0.8);

h5 {
  font-size: @fzh5;
  margin: unit( 2 * @lh * @fz / @fzh5, em) 0 unit( @lh * @fz / @fzh5, em);
}

h6 {
  font-size: @fzh6;
  margin: unit( 2 * @lh * @fz / @fzh6, em) 0 unit( @lh * @fz / @fzh6, em);
  text-transform: uppercase;
  letter-spacing: 0.01em;
}
```

> # Съешь ещё этих мягких французских булок да выпей чаю
>
> ## Съешь ещё этих мягких французских булок да выпей чаю
>
> ### Съешь ещё этих мягких французских булок да выпей чаю
>
> #### Съешь ещё этих мягких французских булок да выпей чаю
>
> ##### Широкая электрификация южных губерний даст мощный толчок подъёму сельского хозяйства
>
> ###### Широкая электрификация южных губерний даст мощный толчок подъёму сельского хозяйства
>
> Параграф текста.

## 5. Списки

Спискам, как и абзацам, зададим максимальную ширину и отступ снизу, равный вертикальному ритму.

```less
ul:not([class]),
ol:not([class]) {
  margin: 0 0 unit(@lh, em);
  max-width: @linel;
}
```



![Проблема: если картинка обтекает список, то маркеры списка налазят на картинку](http://paulradzkov.com/2013/lists_and_floats//floated_images_and_lists_problem.png)

<figcaption>Проблема: если картинка обтекает список, то маркеры списка налазят на картинку</figcaption>

Чтобы починить это, потребуется внести пару небольших изменений в стили списков: перенести дефолтный отступ в 2.5em с левой границы списка на правую, а сами элементы списка сдвинуть транфсформом вправо на те же 2.5em.

```less
ul:not([class]),
ol:not([class]) {
    margin: 0 0 unit(@lh, em);
    max-width: calc(@linel - 2.5em);
    padding-left: 0;

    ul,
    ol {
        margin-bottom: 0;
    }

    li {
        margin-right: 2.5em;
        transform: translateX(2.5em);
    }
}

```

Теперь буллиты не налазят на картинку:

<p style="float:left;" ><img src="http://placehold.it/200x300" ></p>

- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo magnam natus saepe, maxime nam sed sunt veritatis atque repellendus.

- ##### Small header

    Tenetur molestiae, voluptates eius in beatae! Velit veniam magni, deserunt impedit.
- Lorem ipsum dolor sit amet, consectetur adipisicing elit.

    Fuga et optio iure tempore, nulla perspiciatis sint, dolorem porro illum odio, accusamus, suscipit debitis voluptas? Dolores accusantium neque, tempore atque ducimus.
- Lorem ipsum dolor sit amet, consectetur adipisicing elit.

<hr style="clear:both" >

Протестируем вложенные списки:

1. Lorem ipsum dolor sit amet
2. Tenetur molestiae
    1. Coffee
    2. Milk
    3. Tea
        1. green
        2. black
        3. white
3. Fuga et optio iure tempore
4. Dolores accusantium neque
5. ipsum
6. dolor
7. sit amet
8. Nemo magnam natus saepe
9. maxime nam sed sunt
10. Veritatis atque repellendus
11. Voluptates eius in beatae!

...

<ol start="98">
    <li>Magnam natus</li>
    <li>Maxime nam sed</li>
    <li>Atque repellendus</li>
</ol>

- Lorem ipsum dolor sit amet
    - Tenetur molestiae
    - Fuga et optio iure tempore
    - Dolores accusantium neque
        - ipsum
        - dolor
        - sit amet
- Nemo magnam natus saepe
- maxime nam sed sunt veritatis atque repellendus



## 6. Картинки

<figure>
    <img src="http://placehold.it/1000x400" alt="">
</figure>

Картинки с подписью

<figure>
    <img src="http://placehold.it/1000x400" alt="">
    <figcaption>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio quo dolor aut aliquam officiis accusantium voluptates facilis magnam, excepturi velit suscipit. Provident, ex, quam. Fugit non maxime et minima commodi.
    </figcaption>
</figure>

<figure>
    <img src="http://placehold.it/1000x400" alt="">
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio quo dolor aut aliquam officiis accusantium voluptates facilis magnam, excepturi velit suscipit.</p>
    <p>Tenetur molestiae, voluptates eius in beatae!</p>
</figure>

<figure>
    <img src="http://placehold.it/1000x400" alt="">
    <figcaption>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio quo dolor aut aliquam officiis accusantium voluptates facilis magnam, excepturi velit suscipit.</p>
        <p>Tenetur molestiae, voluptates eius in beatae!</p>
    </figcaption>
</figure>

## 7. Таблицы

Пример простой таблицы:

<table>
    <caption>Optional table caption.</caption>
    <thead>
        <tr>
            <th>#</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Username</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">1</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
        </tr>
        <tr>
            <th scope="row">2</th>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        <tr>
            <th scope="row">3</th>
            <td>Larry</td>
            <td>the Bird</td>
            <td>@twitter</td>
        </tr>
    </tbody>
</table>

Пример таблицы, сгенерированной из Маркдауна:


|                                    | Express*| Personal PLUS | Personal MAX |  Family  |
|------------------------------------|--------:|--------------:|-------------:|---------:|
| **Main Features**                  |         |               |              |          |
| Annual Load Limit                  |   £ 300 |       £ 1,900 |     £ 12,000 | £ 12,000 |
| Maximum card balance               |   £ 300 |       £ 1,900 |      £ 5,000 |  £ 5,000 |
| Reloadable                         |         |             ✔ |            ✔ |        ✔ |
| Available at Store                 |       ✔ |             ✔ |            ✔ |        ✔ |
| Available online                   |       ✘ |             ✔ |            ✔ |        ✔ |
| UK ATM Access                      |       ✘ |             ✔ |            ✔ |        ✔ |
| International ATM Access           |       ✘ |             ✘ |            ✔ |        ✔ |
| Money share                        |       ✘ |             ✘ |            ✔ |        ✔ |
| Shop anywhere                      |       ✔ |             ✔ |            ✔ |        ✔ |
| Receive free International minutes |       ✘ |             ✔ |            ✔ |        ✔ |
| Direct UK bank account loads       |       ✘ |             ✔ |            ✔ |        ✔ |
| **Pricing**                        |         |               |              |          |
| NO transaction fee                 |       ✔ |             ✔ |            ✔ |        ✔ |
| Additional card                    |     n/a |           n/a |       £ 5.00 |   £ 5.00 |
| Card to card transfer              |     n/a |           n/a |       £ 1.00 |     FREE |
| International ATM access           |     n/a |           n/a |       £ 1.50 |     FREE |
| Foreign Exchange Charge            |  £ 1.95 |        £ 1.95 |       £ 1.95 |     FREE |
| In-Store Card Purchase fee         |  £ 6.95 |        £ 6.95 |       £ 6.95 |   £ 6.95 |
| Monthly Cost                       |  £ 3.95 |        £ 3.95 |       £ 3.95 |   £ 7.95 |
| Card to card transfer              |     n/a |           n/a |       £ 1.00 |     FREE |
| International ATM access           |     n/a |           n/a |       £ 1.50 |     FREE |
| Foreign Exchange Charge            |  £ 1.95 |        £ 1.95 |       £ 1.95 |     FREE |
| In-Store Card Purchase fee         |  £ 6.95 |        £ 6.95 |       £ 6.95 |   £ 6.95 |
| Monthly Cost                       |  £ 3.95 |        £ 3.95 |       £ 3.95 |   £ 7.95 |



## 8. Цитаты

Помните, что даже если цитируется одно предложение, то оно должно быть внутри абзаца. Поэтому самый простой случай цитирования должен быть сверстан так:

```html
<blockquote>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
</blockquote>
```

Так как у цитат есть собственный `padding`, то последнему абзацу обнулим нижний отступ. Это сделает цитату симметричной по вертикали.

> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.

Цитата может быть большой, содержать внутри собственную логическую структуру, сопровождаться источником цитирования. Крупная цитата с форматированием внутри:

<blockquote>
  <h3>Header inside blockquote</h3>
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo magnam natus saepe, maxime nam sed sunt veritatis atque repellendus.</p>
  <ul>
    <li>Nemo magnam natus saepe</li>
    <li>maxime nam sed sunt</li>
    <li>Veritatis atque repellendus</li>
    <li>Voluptates eius in beatae!</li>
  </ul>
  <p>Tenetur molestiae, voluptates eius in beatae! Velit veniam magni, deserunt impedit.</p>
  <footer>Someone famous in <cite title="Source Title">Source Title</cite></footer>
</blockquote>

## 9. Списки определений

<dl>
    <dt>Description lists</dt>
    <dd>A description list is perfect for defining terms.</dd>
    <dt>Euismod</dt>
    <dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
    <dd>Donec id elit non mi porta gravida at eget metus.</dd>
    <dt>Malesuada porta</dt>
    <dd>Etiam porta sem malesuada magna mollis euismod.</dd>
</dl>

## 10. Код

## 11. Надстрочные и подстрочные символы
