#include "lputils.h"

#include <QTime>
#include <QString>

Lputils::Lputils()
{
}

QString Lputils::MinWithFillZero()
{
    QTime ct = QTime::currentTime();
    int min = ct.minute();
    QString s = QString::number(min).leftJustified(2, '0');
    return s;
}
