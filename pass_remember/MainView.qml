import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import "Database.js" as DB

Item {
    id: main

    anchors.fill: parent

    ColumnLayout {
        id: mainColumn
        anchors.fill: main
        spacing: 1

        CategoryPanel {
            id: categoryPanel
            anchors { left: mainColumn.left; right: mainColumn.right; top: mainColumn.top }
            onShowMenu: menu.visible = !menu.visible;
            onCategoryChanged: {
                main.parent.categoryId = catId;
                console.log(catId);
                getAccounts(catId);
            }
        }

        TableView {
            id: mainList
            anchors { top: categoryPanel.bottom; bottom: searchPanel.top; left: mainColumn.left; right: mainColumn.right }
            TableViewColumn { role: "no"; title: "No"; width: 20}
            TableViewColumn { role: "login"; title: "Login"; width: 50}
            TableViewColumn { role: "password"; title: "Password"; width: 50}
            TableViewColumn { role: "source"; title: "Source"; width: 100}
            TableViewColumn { role: "description"; title: "Description"; width: 100}
            model: dataModel
        }

        SearchPanel {
            id: searchPanel
            anchors { left: mainColumn.left; right: mainColumn.right; bottom: mainColumn.bottom }
        }

        ListModel {
            id: dataModel
            //ListElement{ login: "DefaultLogin"; password: "Password"; source: "www.source.com"; description: "Default account for source." }
        }
    }

    ContextMenu {
        id: menu
        visible: false;
        onShowAddCategory: main.parent.source = "AddCategoryView.qml";
        onShowAddPassword: main.parent.source = "AddPasswordView.qml";
    }

    Component.onCompleted: DB.createDatabase();

    function getAccounts(categoryId) {
        var accounts = DB.accounts(categoryId);
        for(var i = 0; i < accounts.rows.length; i++) {
            dataModel.append({
                "no": i+1,
                "login": accounts.rows.item(i).login,
                "password": accounts.rows.item(i).password,
                "source": accounts.rows.item(i).source,
                "description": accounts.rows.item(i).description
            });
        }
    }
}
