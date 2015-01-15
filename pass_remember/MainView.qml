import QtQuick 2.0
import QtQuick.Layouts 1.1

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
        }

        ListView {
            id: mainList
            anchors { top: categoryPanel.bottom; bottom: searchPanel.top; left: mainColumn.left; right: mainColumn.right }
        }

        SearchPanel {
            id: searchPanel
            anchors { left: mainColumn.left; right: mainColumn.right; bottom: mainColumn.bottom }
        }
    }
}
