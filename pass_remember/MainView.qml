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
                getAccounts(catId);
            }
        }

        TableView {
            id: mainList
            anchors { top: categoryPanel.bottom; bottom: searchPanel.top; left: mainColumn.left; right: mainColumn.right }
            TableViewColumn { role: "no"; title: "No"; width: main.width * 0.1 }
            TableViewColumn { role: "login"; title: "Login"; width: main.width * 0.4 - 1 }
            //TableViewColumn { role: "password"; title: "Password"; width: main.width * 0.3 }
            TableViewColumn { role: "source"; title: "Source"; width: main.width * 0.5 - 3 }
            model: dataModel
            selectionMode: SelectionMode.MultiSelection
            onDoubleClicked: {
                main.parent.accountId = dataModel.get(row).id;
                main.parent.source = "AccountView.qml";
            }
        }

        SearchPanel {
            id: searchPanel
            anchors { left: mainColumn.left; right: mainColumn.right; bottom: mainColumn.bottom }
        }

        ListModel { id: dataModel }
    }

    ContextMenu {
        id: menu
        visible: false;
        onShowAddCategory: main.parent.source = "AddCategoryView.qml";
        onShowAddPassword: main.parent.source = "AddPasswordView.qml";
    }

    Component.onCompleted: DB.createDatabase();

    function getAccounts(categoryId) {
        dataModel.clear();
        var accounts = DB.accounts(categoryId);
        for(var i = 0; i < accounts.rows.length; i++) {
            dataModel.append({
                "no": i+1,
                "id": accounts.rows.item(i).id,
                "login": accounts.rows.item(i).login,
                "password": accounts.rows.item(i).password,
                "source": accounts.rows.item(i).source,
                "description": accounts.rows.item(i).description
            });
        }
    }
}
