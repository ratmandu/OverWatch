import QtQuick 2.0

Rectangle {
  width: 200
  height: 100
  color: "black"
  radius: 5

  border.color: "#505050"
  border.width: 1
  antialiasing: true

  property string titleText: "Title"
  property string contentText: "Content"

  gradient: Gradient {
    GradientStop { color: "black"; position: 1.0 }
    GradientStop { color: "#202020"; position: 0.0 }
  }

  Column {
    anchors.fill: parent

    Text {
      id: title
      color: "white"
      text: titleText
      anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
      id: content
      color: "white"
      text: contentText
      anchors.horizontalCenter: parent.horizontalCenter
    }
  }
}
