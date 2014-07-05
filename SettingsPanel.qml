import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

Rectangle {
  width: parent.width
  height: parent.height
  color: "black"
  visible: false

  GridLayout {
    id: grid
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.topMargin: 20
    anchors.leftMargin: 20
    columnSpacing: dp(35)
    rowSpacing: dp(20)
    columns: 2

    Text {
      font.pixelSize: dp(18)
      color: "white"
      text: "Auto Record"
    }

    Switch {
      id: autoRecordSwitch
      style: newSwitch
//      onCheckedChanged: settings.setValue("AutoRecord", checked)
      checked: settings.getBool("AutoRecord", true)
    }

    Text {
      font.pixelSize: dp(18)
      color: "white"
      text: "Loop Record"
    }

    Switch {
      id: loopRecordSwitch
      style: newSwitch
//      onCheckedChanged: settings.setValue("recordState/LoopRecord", checked)
      checked: settings.getBool("LoopRecord", true)
    }
  }

  Component {
    id: newSwitch
    SwitchStyle {
      groove: Rectangle {
        implicitHeight: dp(20)
        implicitWidth: dp(75)
        radius: 9
        gradient: Gradient {
          GradientStop { color: "#101010"; position: 0.0 }
          GradientStop { color: "#303030"; position: 1.0 }
        }

        border.color: "#505050"
        border.width: dp(1)
      }
      handle: Rectangle {
        implicitHeight: dp(20)
        implicitWidth: dp(40)
        radius: 9
        gradient: Gradient {
          GradientStop { color: control.checked ? "#5e99e5" : "#bbbbbb"; position: 0.0 }
          GradientStop { color: control.checked ? "#4778b4" : "#888888"; position: 1.0 }
        }

        border.color: control.checked ? "#346fff" : "#606060"
        border.width: dp(2)
      }
    }
  }

  function saveSettings() {
    settings.setBool("LoopRecord", loopRecordSwitch.checked)
    settings.setBool("AutoRecord", autoRecordSwitch.checked)
  }
}

