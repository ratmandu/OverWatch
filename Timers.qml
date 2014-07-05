import QtQuick 2.0

Component {
  Timer {
    id: storageCheckTimer
    interval: 30000
    running: true
    onTriggeredOnStartChanged: {
      storageManager.checkSpace()
    }
  }

}
