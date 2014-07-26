import QtQuick 2.0
import QtMultimedia 5.0

import CameraSelector 1.0

Item {
  id: videoSource
  property alias source : cameraSource
  property alias selector : cameraSelector

  Camera {
    id: cameraSource
    captureMode: Camera.CaptureVideo

    videoRecorder.resolution: {
      if (settings.getInt("RecordingResolution", 3) == 3)
        "1920x1080"
      if (settings.getInt("RecordingResolution", 3) == 2)
        "1280x720"
      if (settings.getInt("RecordingResolution", 3) == 1)
        "640x480"
      if (settings.getInt("RecordingResolution", 3) == 0)
        "320x240"
    }

    videoRecorder.frameRate: {
      if (settings.getInt("RecordingFramerate", 0) == 0)
        30
      if (settings.getInt("RecordingFramerate", 0) == 1)
        20
    }

    videoRecorder.audioChannels: 2
    videoRecorder.audioBitRate: 128000
    videoRecorder.audioEncodingMode: CameraRecorder.ConstantQualityEncoding
    videoRecorder.videoEncodingMode: CameraRecorder.ConstantQualityEncoding
    videoRecorder.outputLocation: "/sdcard/OverWatch/Videos/" + new Date() + ".mp4"
  }

  CameraSelector {
    id: cameraSelector
    cameraObject: cameraSource
  }


}
