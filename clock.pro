# QT Modules
QT += qml quick

# Target
TARGET = clock
TEMPLATE = app

# Extra Configs
#CONFIG += qml_debug
#CONFIG += qtquickcompiler
QT += widgets
# Sources and Headers
SOURCE_FOLDER = src

INCLUDEPATH += $$SOURCE_FOLDER
SOURCES += $$SOURCE_FOLDER/main.cpp \
    src/digitalclock.cpp

# Qml Files
QML_FOLDER = qml/content
OTHER_FILES += qml/clock.qml

# Resources
RESOURCES += resources.qrc
QMAKE_RESOURCE_FLAGS += -no-compress


target.path = /opt/QtQuick
INSTALLS += target

# Objects Pathes
DESTDIR = bin
UI_DIR = build
MOC_DIR = build
RCC_DIR = build
OBJECTS_DIR = build

# Cross Compile
cross_compile {
    DEFINES += FONTS_PATH
}

DISTFILES += \
    pic/body.png \
    pic/center.png \
    pic/hour.png \
    pic/min.png

HEADERS += \
    src/digitalclock.h
