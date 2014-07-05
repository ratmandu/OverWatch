#ifndef STORAGEMANAGER_H
#define STORAGEMANAGER_H

#include <QObject>
#include <QDir>
#include <QDateTime>

class StorageManager : public QObject
{
  Q_OBJECT
public:
  explicit StorageManager(QObject *parent = 0);
  void checkFolders();

private:

signals:

public slots:

};

#endif // STORAGEMANAGER_H
