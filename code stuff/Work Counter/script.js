function start(){
    // values
    var startHour = parseFloat(document.getElementById('startHour').value);
    var startMin = parseFloat(document.getElementById('startMin').value);
    var endHour = parseFloat(document.getElementById('endHour').value);
    var endMin = parseFloat(document.getElementById('endMin').value);
    var hourRate = document.getElementById('hourRate').value;

    // times
    var startTime = startHour + startMin;
    var endTime = endHour + endMin;
    var totalTime = endTime - startTime;

    console.log(startTime, endTime, totalTime)

    // daily
    var daily = Math.round((totalTime * hourRate) * 100) / 100;

    // saturday and sunday
    var weekEnd = Math.round((2 * (totalTime * hourRate)) * 100) / 100;
    
    // work week 
    var weekly = Math.round((5 * (totalTime * hourRate)) * 100) / 100;
    
    // biweekly (- weekends)
    var biweekly = Math.round((10 * (totalTime * hourRate))  * 100) / 100;
    
    if ( daily < 0 ){
        error = 'please be sure to check your times for am or pm';
        daily = error;
        weekEnd = error;
        weekly = error;
        biweekly = error;
    }else{
        daily = '$' + daily;
        weekEnd = '$' + weekEnd;
        weekly = '$' + weekly;
        biweekly = '$' + biweekly;
    }
    
    document.getElementById('daily').innerHTML = daily;
    document.getElementById('weekEnd').innerHTML = weekEnd;
    document.getElementById('weekly').innerHTML = weekly;
    document.getElementById('biweekly').innerHTML = biweekly;
}