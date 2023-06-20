window.onload = () => {
    detectColor();

}

var colorArray = ['pink', 'black', 'violet', 'orange', 'brown']

function detectColor() {
    var buttons = document.querySelectorAll('#container div');
    for (var i = 0; i < buttons.length; i++) {
        var button = buttons[i];
        button.addEventListener('mouseover', function() {
            changeColor(this.id);
        })
    }
}

function changeColor(element) {
    document.getElementById(element).style.backgroundColor = randonColor(colorArray)
}

function randonColor(colors) {
    var randon_col = colors[Math.floor(Math.random() * colors.length)]
    return randon_col
}