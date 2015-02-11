import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.LocalStorage 2.0
import "Database.js" as DB

Window {
    height: 450
    width: 300
    visible: true

    Item {
        anchors.fill: parent

        Loader {
            id: pageLoader

            property int categoryId

            anchors.fill: parent
            source: "MainView.qml"

            //onCategoryIdChanged: console.log("categoryId: "+categoryId)

            Component.onCompleted: DB.createDatabase();
        }
    }
}
