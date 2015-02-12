#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include <QDebug>

#include "Database.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.setOfflineStoragePath(app.applicationDirPath());

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    qDebug() << engine.offlineStoragePath();


    return app.exec();
}
