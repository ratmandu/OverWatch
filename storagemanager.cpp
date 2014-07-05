#include "storagemanager.h"

StorageManager::StorageManager(QObject *parent) :
  QObject(parent)
{

}

void StorageManager::checkFolders()
{
#ifdef ANDROID
  QDir storageDir("/sdcard/OverWatch");
  if (!storageDir.exists()) {
    storageDir.mkdir("/sdcard/OverWatch");
    storageDir.mkdir("/sdcard/OverWatch/Videos");
    storageDir.mkdir("/sdcard/OverWatch/Logs");
  }
#endif
}

double StorageManager::checkFreeSpace()
{
  QFile memFile;
  QStringList memLines;
  QStringList memColumns;

#ifdef ANDROID
  system("df /data > /sdcard/tmp.txt");
  memFile.setFileName("/sdcard/tmp.txt");
#elif __APPLE__ && __MACH__
  system("df -H / > /tmp/tmp.txt");
  memFile.setFileName("/tmp/tmp.txt");
#endif

  memFile.open(QIODevice::ReadOnly);
  QTextStream readData(&memFile);
  while (!readData.atEnd()) {
    memLines << readData.readLine();
  }

  memFile.close();
  memFile.remove();

  memColumns = memLines.at(1).split(QRegExp("\\s+"));
  memColumns.replaceInStrings("G", "");

  emit newFreeSpaceMeasurement(memColumns.at(3).toDouble(), memColumns.at(1).toDouble());
  return memColumns.at(3).toDouble();
}

void StorageManager::deleteOldFiles()
{
  QDir videoDir;
  videoDir.setPath("/sdcard/OverWatch/Videos");
  if (videoDir.count() > 1) {
    // delete oldest file
    // TODO: Check files against flagged list before deletion
    videoDir.setFilter(QDir::Files | QDir::Hidden | QDir::NoSymLinks);
    videoDir.setSorting(QDir::Time | QDir::Reversed);

    QFileInfoList list = videoDir.entryInfoList();

    for (int i = 0; i < list.size(); i++) {
      if (list.at(i).isWritable()) {
        if (QFile::remove(list.at(i).absoluteFilePath())) {
          return;
        }
      }
    }
  }
  return;
}

void StorageManager::checkSpace() {
  if (checkFreeSpace() < settings.value("SpaceToKeep", 1.5).toDouble()) {
    deleteOldFiles();
  }
}
