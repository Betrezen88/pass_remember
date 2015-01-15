import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

Window {
    height: 600
    width: 300
    visible: true

    Item {
        anchors.fill: parent

        Loader {
            id: pageLoader
            anchors.fill: parent
            source: "MainView.qml"
        }
    }
}
