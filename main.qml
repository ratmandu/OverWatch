import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.0

ApplicationWindow {
  visible: true
  title: qsTr("Hello World")
  color: "black"

  Rectangle {
    color: "black"
    anchors.fill: parent

    VideoPanel {
      id: videoPreview
//      color: "gray"
      anchors.left: parent.left
      anchors.top: parent.top
      width: parent.width - sideMenuBar.width
      height: parent.height
    }

    SettingsPanel {
      id: settingsPanel
      anchors.left: parent.left
      anchors.top: parent.top
      width: parent.width - sideMenuBar.width
      height: parent.height
      visible: false
    }

    SideBar {
      id: sideMenuBar
      anchors.right: parent.right
    }
  }


}
