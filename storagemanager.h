#ifndef STORAGEMANAGER_H
#define STORAGEMANAGER_H

#include <QDir>
#include <QFile>
#include <QObject>
#include <QDateTime>
#include <QFileInfo>
#include <QTextStream>

#include "settings.h"

class StorageManager : public QObject
{
  Q_OBJECT
public:
  explicit StorageManager(QObject *parent = 0);
  static void checkFolders();

  Q_INVOKABLE double checkFreeSpace();
  Q_INVOKABLE void deleteOldFiles();

private:
  Settings settings;

signals:
  void newFreeSpaceMeasurement(double freeSpace, double totalSpace);

public slots:
  void checkSpace();

};

#endif // STORAGEMANAGER_H
