import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Item {
    id: main
    anchors.fill: parent

    ColumnLayout {
        id: mainColumn
        spacing: 5
        anchors.fill: main

        RowLayout{
            Label { text: "Login" }
            TextField { id: login; enabled: false;  }
        }

        RowLayout{
            Label { text: "Password" }
            TextField { id: password; enabled: false;  }
        }

        RowLayout{
            Label { text: "Source" }
            TextField { id: source; enabled: false;  }
        }

        Label { text: "Description" }
        TextArea { id: description; enabled: false; }
    }
}
