#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include <QApplication>
#include <QQmlApplicationEngine>

#include "digitalclock.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQuickView viewer;

    viewer.rootContext()->setContextProperty("DigitalClock", new digitalClock);
    viewer.setSource(QUrl("qrc:/qml/qml/clock.qml"));

    app.connect(viewer.engine(),&QQmlEngine::quit, &QGuiApplication::quit);

    viewer.show();

    return app.exec();
}
