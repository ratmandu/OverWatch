#include "settings.h"

Settings::Settings(QObject *parent) :
  QObject(parent)
{
#ifdef ANDROID
  qDebug() << "ANDROID";
  _settings = new QSettings("/sdcard/DashCam/conf", QSettings::NativeFormat);
#else
  qDebug() << "OTHER";
  _settings = new QSettings("WheatStand", "OverWatch");
#endif
}

void Settings::setValue(const QString &key, const QVariant &value)
{
  qDebug() << "Setting:" << key << value.toString();
  _settings->setValue(key, value);
  _settings->sync();
}

QVariant Settings::value(const QString &key, const QVariant &defaultValue) const
{
  _settings->sync();
  qDebug() << "Getting:" << key << defaultValue.toString() << ":" << _settings->value(key, defaultValue);
  return _settings->value(key, defaultValue);
}
