import QtQuick 2.0
import QtQuick.Controls 1.3


Item {
    id: main
    anchors.fill: parent

    Column {
        spacing: 5
        anchors.centerIn: main

        Label { text: "Category name:" }
        TextField { id: categoryName; placeholderText: "New category" }
        Row {
            spacing: 2
            Button { text: "Ok"; onClicked: main.parent.source = "MainView.qml"; }
            Button { text: "Cancel"; onClicked: main.parent.source = "MainView.qml"; }
        }
    }
}

