#include "Database.h"

#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>

Database::Database(QObject *parent) : QObject(parent)
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName("localhost");
    db.setUserName("admin");
    db.setDatabaseName("PassRemember");

    if ( db.open() )
        createDatabase();
    else
        qDebug() << "Connection error: " << db.lastError().text();
}

Database::~Database()
{
    if ( db.isOpen() )
        db.close();
}

bool Database::addCategory(QString name)
{
    if ( db.isOpen() ) {
        QSqlQuery query;
        if ( query.exec(QString("INSERT INTO category VALUES (NULL, '%1');").arg(name)) )
            return true;
        qDebug() << "addCategory error: " << query.lastError().text();
    }
    return false;
}

bool Database::categoryExist(QString name)
{
    if ( db.isOpen() ) {
        QSqlQuery query(QString("SELECT * FROM category WHERE name = '%1';").arg(name));
        if ( !query.next() )
            return false;
        qDebug() << "categoryExist error: " << query.lastError().text();
    }
    return true;
}

bool Database::addPassword(QString login, QString password, QString source, QString description, int catId)
{
    if ( db.isOpen() ) {
        QSqlQuery query(QString("INSERT INTO password VALUES (NULL, '%1', '%2', '%3', '%4', '%5');")
                        .arg(login).arg(password).arg(source).arg(description).arg(catId));
        if ( query.exec() )
            return true;
        qDebug() << "addPassword error: " << query.lastError().text();
    }
    return false;
}

//QList<Password*> Database::passwords(int catId)
//{
//    QList<Password*> pass;
//    if ( db.isOpen() ) {
//        QSqlQuery query(QString("SELECT * FROM password WHERE categoryId = '%1';").arg(catId));
//        while (query.next())
//            pass.append(new Password(query.value(1).toString(), query.value(2).toString(), query.value(3).toString(), query.value(4).toString()) );
//    }
//    return pass;
//}

QStringList Database::categories()
{
    QStringList cat;
    if ( db.isOpen() ) {
        QSqlQuery query(QString("SELECT * FROM category;"));
        while (query.next())
            cat.append(query.value(1).toString());
    }
    return cat;
}

int Database::categoryId(QString name)
{
    if (db.isOpen()) {
        QSqlQuery query(QString("SELECT id FROM category WHERE name = '%1';").arg(name));
        if ( query.next() )
            return query.value(0).toInt();
    }
    return -1;
}

void Database::createDatabase()
{
    if ( db.isOpen() ) {
        QStringList tables = db.tables();
        if ( !tables.contains("category") )
            createCategoryTable();
        if ( !tables.contains("password") )
            createPasswordTable();
    }
    else
        qDebug() << "createDatabase error:" << db.lastError().text();
}

void Database::createCategoryTable()
{
    QSqlQuery query;
    if ( !query.exec(QString("CREATE TABLE category (id integer primary key, name varchar(20));")) )
        qDebug() << "createCategoryTable error: " << query.lastError().text();
}

void Database::createPasswordTable()
{
    QSqlQuery query;
    if ( !query.exec(QString("CREATE TABLE password (id integer primary key,"
                             "login varchar(20),"
                             "pass varchar(20),"
                             "source varchar(100),"
                             "description varchar(200),"
                             "categoryId integer);")) )
        qDebug() << "createPasswordTable error: " << query.lastError().text();
}
