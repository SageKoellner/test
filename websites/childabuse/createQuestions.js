// <!-- Question Start -->
// <div class="question"> 
//     <h2 class="questionText"></h2>
//     <div class="choices">
//         <div class="choice" value="0">
//             <p>Never</p>
//         </div>
//         <div class="choice" value="1">
//             <p>Rarely</p>
//         </div>
//         <div class="choice" value="2">
//             <p>Sometimes</p>
//         </div>
//         <div class="choice" value="3">
//             <p>Often</p>
//         </div>
//         <div class="choice" value="4">
//             <p>Almost Always</p>
//         </div>
//     </div>
// </div> 
// <!-- Question End -->
// <div class="space">
//     <br>
//     <hr> <!-- Line -->
//     <br>
// </div>

// var location = `x${x}y${y}`;
// eval(`var ${location} = document.createElement("div");`);
// eval(`${location}.className = "displayCell";`);
// eval(`${location}.id = "${location}";`);
// eval(`document.getElementById("display").appendChild(${location});`);

// class Polygon {
//     constructor() {
//       this.name = 'Polygon';
//     }
//   }
//   const poly1 = new Polygon();
//   console.log(poly1.name);
//   // expected output: "Polygon"
  
class question {
    constructor(section, name, questionText, choiceArray, commentText, refrenceLink) {
        
        this.section = section;
        this.name = name;
        this.question = questionText;
        this.choices = choiceArray;
        this.comment = commentText;
        this.refrence = refrenceLink;
    }
}

var Quiz = [
    new question(
        "Physical",
        "Intimidation",
        "Have you felt as if your care givers have actively tried to Intimidate you? including but not limited to: standing over you, forcing you to look up at them, or getting in your face and refusing to back off?",
        [ "Never", "Rarely", "Sometimes", "Often", "Nearly Everyday" ],
        "Intimidation Bullying by standing over, looking down, or getting in your face and refusing to back off.",
        "https://psychcentral.com/pro/exhausted-woman/2016/12/7-types-of-parental-abuse#1"
    ),
    new question(

    )
]

function start(setUp){

}

function format(){

}

function title(text){

}

function answers(textArray){

}