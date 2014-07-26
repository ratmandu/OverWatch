#ifndef CAMERASELECTOR_H
#define CAMERASELECTOR_H

#include <QObject>
#include <QCamera>
#include <QVideoDeviceSelectorControl>
#include <QDebug>

class CameraSelector : public QObject
{
  Q_OBJECT
  Q_PROPERTY(QObject* cameraObject READ getCameraObject WRITE setCameraObject)
  Q_PROPERTY(int selectedCameraDevice READ getSelectedCameraDevice WRITE setSelectedCameraDevice)

private:
  QCamera *m_camera;
  QVideoDeviceSelectorControl *m_deviceSelector;

public:
  explicit CameraSelector(QObject *parent = 0);
  Q_INVOKABLE void setSelectedCameraDevice(int cameraId);
  void setCameraObject(QObject *cam);
  QObject* getCameraObject();
  int getSelectedCameraDevice();
  Q_INVOKABLE void waitForCameraStart();

signals:
  void cameraSelected();

public slots:

};

#endif // CAMERASELECTOR_H
