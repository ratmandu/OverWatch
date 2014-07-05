#ifndef STORAGEMANAGER_H
#define STORAGEMANAGER_H

#include <QDir>
#include <QFile>
#include <QObject>
#include <QDateTime>
#include <QFileInfo>
#include <QTextStream>

class StorageManager : public QObject
{
  Q_OBJECT
public:
  explicit StorageManager(QObject *parent = 0);
  void checkFolders();
  double checkFreeSpace();

private:

signals:

public slots:

};

#endif // STORAGEMANAGER_H
