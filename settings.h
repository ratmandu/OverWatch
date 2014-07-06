#ifndef SETTINGS_H
#define SETTINGS_H

#include <QDebug>
#include <QObject>
#include <QSettings>
#include <QStandardPaths>

class Settings : public QObject
{
  Q_OBJECT
public:
  explicit Settings(QObject *parent = 0);
  Q_INVOKABLE void setValue(const QString &key, const QVariant &value);
  Q_INVOKABLE QVariant value(const QString &key, const QVariant &defaultValue = QVariant()) const;
  Q_INVOKABLE void setBool(const QString &key, const bool &value);
  Q_INVOKABLE bool getBool(const QString &key, const bool &defaultValue = false) const;
  Q_INVOKABLE void setInt(const QString &key, const int &value);
  Q_INVOKABLE int getInt(const QString &key, const int &defaultValue = 0) const;

private:
  QSettings *_settings;

signals:

public slots:

};

#endif // SETTINGS_H
