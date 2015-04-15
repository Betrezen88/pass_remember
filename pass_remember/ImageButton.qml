import QtQuick 2.4

Item {
    id: main

    signal clicked()

    property alias source: image.source

    BorderImage {
        id: image
        anchors.fill: main
        MouseArea {
            anchors.fill: image
            onClicked: main.clicked();
        }
    }
}
