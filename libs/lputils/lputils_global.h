#ifndef LPUTILS_GLOBAL_H
#define LPUTILS_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(LPUTILS_LIBRARY)
#  define LPUTILSSHARED_EXPORT Q_DECL_EXPORT
#else
#  define LPUTILSSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // LPUTILS_GLOBAL_H
