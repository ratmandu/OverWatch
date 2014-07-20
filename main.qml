import QtQuick 2.2
import QtQuick.Window 2.0
import QtQuick.Controls 1.1

import StorageManager 1.0
import CameraSelector 1.0

ApplicationWindow {
  visible: true
  title: qsTr("Hello World")
  color: "black"

  width: 1280
  height: 800

  property double freeStorage
  property double totalStorage

  StorageManager {
    id: storageManager
    onNewFreeSpaceMeasurement: {
      freeStorage = freeSpace
      totalStorage = totalSpace
      sideMenuBar.storageText = freeStorage.toString() + "/" + totalStorage.toString()
    }
  }

  Rectangle {
    color: "black"
    anchors.fill: parent

    VideoPanel {
      id: videoPreview
      source: cameraSource.source
//      color: "gray"
      anchors.left: parent.left
      anchors.top: parent.top
      width: parent.width - sideMenuBar.width
      height: parent.height
    }

    VideoSource {
      id: cameraSource


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

  Timers {
    id: timers
  }

  function stopRecording() {
    cameraSource.source.videoRecorder.stop()
    sideMenuBar.recordingButton.isChecked = false
    cameraSource.source.stop()
    cameraSource.source.start()
    timers.loopTimer.stop()
    timers.storageTimer.stop()
  }

  function startRecording() {
    cameraSource.source.videoRecorder.outputLocation = "/sdcard/OverWatch/Videos/" + new Date() + ".mp4"
    cameraSource.source.videoRecorder.resolution = settingsPanel.recordingResolution.currentText.toString()
    cameraSource.source.videoRecorder.frameRate = settingsPanel.recordingFramerate.currentText
    cameraSource.source.videoRecorder.record()
    sideMenuBar.recordingButton.isChecked = true
    timers.storageTimer.start()
    if (settings.getBool("LoopRecording", true)) {
      timers.loopTimer.start()
    }
  }

  function restartRecording() {
    cameraSource.source.videoRecorder.stop()
    startRecording()
  }

  function dp(dpVal) {
    var px = Math.round(dpVal * (320/160))
    return px
  }

}
