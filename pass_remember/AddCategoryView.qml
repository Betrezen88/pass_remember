import QtQuick 2.0
import QtQuick.Controls 1.3
import "Database.js" as DB

Item {
    id: main
    anchors.fill: parent

    Column {
        spacing: 10
        anchors { left: main.left; right: main.right; margins: 10; verticalCenter: main.verticalCenter }

        Label { text: "Category name:"; anchors.horizontalCenter: parent.horizontalCenter }
        TextField { id: categoryName; placeholderText: "New category"; horizontalAlignment: TextInput.AlignHCenter; anchors { left: parent.left; right: parent.right } }
    }
    Row {
        spacing: 40
        anchors { horizontalCenter: parent.horizontalCenter; bottom: parent.bottom}

        ImageButton {
            width: 64; height: 64
            source: "images/images/back.png"
            onClicked: main.parent.source = "MainView.qml";
        }
        ImageButton {
            width: 64; height: 64
            source: "images/images/add.png"
            onClicked: {
                if (categoryName.text !== "") {
                    if ( DB.categoryId(categoryName.text) === 0 ) {
                        DB.addCategory( categoryName.text )
                        main.parent.source = "MainView.qml"
                    } else
                        console.log("Category '" + categoryName.text +"' exist !")
                } else
                    console.log("Field categoryName id empty !");
            }
        }
    }
}

