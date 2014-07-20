import QtQuick 2.0

Item {

  property alias storageTimer: storageCheckTimer
  property alias loopTimer: loopRecordingTimer
  property alias recordStartTimer: recordingStartTimer

  Timer {
    id: storageCheckTimer
    interval: 30000
    running: true
    onTriggeredOnStartChanged: {
      storageManager.checkSpace()
    }
  }

  Timer {
    id: loopRecordingTimer
    interval: (settings.getInt("RecordingTime", 5) * 60) * 1000
    running: settings.getBool("LoopRecord", true)
    repeat: true
    onRunningChanged: {
      console.log("Loop recording timer " + running)
    }

    onTriggered: {
      restartRecording()
    }
  }

  Timer {
    id: recordingStartTimer
    interval: 1500
    running: true
    repeat: false

    onTriggered: {
      if (settings.getBool("AutoRecord", false)) {
        startRecording()
      }
    }
  }

}
