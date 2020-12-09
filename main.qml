import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.VirtualKeyboard 2.15
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.12

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    ColumnLayout {
//        anchors.fill: parent
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 100
        spacing: 1
        property var currentItem: null

        AccordionWidget {
            id: sandboxButton
            title: "Ventilation"
            Button {
                anchors.fill: parent
            }
        }

        AccordionWidget {
            title: "Therapy 1"
            Rectangle {
                color: "lightgreen"
                anchors.fill: parent
            }
        }

        AccordionWidget {
            title: "Therapy 2"
            Rectangle {
                color: "lightblue"
                anchors.fill: parent
            }
        }


        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
