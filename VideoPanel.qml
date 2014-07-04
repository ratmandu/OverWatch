import QtQuick 2.0
import QtMultimedia 5.0

Item {
  id: videoPanel

  property alias source : viewfinder.source

  VideoOutput {
    id: viewfinder
    anchors.fill: parent
  }
}
