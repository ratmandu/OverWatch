#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QScreen>

#include "storagemanager.h"
#include "settings.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    Settings *settings = new Settings();
    StorageManager *storeManager = new StorageManager();
    storeManager->checkFolders();

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("settings", settings);
    context->setContextProperty("storage", storeManager);
    context->setContextProperty("screenPixelDensity", QGuiApplication::primaryScreen()->physicalDotsPerInch());
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
