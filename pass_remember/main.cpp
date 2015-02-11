#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include "Database.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    //Database db;

    QQmlApplicationEngine engine;
    //engine.rootContext()->setContextProperty("Database", &db);

    //qmlRegisterType<Password>("myPassword", 1, 0, "Password");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
