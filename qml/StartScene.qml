import Felgo 3.0
import QtQuick 2.0
import "entities"
import QtQuick.Layouts 1.3

SceneBase {
    id: startScene

    signal startPressed
    signal optionPressed


    Image {
        source: "../assets/img/start.jpg"
        anchors.fill: gameWindowAnchorItem
    }

    ColumnLayout {
        anchors.bottom: gameWindowAnchorItem.bottom
        anchors.horizontalCenter: gameWindowAnchorItem.horizontalCenter
        spacing: 5

        MenuButton {
            id: startplay

            width: 150
            height: 40
            color: "red"

            Image {
                anchors.fill: parent
                source: "../assets/img/1.png"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    startplay.opacity = 0.5
                }
                onReleased: {
                    startplay.opacity = 1
                    startPressed()
                }
            }
        }



        MenuButton{
            id: options
            anchors.horizontalCenter: gameWindowAnchorItem.horizontalCenter
            width: 150
            height: 40
            color: "red"

            Image {
                anchors.fill: parent
                source: "../assets/img/2.png"
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    options.opacity = 0.5
                }
                onReleased: {
                    options.opacity = 1
                    optionPressed()
                }
            }
        }

        MenuButton {
            id: quit
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: gameWindowAnchorItem.horizontalCenter
            width: 150
            height: 40
            color: "red"

            Image {
                anchors.fill: parent
                source: "../assets/img/3.png"

            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    quit.opacity = 0.5
                }
                onReleased: {
                    quit.opacity = 1
                    Qt.quit()
                }
            }
        }
    }




}
