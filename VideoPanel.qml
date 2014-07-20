import QtQuick 2.0
import QtMultimedia 5.0

Item {
  id: videoPanel

  property alias source : viewfinder.source
  property alias viewFinder: viewfinder
  VideoOutput {
    id: viewfinder
    anchors.fill: parent
  }
}
