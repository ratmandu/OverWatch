import QtQuick 2.0

Rectangle {
  width: 200
  height: parent.height
  color: "black"

  property string storageText: storageManager.checkFreeSpace()

  Column {
    anchors.top: parent.top
    anchors.right: parent.right
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

  }


  Column {
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    spacing: 0

    SideBarIndicator {
      id: storageIndicator
      titleText: "Storage"
      contentText: storageText
    }

    SideBarButton {
      id: settingsButton
      buttonText: "Settings"

      onButtonClick: {
        videoPreview.visible = false
        settingsPanel.visible = true
        if (settingsButton.buttonText == "Settings") {
          settingsButton.buttonText = "Save"
          cancelButton.visible = true
        } else if (settingsButton.buttonText == "Save") {
          settingsButton.buttonText = "Settings"
          settingsPanel.saveSettings()
          videoPreview.visible = true;
          settingsPanel.visible = false
          cancelButton.visible = false
        }
      }
    }

    SideBarButton {
      id: cancelButton
      buttonText: "Cancel"
      visible: false

      onButtonClick: {
        settingsPanel.visible = false
        videoPreview.visible = true
        if (settingsButton.buttonText == "Save") {
          settingsButton.buttonText = "Settings"
          settingsPanel.loadSettings()
          visible = false
        }
      }
    }


  }
}
