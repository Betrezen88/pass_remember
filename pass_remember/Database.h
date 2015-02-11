#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QtSql/QSqlDatabase>
#include <QStringList>
#include <QList>

#include "Password.h"

class Database : public QObject
{
    Q_OBJECT

public:
    explicit Database(QObject *parent = 0);
    ~Database();

    Q_INVOKABLE bool addCategory(QString name);
    Q_INVOKABLE bool addPassword(QString login, QString password, QString source, QString description, int catId);

    Q_INVOKABLE bool categoryExist(QString name);

//    Q_INVOKABLE QList<Password*> passwords(int catId);
    Q_INVOKABLE QStringList categories();

    Q_INVOKABLE int categoryId(QString name);

private:
    void createDatabase();
    void createCategoryTable();
    void createPasswordTable();

    QSqlDatabase db;
};

#endif // DATABASE_H
