#ifndef CAMERAINFO_H
#define CAMERAINFO_H

#include <QList>
#include <QObject>
#include <QCamera>
#include <QMediaRecorder>
#include <QQmlListProperty>

class CameraInfo : public QObject
{
  Q_OBJECT
  Q_PROPERTY(QQmlListProperty<QSize> resolutions READ getResolutions)

public:
  explicit CameraInfo(QObject *parent = 0);
  QQmlListProperty<QSize> getResolutions();

private:
  QCamera *cam;
  QMediaRecorder *rec;
  QList<QSize *> resolutionList;

signals:

public slots:

};

#endif // CAMERAINFO_H
