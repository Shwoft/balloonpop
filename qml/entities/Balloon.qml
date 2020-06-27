import QtQuick 2.12
import Felgo 3.0
import QtQuick.Particles 2.13

EntityBase {

    id: balloon
    entityType: "balloon"
    width: sprite.width
    height: sprite.height




    MultiResolutionImage {
        id: sprite
        source: "../../assets/img/balloon.png"
        opacity: 1
    }

    Timer {
        id: desalination
        interval: 10
        repeat: true
        onTriggered: {

            if(sprite.opacity > 0)
            {
                sprite.opacity -= 0.2
            }

        }

    }

    Timer {
        id: control
        interval: 50
        repeat: false
        onTriggered:
        {
            removeEntity()
        }
    }


    CircleCollider {

        radius: sprite.width/2 //qiuqiujiange,2biaoshiqiuqiukeyichongdieyige
        // restitution is bounciness, balloons are quite bouncy
        fixture.restitution: 0.8 //qiuqiupengjianqiangsududegaibian
    }

    MouseArea {
        anchors.fill: sprite
        onPressed: {

            desalination.start()
            sparkleParticle.start()

            // if you touch a balloon and the game is running, it will pop
            if(balloonScene.gameRunning) {
                balloonScene.balloons--       //qiqiujisuanqi
                popSound.play()
                control.start()
            }
        }

    }

    Particle  {
        id: sparkleParticle
        width: parent.width*2
        height: parent.height*2
        x: 10
        y: 10
        fileName: "../../qml/particles/Sparkle.json"

    }

    // gives the albloon a random position when created
    Component.onCompleted: {  //shezhijiazaiqiqiuweizhi
        x = utils.generateRandomValueBetween(0,balloonScene.width-sprite.width)
        y = balloonScene.height
    }
}
