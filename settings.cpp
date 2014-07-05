#include "settings.h"

Settings::Settings(QObject *parent) :
  QObject(parent)
{
  _settings = new QSettings(QStandardPaths::writableLocation(QStandardPaths::ConfigLocation) + "/OverWatch_Config.ini", QSettings::IniFormat);
  qDebug() << QStandardPaths::writableLocation(QStandardPaths::ConfigLocation) << _settings->status();
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
