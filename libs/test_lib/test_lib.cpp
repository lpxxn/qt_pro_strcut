#include "test_lib.h"

#include <lputils/lputils.h>
#include <QString>
#include <QTime>

Test_lib::Test_lib()
{
}

QString Test_lib::MinWithFillZeroAdp()
{
    Lputils lt;
    return lt.MinWithFillZero().append("adp");
}
