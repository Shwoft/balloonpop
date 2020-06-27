import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Felgo 3.0
import "entities"


SceneBase {

    // maximum number of balloons
    property int balloonsMax: 15

    id: options

    signal okPressed

    Image {
        source: "../assets/img/timg.jpg"
        anchors.fill: gameWindowAnchorItem
    }

    ColumnLayout {
        x:150
        y:50
        RadioButton {
            checked: true
            Text {
                x:40
                y:0
                text: "easy"
                color: "red"
                font.family: gameFont.name
                font.pixelSize: 30
            }
            onReleased: {
                options.balloonsMax = 8
            }
        }
        RadioButton {
            Text {
                x:40
                y:0
                text: "normal"
                color: "red"
                font.family: gameFont.name
                font.pixelSize: 30
            }
            onReleased: {
                checked: true
                options.balloonsMax = 15
            }
        }
        RadioButton {
            Text {
                x:40
                y:0
                text: "hard"
                color: "red"
                font.family: gameFont.name
                font.pixelSize: 30
            }
            onReleased: {
                checked: true
                options.balloonsMax = 25
            }
        }
    }

    MenuButton {
        id: ok
        anchors.bottom: gameWindowAnchorItem.bottom
        anchors.horizontalCenter: gameWindowAnchorItem.horizontalCenter
        width: 150
        height: 40
        radius: width/2

        Image {
            anchors.fill: parent
            source: "../assets/img/5.png"
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                ok.opacity = 0.5
            }
            onReleased: {
                ok.opacity = 1
                okPressed()
            }
        }
    }
}
