TEMPLATE = app

QT += qml quick widgets multimedia

SOURCES += main.cpp \
    settings.cpp \
    storagemanager.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += \
    android/AndroidManifest.xml

HEADERS += \
    settings.h \
    storagemanager.h
