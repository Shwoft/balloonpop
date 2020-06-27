import Felgo 3.0
import QtQuick 2.0

GameWindow {
    id: gameWindow

    StartScene {
        id:startScene
        opacity: 0
        onStartPressed:
        {
            gameWindow.state = "game"
            balloonScene.start()
        }
        onOptionPressed: gameWindow.state = "option"
    }

    // custom font loading of ttf fonts
    FontLoader {
      id: gameFont
      source: "../assets/fonts/akaDylan Plain.ttf"
    }

    // our scene that contains the game
    BalloonScene {
        id: balloonScene
        opacity: 0
    }


    state: "start"


    MenuScene {
        id: menuScene
        opacity: 0
        onReplayPressed:
        {
            gameWindow.state = "game"
            balloonScene.start()
        }
        onReturnPressed: gameWindow.state = "start"

    }

    Options {
        id: options
        opacity: 0
        onOkPressed: gameWindow.state = "start"

    }

    states: [
        State {
            name: "start"
            PropertyChanges {
                target: startScene
                opacity: 1
            }
        },
        State {
            name: "game"
            PropertyChanges {
                target: balloonScene
                opacity: 1
            }
        },
        State {
            name: "menu"
            PropertyChanges {
                target: menuScene
                opacity: 1
            }
        },
        State {
            name: "option"
            PropertyChanges {
                target: options
                opacity: 1
            }
        }


    ]
}
