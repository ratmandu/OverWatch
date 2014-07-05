import QtQuick 2.0

Rectangle {
  property bool isEnabled
  property string baseColor: "red"

  width: 20
  height: width
  radius: width
  color: {
   if (baseColor == "red") {
     if (isEnabled)
       baseColor
     else
       "dark"+baseColor
   } else if (baseColor == "green") {
     if (isEnabled)
       "limegreen"
     else
       baseColor
   } else if (baseColor == "blue") {
     if (isEnabled)
       baseColor
     else
       "dark"+baseColor
   }
  }
  antialiasing: true

  border.width: 1
  border.color: "black"
}
