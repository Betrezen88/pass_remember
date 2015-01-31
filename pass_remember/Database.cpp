#include "Database.h"

Database::Database()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName("localhost");
    db.setUserName("admin");
    db.setDatabaseName("PassRemember");
}

Database::~Database()
{
    db.close();
}

bool Database::addCategory(QString &name)
{
    return true;
}

bool Database::addPassword(QString &login, QString &password, QString &source, QString &description)
{
    return true;
}

QList<PassData *> *Database::passwords()
{
    return mPasswords;
}
