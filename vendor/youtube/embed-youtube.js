/* Light YouTube Embeds by @labnol */
/* Web: http://labnol.org/?p=27941 */

document.addEventListener("DOMContentLoaded",
    function() {
        var div, n,
            v = document.getElementsByClassName("youtube-player");
        var play = document.getElementsByClassName("youtube-player-play");
        for (n = 0; n < v.length; n++) {
            div = document.createElement("div");
            div.setAttribute("data-id", v[n].dataset.id);
            div.setAttribute("id", "youtube-player-"+v[n].dataset.id);
            v[n].onclick = labnolIframe;
            v[n].appendChild(div);
        }
        for (n = 0; n < play.length; n++) {
            play[n].addEventListener( 'click', stopDefAction, false );
        }
    });

function stopDefAction(evt) {
        evt.preventDefault();
    }

function labnolIframe() {
    var iframe = document.createElement("iframe");
    var embed = "https://www.youtube.com/embed/ID?autoplay=1&amp;showinfo=0&amp;rel=0&amp;loop=1";
    var placeholder = document.getElementById("youtube-player-"+this.dataset.id);
    iframe.setAttribute("src", embed.replace("ID", this.dataset.id));
    iframe.setAttribute("frameborder", "0");
    iframe.setAttribute("allowfullscreen", "1");
    placeholder.parentNode.replaceChild(iframe, placeholder);
}
