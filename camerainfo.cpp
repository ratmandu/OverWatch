#include "camerainfo.h"

CameraInfo::CameraInfo(QObject *parent) :
  QObject(parent)
{
  cam = new QCamera();
  rec = new QMediaRecorder(cam);
  foreach (QSize size, rec->supportedResolutions()) {
    resolutionList.append(new QSize(size.width(), size.height()));
  }
}

QQmlListProperty<QSize> CameraInfo::getResolutions()
{
  return QQmlListProperty<QSize>(new QObject(), resolutionList);
}
