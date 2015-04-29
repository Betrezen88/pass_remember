import QtQuick 2.4

Item {
    id: main

    property string textMessage

    signal accept()
    signal cancel()

    Rectangle {
        color: "#000"
        opacity: 0.5
        anchors.fill: main;
    }

    Rectangle {
        id: messageRectangle
        width: main.width * 0.8
        height: 150
        color: "#fff"
        anchors.centerIn: main;

        Column {
            spacing: 2
            anchors.fill: parent
            anchors.margins: 10

            Text {
                id: messageText; text: main.textMessage; wrapMode: Text.WordWrap;
                anchors { top: parent.top; bottom: buttons.bottom; left: parent.left; right: parent.right }
            }

            Row {
                id: buttons
                spacing: 50
                height: 40
                anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
                ImageButton {
                    source: "images/images/back.png"
                    width: 40; height: 40;
                    onClicked: main.cancel();
                }
                ImageButton {
                    source: "images/images/add.png"
                    width: 40; height: 40;
                    onClicked: main.accept();
                }
            }
        }
    }
}
