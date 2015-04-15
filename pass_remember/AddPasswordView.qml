import QtQuick 2.3
import QtQuick.Controls 1.3
import"Database.js" as DB

Item {
    id: main

    anchors.fill: parent

    Column {
        anchors.fill: main
        anchors.margins: 10
        spacing: 10

        Label { text: "Add New Password"; anchors.horizontalCenter: parent.horizontalCenter }
        TextField { id: login; placeholderText: "Login"; horizontalAlignment: TextInput.AlignHCenter; anchors { left: parent.left; right: parent.right } }
        TextField { id: password; placeholderText: "Password"; horizontalAlignment: TextInput.AlignHCenter; anchors { left: parent.left; right: parent.right } }
        TextField { id: source; placeholderText: "Source"; horizontalAlignment: TextInput.AlignHCenter; anchors { left: parent.left; right: parent.right } }
        Label { text: "Description ("+description.length+"/200):"; anchors.horizontalCenter: parent.horizontalCenter }
        TextArea { id: description; anchors { left: parent.left; right: parent.right } }
        Row {
            spacing: 40
            anchors.horizontalCenter: parent.horizontalCenter
            ImageButton {
                width: 64; height: 64
                source: "images/images/back.png"
                onClicked: main.parent.source = "MainView.qml";
            }
            ImageButton {
                width: 64; height: 64
                source: "images/images/add.png"
                onClicked: {
                    if ( checkData([login.text, password.text, source.text]) ) {
                        if ( DB.addAccount(login.text, password.text, source.text, description.text, main.parent.categoryId) ) {
                            console.log( "Account "+login.text+" added !" );
                            login.text = ""; password.text = ""; source.text = ""; description.text = "";
                        }
                        else
                            console.log("Adding password fail !");
                    }
                    else
                        console.log("Data missing !");
                }
            }
        }
    }

    function checkData(fieldList) {
        for (var i = 0; i < fieldList.length; i++)
            if ( fieldList[i] === "" )
                return false;
        return true;
    }
}

