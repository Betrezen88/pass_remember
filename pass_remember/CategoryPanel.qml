import QtQuick 2.0
import QtQuick.Controls 1.2

Item {
    id: main
    height: 40
    Row {
        id: mainRow
        anchors.fill: main
        ComboBox {
            id: categoryChoser
            anchors{ top: mainRow.top; bottom: mainRow.bottom; left: mainRow.left; right: menuButton.left }
            model: ["Category 1", "Category 2" ,"Category 3"]
        }

        Button {
            id: menuButton
            width: 40;
            anchors { right: mainRow.right; top: mainRow.top; bottom: mainRow.bottom }
            text: "M"
        }
    }
}
