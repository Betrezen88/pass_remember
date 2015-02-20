import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

Window {
    height: 450
    width: 300
    visible: true

    Item {
        anchors.fill: parent

        Loader {
            id: pageLoader

            property int categoryId

            width: parent.parent.width
            height: parent.parent.height
            source: "MainView.qml"
        }
    }
}
