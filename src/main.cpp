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
    digitalClock clock;

    viewer.rootContext()->setContextProperty("DigitalClock", new digitalClock);
    viewer.setSource(QUrl("qrc:/qml/qml/clock.qml"));

    app.connect(viewer.engine(),&QQmlEngine::quit, &QGuiApplication::quit);

    //clock.show();
    viewer.show();

    return app.exec();
}
