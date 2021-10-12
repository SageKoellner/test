function loadCells(){
    for (let y = 0; y < 9; y++) {
        for (let x = 0; x < 10; x++) {
            var location = `x${x}y${y}`;
            eval(`var ${location} = document.createElement("div");`);
            eval(`${location}.className = "displayCell";`);
            eval(`${location}.id = "${location}";`);
            eval(`document.getElementById("display").appendChild(${location});`);
        }   
    }
}

loadCells();