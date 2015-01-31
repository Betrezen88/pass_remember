#ifndef PASSDATA_H
#define PASSDATA_H

#include <QString>

class PassData
{
public:
    PassData(QString l, QString p, QString s, QString d);
    ~PassData();

    QString login();
    QString password();
    QString source();
    QString description();

private:
    QString mLogin;
    QString mPassword;
    QString mSource;
    QString mDescription;
};

#endif // PASSDATA_H
