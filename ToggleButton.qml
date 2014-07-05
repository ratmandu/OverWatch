import QtQuick 2.0

Rectangle {
  id: buttonRect
  width: 200
  height: 60
  color: "black"

  radius: 4
  border.width: 1
  border.color: "#404040"

  state: "normal"

  property string buttonText: "Text"

  gradient: Gradient {
    GradientStop { id: topColor; color: "#303030"; position: 0.0 }
    GradientStop { id: bottomColor; color: "#101010"; position: 1.0 }
  }

  LEDIndicator {
    id: indicator
    baseColor: "green"
    anchors.left: parent.left
    anchors.leftMargin: 10
    anchors.verticalCenter: parent.verticalCenter
  }

  Text {
    color: "white"
    anchors.centerIn: parent
    text: buttonText
    clip: true
  }

  MouseArea {
    id: mouseArea
    anchors.fill: parent
    onClicked: {
      if (parent.state == "normal")
        parent.state = "pressed"
      else
        parent.state = "normal"
    }
  }

  states: [
    State {
      name: "normal"
      PropertyChanges {
        target: topColor
        position: 0.0
      }
      PropertyChanges {
        target: bottomColor
        position: 1.0
      }
      PropertyChanges {
        target: indicator
        isEnabled: false
      }
    },
    State {
      name: "pressed"
      PropertyChanges {
        target: topColor
        position: 1.0
      }
      PropertyChanges {
        target: bottomColor
        position: 0.0
      }
      PropertyChanges {
        target: indicator
        isEnabled: true
      }
    }
  ]
}
