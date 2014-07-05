import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2

Rectangle {
  width: parent.width
  height: parent.height
  color: "black"

  Column {
    ToggleButton {
      id: tButton
      buttonText: "Auto Record"
    }
    Button {
      width: 250
      height: 75
      checkable: true
      text: "Auto Record"
    }
    Row {
      spacing: 20
      Text {
        text: "Auto Record"
      }
      Switch {
      }
    }
  }

  visible: false
}
