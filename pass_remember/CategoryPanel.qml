import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import "Database.js" as DB

Item {
    id: main
    height: 40

    signal showMenu()
    signal categoryChanged(int catId)

    ComboBox {
        id: categoryChoser
        anchors{ top: main.top; bottom: main.bottom; left: main.left; right: menuButton.left }
        model: categoryModel
        onCurrentTextChanged: main.categoryChanged(DB.categoryId(currentText))
    }

    Button {
        id: menuButton
        width: 40
        anchors { right: main.right; top: main.top; bottom: main.bottom }
        text: "M"
        onClicked: main.showMenu()
    }

    ListModel { id: categoryModel }

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
