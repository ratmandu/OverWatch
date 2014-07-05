import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2

Rectangle {
  width: parent.width
  height: parent.height
  color: "black"
  visible: false

  Column {
    id: textColumn
    spacing: 20
    anchors.left: parent.left
    anchors.leftMargin: 20
    anchors.top: parent.top
    anchors.topMargin: 20

    Text {
      color: "white"
      text: "Auto Record"
    }

    Text {
      color: "white"
      text: "Loop Record"
    }
  }

  Column {
    id: inputColumn
    spacing: 20
    anchors.left: textColumn.right
    anchors.leftMargin: 20
    anchors.top: parent.top
    anchors.topMargin: 20

    Switch {
      id: autoRecordSwitch
    }

    Switch {
      id: loopRecordSwitch
      checked: true
    }
  }

}
