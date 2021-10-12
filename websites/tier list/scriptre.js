var item;
var clicked;

var mouseDown = 0;
var fileNumber = 0;

var files = [];
var rank = ["S","A","B","C","D","F"];

var tierLetters = document.getElementsByClassName("tierItems");

window.addEventListener('load', function() {
    document.querySelector('input[type="file"]').addEventListener('change', function() {
        var inp = document.getElementById("get-files");

        for ( fileNumber; fileNumber < inp.files.length; fileNumber++ ){
            files.push("");
            files[fileNumber] = document.createElement("div");
            files[fileNumber].className = "item";
            document.getElementById("itemList").appendChild(files[fileNumber]);
            files[fileNumber].style.cssText = `background-image: URL(${URL.createObjectURL(this.files[fileNumber])}`;
            
            eval(`files[fileNumber].onmousedown = function () {
                mouseDown = 1  ? 1 : 0; 
                clicked = ${fileNumber};
                item = files[fileNumber];
                console.log(clicked);
            }`);
        }


        document.getElementById("STierItems").onmouseup = function () { move() }
        
    });
});




function move(num) {
    if ( mouseDown && item != null ) {
        rank[num].appendChild(item);
        mouseDown = 0;
    }
}
// manual thing ur tesrting with paraameeterrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr