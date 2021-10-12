function main() {
    var colours = [document.getElementById("colourOne"), document.getElementById("colourTwo"), document.getElementById("colourThree"), document.getElementById("colourFour"), document.getElementById("colourFive"), document.getElementById("colourSix"), document.getElementById("colourSeven"), document.getElementById("colourEight"), document.getElementById("colourNine"), document.getElementById("colourTen")];
    var flagSelect = document.getElementById("flagSelect").value;
    switch (flagSelect) {
        case "rainbowFlag":
            colours[0].style = "background-color: red; height: 100px;";
            colours[1].style = "background-color: orange; height: 100px;";
            colours[2].style = "background-color: yellow; height: 100px;";
            colours[3].style = "background-color: green; height: 100px;";
            colours[4].style = "background-color: blue; height: 100px;";
            colours[5].style = "background-color: purple; height: 100px;";
            break;
        case "progressFlag":
            colourOne.style = "background-color: red; height: 100px;";
            break;
    }
}
