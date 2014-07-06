#include "settings.h"

Settings::Settings(QObject *parent) :
  QObject(parent)
{
  _settings = new QSettings("/sdcard/OverWatch/OverWatch_Config.ini", QSettings::IniFormat);
}

void Settings::setValue(const QString &key, const QVariant &value)
{
  _settings->setValue(key, value);
  _settings->sync();
  qDebug() << "Setting:" << key << value.toString() << _settings->status();
}

QVariant Settings::value(const QString &key, const QVariant &defaultValue) const
{
  _settings->sync();
  return _settings->value(key, defaultValue);
  qDebug() << "Getting:" << key << ":" << _settings->value(key, defaultValue) << _settings->status();
}

void Settings::setBool(const QString &key, const bool &value)
{
  _settings->setValue(key, value);
  _settings->sync();
}

bool Settings::getBool(const QString &key, const bool &defaultValue) const
{
  _settings->sync();
  return _settings->value(key, defaultValue).toBool();
}

void Settings::setInt(const QString &key, const int &value)
{
  _settings->setValue(key, value);
  _settings->sync();
}

int Settings::getInt(const QString &key, const int &defaultValue) const
{
  _settings->sync();
  return _settings->value(key, defaultValue).toInt();
}
