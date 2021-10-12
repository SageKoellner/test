

var map = [["W1S","W1S","W1S","W1S","W1S","P1E","W1S","W1S","W1S","W1S"],
           ["W1S","G1E","G1E","G1E","G1E","P1E","P1E","G1E","G1E","W1S"],
           ["W1S","G1E","G1E","P1E","P1E","P1E","P1E","G1E","G1E","W1S"],
           ["W1S","G1E","P1E","G1E","G1E","P1E","W1S","G1E","G1E","W1S"],
           ["W1S","G1E","P1E","G1E","W1S","W1S","W1S","G1E","G1E","W1S"],
           ["W1S","G1E","P1E","G1E","G1E","G1E","W1S","G1E","G1E","W1S"],
           ["W1S","G1E","G1E","P1E","G1E","G1E","W1S","G1E","G1E","W1S"],
           ["W1S","G1E","G1E","P1E","P1E","P1E","P1E","G1E","G1E","W1S"],
           ["W1S","G1E","G1E","P1E","P1E","P1E","P1E","G1E","G1E","W1S"],
           ["W1S","G1E","G1E","G1E","G1E","G1E","G1E","G1E","G1E","W1S"],
           ["W1S","W1S","W1S","W1S","W1S","W1S","W1S","W1S","W1S","W1S"]];

var posX = 1;
var posY = 1;
map[posY][posX] = `${map[posY][posX]}X${posX}Y${posY}`;

var displayMinX, displayMaxX, displayMinY, displayMaxY;

function main(){
    while ( true ) {
        var displayMinX = posX - 4;
        var displayMaxX = posX + 4;

        var displayMinY = posY - 4;
        var displayMaxY = posY + 5;

        for (let y = displayMinY; y < displayMaxY; y++){
            for (let x = displayMinX; x < displayMaxX; x++){
                if ( y >= 0 && y <= map.length() && x >= 0 && x <= map[y].length()){
                    var tile = map[y][x][0] + map[y][x][1];
                    switch ( tile ) {
                        case "W1":
                            document.getElementById(`x0y0`).style.backgroundColor = "blue";
                            break;
                        case "G1":
                            document.getElementById(`x1y0`).style.backgroundColor = "white";
                            break;
                        case "P1":
                            document.getElementById(`x2y0`).style.backgroundColor = "brown";
                            break;
                    }
                } else {
                    console.log(x + "," + y);
                    document.getElementById(`x3y0`).style.backgroundColor = "green";
                }
            }
        }
    }
}

main();