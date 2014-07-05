#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

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

    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
