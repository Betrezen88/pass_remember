#include "Passdata.h"

PassData::PassData(QString l, QString p, QString s, QString d) : mLogin(l), mPassword(p), mSource(s), mDescription(d)
{

}

PassData::~PassData()
{

}

QString PassData::login()
{
    return mLogin;
}

QString PassData::password()
{
    return mPassword;
}

QString PassData::source()
{
    return mSource;
}

QString PassData::description()
{
    return mDescription;
}

