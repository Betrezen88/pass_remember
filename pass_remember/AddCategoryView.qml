import QtQuick 2.0
import QtQuick.Controls 1.3
import "Database.js" as DB

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
            Button {
                text: "Ok"
                onClicked: {
                    if (categoryName.text !== "") {
                        if ( DB.categoryId(categoryName.text) < 0 ) {
                            DB.addCategory( categoryName.text )
                            main.parent.source = "MainView.qml"
                        } else
                            console.log("Category '" + categoryName.text +"' exist !")
                    } else
                        console.log("Field categoryName id empty !");
                }
            }
            Button { text: "Cancel"; onClicked: main.parent.source = "MainView.qml"; }
        }
    }
}

