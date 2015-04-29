import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "Database.js" as DB

Item {
    id: main
    anchors.fill: parent
    property bool isReadOnly: true;
    property bool edited: false

    ColumnLayout {
        id: mainColumn
        spacing: 2
        anchors { fill: parent; margins: 3 }

        RowLayout {
            anchors { left: mainColumn.left; right: mainColumn.right; }
            Label { id: loginLabel; text: "Login" }
            TextField {
                id: login; readOnly: main.isReadOnly;
                anchors { left: loginLabel.right; right: parent.right }
            }
        }

        RowLayout {
            anchors { left: mainColumn.left; right: mainColumn.right; }
            Label { id: passwordLabel; text: "Password" }
            TextField {
                id: password; readOnly: main.isReadOnly; echoMode: TextInput.Password
                anchors { left: passwordLabel.right; right: parent.right }
            }
        }

        RowLayout {
            anchors { left: mainColumn.left; right: mainColumn.right; }
            Label { id: sourceLabel; text: "Source" }
            TextField {
                id: source; readOnly: main.isReadOnly;
                anchors { left: sourceLabel.right; right: parent.right }
            }
        }

        RowLayout {
            anchors { left: mainColumn.left; right: mainColumn.right }
            Label { id: categoryLabel; text: "Category" }
            ComboBox {
                id: category; anchors { left: categoryLabel.right; right: parent.right }
                model: categoryModel
                enabled: !main.isReadOnly
            }

            ListModel { id: categoryModel; }

            Component.onCompleted: getCategories();

            function getCategories() {
                //console.log("getCategories()");
                var categories = DB.categories();
                for(var i = 0; i < categories.rows.length; i++) {
                    categoryModel.append({ text: categories.rows.item(i).name });
                    if (categories.rows.item(i).id === main.parent.categoryId)
                        category.currentIndex = i;
                }
            }
        }

        Label { text: "Description"; anchors.horizontalCenter: mainColumn.horizontalCenter }
        TextArea {
            id: description; readOnly: main.isReadOnly;
            anchors { left: mainColumn.left; right: mainColumn.right }
        }

        RowLayout {
            spacing: 20
            anchors.horizontalCenter: mainColumn.horizontalCenter
            ImageButton {
                width: 40; height: 40
                source: "images/images/back.png"
                onClicked: {
                    if (main.edited)
                        DB.updateAccount(main.parent.accountId, login.text, password.text, source.text, description.text, DB.categoryId(category.currentText));
                    main.parent.source = "MainView.qml";
                }
            }
            ImageButton {
                width: 40; height: 40
                source: "images/images/edit.png"
                onClicked: { main.isReadOnly = !main.isReadOnly; edited = true; }
            }
            ImageButton {
                width: 40; height: 40
                source: "images/images/delete.png"
                onClicked: {
                    message.visible = true;
                    //DB.deleteAccount(main.parent.accountId);
                    //main.parent.accountId = 0;
                    //main.parent.source = "MainView.qml";
                }
            }
            ImageButton {
                width: 40; height: 40
                source: "images/images/show.png"
                onClicked: {
                    if (password.echoMode === TextInput.Password)
                        password.echoMode = TextInput.Normal
                    else
                        password.echoMode = TextInput.Password
                }
            }
        }
    }

    MessageWindow {
        id: message;
        visible: false
        anchors.fill: main
        textMessage: "Are you shure about deleting this account password ?"
        onCancel: message.visible = false;
        onAccept: console.log("Ok");
    }

    Component.onCompleted: { getAccount(main.parent.accountId); }

    function getAccount(accountId) {
        var account = DB.accountsById(accountId);
        login.text = account.rows.item(0).login;
        password.text = account.rows.item(0).password;
        source.text = account.rows.item(0).source;
        description.text = account.rows.item(0).description;
    }
}
