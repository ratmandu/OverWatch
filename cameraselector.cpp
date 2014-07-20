#include "cameraselector.h"

CameraSelector::CameraSelector(QObject *parent) :
  QObject(parent)
{
}

void CameraSelector::setCameraObject(QObject *cam)
{
    // get the QCamera from the declarative camera's mediaObject property.
    m_camera = qvariant_cast<QCamera*>(cam->property("mediaObject"));

    // get the video device selector control
    QMediaService *service = m_camera->service();
    m_deviceSelector = qobject_cast<QVideoDeviceSelectorControl*>(service->requestControl(QVideoDeviceSelectorControl_iid));
}

QObject *CameraSelector::getCameraObject()
{
  return (QObject*)m_camera;
}

void CameraSelector::setSelectedCameraDevice(int cameraId)
{
    // A camera might already be started, make sure it's unloaded
    m_camera->unload();

    m_deviceSelector->setSelectedDevice(cameraId);

    while (m_deviceSelector->selectedDevice() != cameraId);

    m_camera->load();

    emit cameraSelected();
}

int CameraSelector::getSelectedCameraDevice()
{
  return m_deviceSelector->selectedDevice();
}

void CameraSelector::waitForCameraStart()
{
  while (m_camera->state() != m_camera->ActiveState);
}
