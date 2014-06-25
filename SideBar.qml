import QtQuick 2.0

Rectangle {
  width: 200
  height: parent.height
  color: "black"

  Column {
    anchors.fill: parent
    spacing: 0

    SideBarButton {
      buttonText: "Recording"

      LEDIndicator {
        id: recordIndicator
        isEnabled: true
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 5
        anchors.leftMargin: 5
      }

      onButtonClick: { if (recordIndicator.isEnabled) recordIndicator.isEnabled = false; else recordIndicator.isEnabled = true }
    }

    SideBarButton {
      buttonText: "Settings"

      onButtonClick: {
        videoPreview.visible = false
//        videoPreview.anchors.right = videoPreview.parent.left
      }
    }

    SideBarButton {
      buttonText: "Video"

      onButtonClick: {
        videoPreview.visible = true
//        videoPreview.anchors.left = videoPreview.parent.left
      }
    }
  }
}