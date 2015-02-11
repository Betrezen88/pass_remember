import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.LocalStorage 2.0
import "Database.js" as DB

Item {
    id: main
    height: 40

    signal showMenu()
    signal categoryChanged(int catId)

    Row {
        id: mainRow
        anchors.fill: main
        ComboBox {
            id: categoryChoser
            anchors{ top: mainRow.top; bottom: mainRow.bottom; left: mainRow.left; right: menuButton.left }
            model: categoryModel
            onCurrentTextChanged: main.categoryChanged(DB.categoryId(currentText))
        }

        Button {
            id: menuButton
            width: 40
            anchors { right: mainRow.right; top: mainRow.top; bottom: mainRow.bottom }
            text: "M"
            onClicked: main.showMenu()
        }

        ListModel { id: categoryModel }
    }

    Component.onCompleted: getCategories();

    function getCategories() {
        var categories = DB.categories();
        //console.log(categories.rows.item(0).name);
        for(var i = 0; i < categories.rows.length; i++) {
            categoryModel.append({ text: categories.rows.item(i).name });
        }
    }
}
