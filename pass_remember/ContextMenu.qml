import QtQuick 2.0
import QtQuick.Controls 1.3

Item {
    id: main
    anchors.fill: parent

    signal showAddCategory();
    signal showAddPassword();

    //tło
    Rectangle {
        color: "#000"
        opacity: 0.5
        anchors.fill: main;
        //obszar dotykowy zamykający menu
        MouseArea {
            anchors.fill: parent
            onClicked: main.visible = false;
        }
    }
    //kolumna z menu
    Column {
        spacing: 2
        anchors { right: parent.right; bottom: parent.bottom; }
        Button { text: "Add Category"; width: 130; onClicked: main.showAddCategory(); }
        Button { text: "Add Password"; width: 130; onClicked: main.showAddPassword(); }
        Button { text: "Delete Selected"; width: 130; }
        Button { text: "Quit"; width: 130; onClicked: Qt.quit() }
    }
}

