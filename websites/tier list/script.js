var clicked = "item1";
var fileNumber = 1;
var mouseDown = 0;

var item = document.getElementById(clicked);
window.addEventListener('load', function() {
    document.querySelector('input[type="file"]').addEventListener('change', function() {
        var inp = document.getElementById("get-files");
        
        while ( fileNumber < inp.files.length ) {
            eval(`var file${fileNumber} = document.createElement("div");
            file${fileNumber}.className = "item";
            file${fileNumber}.id = "item${fileNumber}";
            document.getElementById("itemList").appendChild(file${fileNumber});
            file${fileNumber}.style.cssText = 'background-image: URL("${URL.createObjectURL(this.files[fileNumber])}");';
            file${fileNumber}.onmousedown = function() { 
                mouseDown = 1  ? 1 : 0; 
                clicked = "item${fileNumber}";
                item = document.getElementById(clicked);
            }
            `);
            fileNumber++
        }
    });
});

document.getElementById("item0").onmousedown = function() { 
    mouseDown = 1  ? 1 : 0; 
    item = document.getElementById("item0");
}

var rank = ["S","A","B","C","D","F"];
for ( var n = 0; n < rank.length; n++ ) {
    eval(`var ${rank[n]}Tier = document.getElementById("${rank[n]}TierItems");
    ${rank[n]}Tier.onmouseup = function() { 
        if (mouseDown && (item.parentNode != ${rank[n]}Tier)) {
            ${rank[n]}Tier.appendChild(item);
            mouseDown = 0;
        };
    };`);
};