import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

Rectangle {
  width: parent.width
  height: parent.height
  color: "black"
  visible: false

  GridLayout {
    id: grid
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.topMargin: 20
    anchors.leftMargin: 20
    columnSpacing: dp(35)
    rowSpacing: dp(20)
    columns: 2

    Text {
      font.pixelSize: dp(18)
      color: "white"
      text: "Auto Record"
    }

    Switch {
      id: autoRecordSwitch
      style: newSwitch
//      onCheckedChanged: settings.setValue("AutoRecord", checked)
      checked: settings.getBool("AutoRecord", true)
    }

    Text {
      font.pixelSize: dp(18)
      color: "white"
      text: "Loop Record"
    }

    Switch {
      id: loopRecordSwitch
      style: newSwitch
//      onCheckedChanged: settings.setValue("recordState/LoopRecord", checked)
      checked: settings.getBool("LoopRecord", true)
    }

    Text {
      font.pixelSize: dp(18)
      color: "white"
      text: "Recording time (mins)"
    }

    Row {
      spacing: 15

      Slider {
        id: recordTimeSlider
        minimumValue: 1
        maximumValue: 10
        stepSize: 0.5
        style: newSlider

        value: settings.value("RecordingTime", 5)
        onValueChanged: {
          recordTimeNumber.text = value.toString()
        }
      }

      Text {
        id: recordTimeNumber
        color: "white"
        font.pixelSize: dp(18)
        text: settings.value("RecordingTime", 5)
      }
    }

    Text {
      font.pixelSize: dp(18)
      color: "white"
      text: "Free space to keep"
    }

    Row {
      spacing: 15

      Slider {
        id: freeSpaceSlider
        minimumValue: 0.5
        maximumValue: totalStorage
        stepSize: 0.5
        style: newSlider

        value: settings.value("SpaceToKeep", 1.5)
        onValueChanged: freeSpaceNumber.text = value.toString()
      }

      Text {
        id: freeSpaceNumber
        color: "white"
        font.pixelSize: dp(18)
        text: settings.value("SpaceToKeep", 1.5)
      }
    }

    Text {
      font.pixelSize: dp(18)
      color: "white"
      text: "Recording Resolution"
    }

    ComboBox {
      id: resolutionCombo
      currentIndex: settings.getInt("RecordingResolution", 3)
      model: ["320x240", "640x480", "1280x720", "1920x1080"]
      style: newComboBox
    }

    Text {
      font.pixelSize: dp(18)
      color: "white"
      text: "Recording Camera"
    }

    ComboBox {
      id: recordingCombo
      currentIndex: settings.getInt("RecordingCamera", 0)
      model: ["Rear Camera", "Front Camera"]
      style: newComboBox
    }
  }

  Component {
    id: newComboBox
    ComboBoxStyle {
      background: Rectangle {
        implicitHeight: dp(21)
        implicitWidth: dp(150)
        radius: 4

        gradient: Gradient {
          GradientStop { color: "#eeeeee"; position: 0.0 }
          GradientStop { color: "#aaaaaa"; position: 1.0 }
        }

        border.color: "#606060"
        border.width: dp(1)

        Rectangle {
          id: glyph
          width: dp(10)
          height: dp(10)
          anchors.verticalCenter: parent.verticalCenter
          anchors.right: parent.right
          anchors.rightMargin: 10
          radius: dp(5)

          gradient: Gradient {
            GradientStop { color: "#5E99E5"; position: 0.0 }
            GradientStop { color: "#4778B4"; position: 1.0 }
          }
        }

      }

      label: Label {
        verticalAlignment: Qt.AlignVCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
        text: control.currentText
        color: "black"
        anchors.fill: parent
        font.pixelSize: dp(19)
      }
    }
  }

  Component {
    id: newSlider
    SliderStyle {
      groove: Rectangle{
        implicitHeight: dp(5)
        implicitWidth: dp(150)
        radius: 2.5
        gradient: Gradient {
          GradientStop { color: "#101010"; position: 0.0 }
          GradientStop { color: "#303030"; position: 1.0 }
        }

        border.color: "#505050"
        border.width: 1
      }

      handle: Rectangle {
        implicitHeight: dp(20)
        implicitWidth: implicitHeight
        radius: implicitHeight / 2

        gradient: Gradient {
          GradientStop { color: "#5E99E5"; position: 0.0 }
          GradientStop { color: "#4778B4"; position: 1.0 }
        }

        border.width: dp(1);
        border.color: "#346FFF"
      }
    }
  }

  Component {
    id: newSwitch
    SwitchStyle {
      groove: Rectangle {
        implicitHeight: dp(20)
        implicitWidth: dp(75)
        radius: 9
        gradient: Gradient {
          GradientStop { color: "#101010"; position: 0.0 }
          GradientStop { color: "#303030"; position: 1.0 }
        }

        border.color: "#505050"
        border.width: dp(1)
      }
      handle: Rectangle {
        implicitHeight: dp(20)
        implicitWidth: dp(40)
        radius: 9
        gradient: Gradient {
          GradientStop { color: control.checked ? "#5e99e5" : "#bbbbbb"; position: 0.0 }
          GradientStop { color: control.checked ? "#4778b4" : "#888888"; position: 1.0 }
        }

        border.color: control.checked ? "#346fff" : "#606060"
        border.width: dp(2)
      }
    }
  }

  function saveSettings() {
    settings.setBool("LoopRecord", loopRecordSwitch.checked)
    settings.setBool("AutoRecord", autoRecordSwitch.checked)
    settings.setValue("RecordingTime", recordTimeSlider.value)
    settings.setValue("SpaceToKeep", freeSpaceSlider.value)
    settings.setInt("RecordingResolution", resolutionCombo.currentIndex)
    settings.setInt("RecordingCamera", recordingCombo.currentIndex)

    cameraSource.source.stop()
    cameraSource.selector.selectedCameraDevice = recordingCombo.currentIndex
    cameraSource.videoRecorder.resolution = resolutionCombo.currentText
    cameraSource.source.start()
  }

  function loadSettings() {
    loopRecordSwitch.checked = settings.getBool("LoopRecord", true)
    autoRecordSwitch.checked = settings.getBool("AutoRecord", true)
    recordTimeSlider.value = settings.value("RecordingTime", 5)
    freeSpaceSlider.value = settings.value("SpaceToKeep", 1.5)
    resolutionCombo.currentIndex = settings.getInt("RecordingResolution", 3)
    recordingCombo.currentIndex = settings.getInt("RecordingCamera", 0)
  }
}

