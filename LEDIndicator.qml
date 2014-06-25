import QtQuick 2.0

Rectangle {
  property bool isEnabled

  width: 20
  height: width
  radius: width
  color: { if (isEnabled) "red"; else "darkred" }
  antialiasing: true

  border.width: 1
  border.color: "black"
}
