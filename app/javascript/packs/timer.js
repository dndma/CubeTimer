import scrambleGenerator from "rubiks-cube-scramble";
import { ScrambleDisplay } from "scramble-display"

var timerOn = false
var time1
var s

document.addEventListener('keydown', event => {
    const time = new Date()
    let time2
    if (event.code === 'Space' && !timerOn) {
        writeSolve()
        time1 = time.getMinutes() + time.getSeconds() + "." + time.getMilliseconds()
        timerOn = true
        console.log('h1')
    } else if(event.code === 'Space' && timerOn) {
        console.log('h1')
        var delta
        time2 = time.getMinutes() + time.getSeconds() + "." + time.getMilliseconds()
        if ((time2 - time1) < 0) {
            delta = 60.0 - Math.abs(time2-time1)
        } else {
            delta = time2 - time1
        }
        changeTime(delta)
        timerOn = false
    }
})

function changeTime(time) {
    var ptime = document.getElementById('ptime')
    ptime.innerText = time.toString().slice(0,5)
}

function writeSolve() {
    var ptime = document.getElementById('ptime')
    ptime.innerText = 'Solve'
}

function rescramble() {
    const scramble = scrambleGenerator({ turns: 23 } )
    s = scramble
    var scrmb = document.getElementById('scramble')
    scrmb.innerText = scramble
}

function addVisualisation() {
    const vis = document.getElementById('visualisation')
    if (vis.childElementCount > 0) {
        vis.removeChild(vis.firstChild)
        return
    }
    const el = new ScrambleDisplay()
    el.event = '333'
    el.visualization = '2D'
    el.scramble = s;
    vis.appendChild(el);
}

window.onload = function() {
    rescramble()
    addVisualisation()
    addVisualisation()
}

window.onpageshow = function() {
    rescramble()
    addVisualisation()
    addVisualisation()
}
