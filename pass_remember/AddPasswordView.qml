import QtQuick 2.3
import QtQuick.Controls 1.3
import"Database.js" as DB

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
        Label { text: "Description ("+description.length+"/200):" }
        TextArea { id: description; }
        Row {
            spacing: 2
            Button {
                text: "Add"
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
            Button { text: "Cancel"; onClicked: main.parent.source = "MainView.qml"; }
        }
    }

    function checkData(fieldList) {
        for (var i = 0; i < fieldList.length; i++)
            if ( fieldList[i] === "" )
                return false;
        return true;
    }
}

