#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "settings.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    Settings *settings = new Settings();

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("settings", settings);

    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
