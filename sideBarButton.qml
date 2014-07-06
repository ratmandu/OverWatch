import QtQuick 2.0

Rectangle {
  width: 200
  height: 100
  color: "black"

  property string buttonText: "Button"
  property bool isToggleButton: false
  property bool isChecked: false
  property string colorBase: "red"

  signal buttonClick()
  signal buttonCheckedChanged()

  radius: 5
  border.color: "#505050"
  border.width: 1
  antialiasing: true

  gradient: Gradient {
    GradientStop { color: "black"; position: (isChecked) ? 0.0 : 1.0 }
    GradientStop { color: "#303030"; position: (isChecked) ? 1.0 : 0.0 }
  }

  Text {
    color: "white"
    anchors.centerIn: parent
    text: buttonText
    clip: true
  }

  MouseArea {
    anchors.fill: parent
    onClicked: {
      if (isToggleButton) {
        if (isChecked) {
          isChecked = false
          buttonCheckedChanged()
        } else {
          isChecked = true
          buttonCheckedChanged()
        }
      } else {
        buttonClick()
      }
    }
  }

  LEDIndicator {
    id: indicator
    width: 25
    baseColor: colorBase
    visible: isToggleButton
    isEnabled: isChecked

    anchors.top: parent.top
    anchors.left: parent.left
    anchors.topMargin: 5
    anchors.leftMargin: 5
  }
}
