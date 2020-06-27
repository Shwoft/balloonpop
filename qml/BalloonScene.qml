import Felgo 3.0
import QtQuick 2.0
import "entities"

SceneBase {
    id: balloonScene
    // provide the pop sound public for the balloons
    property alias popSound: popSound
    // number of balloons currently on the scene
    property int balloons: 0

    // duration of the game in seconds
    property int time : 20
    // indicates if game is running
    property bool gameRunning: false

    // position the scene on the top edge
    sceneAlignmentY: "top"

    // used to create balloons at runtime
    EntityManager {
        id: entityManager
        entityContainer: balloonScene
    }

    // make the balloons float up gently by using a low gravity
    PhysicsWorld {
        gravity.y: -1;
        debugDrawVisible: false
    }

    // background image
    Image {source:"../assets/img/clouds.png"; anchors.fill:gameWindowAnchorItem}

    // background music
    BackgroundMusic {source:"../assets/snd/music.mp3"}

    // the pop sound used by balloon entities
    // make it available to them with the id popSound
    SoundEffect {id:popSound; source:"../assets/snd/balloonPop.wav"}

    // left wall
    Wall {height:gameWindowAnchorItem.height+50; anchors.right:gameWindowAnchorItem.left}
    // right wall
    Wall {height:gameWindowAnchorItem.height+50; anchors.left:gameWindowAnchorItem.right}
    // ceiling
    Wall {width:gameWindowAnchorItem.width; anchors { bottom:gameWindowAnchorItem.top; left: gameWindowAnchorItem.left} }

    // HUD
    Row {
        // position the HUD at the bottom of the game window
        anchors.bottom: gameWindowAnchorItem.bottom
        // make sure the HUD is always on top
        z: 2
        // info text area
        Text {id:infoText; width:200; height:40; text:"Loading balloons..."}
        // display remaining time
        Text {id:timeText; height:40; text:"Time: "+balloonScene.time}
    }

    // starts the game
    function start() {
        spawnBalloons.start()
    }

    // clear all baloons and reset properties to start values
    function reset() {
        entityManager.removeEntitiesByFilter(["balloon"])
        balloons = 0
        time = 20
        infoText.text = "Loading balloons..."
    }


    // create balloons with short intervals in between, creating a nice animation at the start
    Timer {
        id: spawnBalloons
        interval: 20 // milliseconds
        repeat: true
        onTriggered: {
            // after every 20ms we create a new balloon
            entityManager.createEntityFromUrl(Qt.resolvedUrl("entities/Balloon.qml"));
            balloons++
            // if the maximum number of balloons is reached, we stop the timer and therefore the balloon creation
            // then we start the game
            if(balloons===options.balloonsMax) {
                running = false
                gameRunning = true
                infoText.text = "Hurry!"
            }
        }
    }

    // game timer, default interval of Timer is 1 second
    Timer {
        id: gameTimer
        running: gameRunning // time only counts down if game is running
        repeat: true
        onTriggered: {
            if(balloons < options.balloonsMax) time--
            // if time is over, or each balloon is popped, we stop the game and give the player some feedback about his success
            if(time === 0 || balloons === 0) {
                gameRunning = false
                if(balloons === 0)  infoText.text = "Perfect, take a cookie!"
                else if(balloons < options.balloonsMax/2) infoText.text = "Well, that was decent..."
                else infoText.text = "Not your day huh..."
                endMenu.start()
            }
        }
    }

    Timer {
        id: endMenu
        interval: 2000
        onTriggered: {
            gameWindow.state = "menu"
        }
    }


}
