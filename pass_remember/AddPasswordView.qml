import QtQuick 2.3
import QtQuick.Controls 1.3

Item {
    id: main

    anchors.fill: parent

    Column {
        anchors.centerIn: main
        spacing: 5

        Label { text: "Add New Password" }
        TextField { id: login; placeholderText: "Login" }
        TextField { id: password; placeholderText: "Password" }
        TextField { id: source; placeholderText: "Source" }
        TextField { id: description; placeholderText: "Description" }
        Row {
            spacing: 2
            Button { text: "Add"; onClicked: main.parent.source = "MainView.qml"; }
            Button { text: "Cancel"; onClicked: main.parent.source = "MainView.qml"; }
        }
    }
}

