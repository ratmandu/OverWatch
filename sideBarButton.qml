import QtQuick 2.0

Rectangle {
  width: 200
  height: 100
  color: "black"

  property string buttonText: "Button"
  signal buttonClick()

  radius: 5
  border.color: "#505050"
  border.width: 1
  antialiasing: true

  gradient: Gradient {
    GradientStop { color: "black"; position: 1.0 }
    GradientStop { color: "#303030"; position: 0.0 }
  }

  Text {
    color: "white"
    anchors.centerIn: parent
    text: buttonText
    clip: true
  }

  MouseArea {
    anchors.fill: parent
    onClicked: buttonClick()
  }
}
