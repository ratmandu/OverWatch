import QtQuick 2.0
import QtMultimedia 5.0

import CameraSelector 1.0

Item {
  id: videoSource
  property alias source : cameraSource
  property alias selector : cameraSelector
//  property alias recorder : vidRecorder

  Camera {
    id: cameraSource
    captureMode: Camera.CaptureVideo


  }

  CameraSelector {
    id: cameraSelector
    cameraObject: cameraSource
    selectedCameraDevice: settings.getInt("RecordingCamera", 0)
    onCameraSelected: {
      cameraSource.stop()
      cameraSource.start()
    }
  }

}
