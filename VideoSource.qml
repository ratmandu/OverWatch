import QtQuick 2.0
import QtMultimedia 5.0

Item {
  id: videoSource
  property alias source : cameraSource
  Camera {
    id: cameraSource
    captureMode: Camera.CaptureVideo
  }
}
