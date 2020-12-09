import QtQuick 2.7
import QtQuick.Layouts 1.2

// This widget assumes that the parent contains a currentItem property which
// points to the AccordionWidget currently selected
Item {
    id: root
    default property var contentItem: null
    property string title: "panel"

    Layout.fillWidth: true
    implicitHeight: 50
    Layout.fillHeight: current

    property bool current: false

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            id: bar
            radius: 2
            Layout.fillWidth: true
            implicitHeight: 50
            color:  root.current ? "#81BEF7" : "#CEECF5"

            Text {
                anchors.fill: parent
                anchors.margins: 10
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: root.title
            }

            Text {
                anchors{
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                    margins: 10
                }
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                text: "^"
                rotation: root.current ? "180" : 0
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    root.current = !root.current;
                    if(root.parent.currentItem !== null)
                        root.parent.currentItem.current = false;

                    root.parent.currentItem = root;
                }
            }
        }

        Rectangle {
            id: container
            Layout.fillWidth: true
//            anchors.top: bar.bottom
            implicitHeight: root.height - bar.height
            clip: true
            Behavior on implicitHeight {
                PropertyAnimation { duration: 200 }
            }
        }

        Component.onCompleted: {
            if(root.contentItem !== null)
                root.contentItem.parent = container;
        }
    }
}
