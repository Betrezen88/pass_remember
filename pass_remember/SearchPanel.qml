import QtQuick 2.0
import QtQuick.Controls 1.2

Item {
    id: main
    height: 40
    Row {
        id: searchRow
        anchors.fill: main

        TextField {
            id: searchFrase
            width: searchRow.width/2; height: searchRow.height
            placeholderText: "Search Frase"
        }

        ComboBox {
            id: searchColumn
            width: searchRow.width/2; height: searchRow.height
            model: ["Login", "Source"]
        }
    }
}
