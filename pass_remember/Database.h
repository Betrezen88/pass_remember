#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QtSql/QSqlDatabase>
#include <QList>

#include "Passdata.h"

class Database : public QObject
{
public:
    explicit Database(QObject *parent = 0);
    ~Database();

    bool addCategory(QString &name);
    bool addPassword(QString &login, QString &password, QString &source, QString &description);

    QList<PassData*>* passwords();

private:
    QSqlDatabase db;
    QList<PassData*> *mPasswords;
};

#endif // DATABASE_H
