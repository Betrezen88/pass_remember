import QtQuick 2.0
import QtQuick.Controls 1.2

Item {
    id: main
    height: 40

    property alias searchFrase: searchFrase.text
    signal search(string column, string frase)

    TextField {
        id: searchFrase
        width: main.width/2; anchors{ top: main.top; bottom: main.bottom; left: main.left }
        placeholderText: "Search Frase"
        onTextChanged: main.search(searchFrase.text, searchColumn.currentText)
    }

    ComboBox {
        id: searchColumn
        width: main.width/2; anchors{ top: main.top; bottom: main.bottom; right: main.right }
        model: ["Login", "Source"]
        onCurrentTextChanged: main.search(searchFrase.text, searchColumn.currentText)
    }
}
