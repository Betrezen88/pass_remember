import QtQuick 2.0
import QtQuick.Controls 1.2

Item {
    id: main
    height: 40

    TextField {
        id: searchFrase
        width: main.width/2; anchors{ top: main.top; bottom: main.bottom; left: main.left }
        placeholderText: "Search Frase"
    }

    ComboBox {
        id: searchColumn
        width: main.width/2; anchors{ top: main.top; bottom: main.bottom; right: main.right }
        model: ["Login", "Source"]
    }
}
