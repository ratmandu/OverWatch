import QtQuick 2.0

Rectangle {
  width: 200
  height: parent.height
  color: "black"

  property string storageText: storageManager.checkFreeSpace()
  property alias recordingButton: recordingButton

  Column {
    anchors.top: parent.top
    anchors.right: parent.right
    spacing: 5

    SideBarButton {
      id: recordingButton
      buttonText: "Recording"
      isToggleButton: true
      colorBase: "red"
      isChecked: (cameraSource.source.videoRecorder.recorderState == cameraSource.source.videoRecorder.RecordingState)
      onButtonCheckedChanged: {
        if (isChecked) {
//          cameraSource.source.videoRecorder.outputLocation = "/sdcard/OverWatch/Videos/" + new Date() + ".mp4"
//          cameraSource.source.videoRecorder.record()
          startRecording()
        } else {
//          cameraSource.source.videoRecorder.stop()
//          cameraSource.source.stop()
//          cameraSource.source.start()
          stopRecording()
        }
      }
    }
  }


  Column {
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    spacing: 5

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
          stopRecording()
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
