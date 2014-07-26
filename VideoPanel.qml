import QtQuick 2.0
import QtMultimedia 5.2

Item {
  id: videoPanel

  property alias source : viewfinder.source
//  property alias source2: viewfinder2.source

  property alias viewFinder: viewfinder
//  property alias viewFinder2: viewfinder2

  VideoOutput {
    id: viewfinder
//    anchors.fill: parent
    anchors.left: parent.left
    width: parent.width / 2
    height: parent

    autoOrientation: true
    fillMode: VideoOutput.PreserveAspectFit
  }

//  VideoOutput {
//    id: viewfinder2
//    anchors.right: parent.right
//    width: parent.width / 2
//    height: parent

//    autoOrientation: true
//    fillMode: VideoOutput.PreserveAspectFit
//  }
}
