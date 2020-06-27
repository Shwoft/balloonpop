import QtQuick 2.0
import Felgo 3.0
import QtQuick.Layouts 1.3
import "entities"


SceneBase {
    id: menuScene

    signal replayPressed
    signal returnPressed

    Image {
        source: "../assets/img/clouds.png"
        anchors.fill: gameWindowAnchorItem
    }



    ColumnLayout {
        anchors.verticalCenter: gameWindowAnchorItem.verticalCenter
        anchors.horizontalCenter: gameWindowAnchorItem.horizontalCenter
        spacing: 80

        MenuButton {
            id: playagain
            width: 150
            height: 40
            color: "red"
            focus: true

            Image{
                anchors.fill: parent
                source: "../assets/img/4.png"
            }

            MouseArea {
                anchors.fill: parent
                Keys.onPressed: {
                    balloonScene.reset()
                    replayPressed()
                }

                onPressed: {
                    playagain.opacity = 0.5
                }
                onReleased: {
                    playagain.opacity = 1
                    balloonScene.reset()
                    replayPressed()
                }
            }
        }



        MenuButton {
            id: returnMenu

            width: 150
            height: 40
            color: "red"

            Image {
                anchors.fill: parent
                source: "../assets/img/5.png"
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    returnMenu.opacity = 0.5
                }
                onReleased: {
                    returnMenu.opacity = 1
                    balloonScene.reset()//chongzhiyouxi
                    returnPressed()
                }
            }
        }
    }

}
