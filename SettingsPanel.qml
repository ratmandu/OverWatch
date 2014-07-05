import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2

Rectangle {
  width: parent.width
  height: parent.height
  color: "black"

  ToggleButton {
    id: tButton
    anchors.centerIn: parent
    buttonText: "Auto Record"
  }

  visible: false
}
