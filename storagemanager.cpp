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
