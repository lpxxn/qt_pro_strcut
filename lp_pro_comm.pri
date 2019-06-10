
CONFIG += c++ 11

message('------------')
PROJECT_SOURCE_TREE = $$PWD
sub_dir = $$_PRO_FILE_PWD_
sub_dir ~= s,^$$re_escape($$PWD),,
PROJECT_BUILD_TREE = $$clean_path($$OUT_PWD)
PROJECT_BUILD_TREE ~= s,$$re_escape($$sub_dir)$,,
message($$PROJECT_BUILD_TREE)
message($$QMAKE_HOST.arch)

message($$QMAKESPEC)

macx {
 CURRENTHOST = MAC
}
linux {
 CURRENTHOST = LINUX
}
win32 {
 CURRENTHOST = WIN
}
unix: !macx {
 CURRENTHOST = UNIX
}
isEmpty(CURRENTHOST) {
 CURRENTHOST = HOST
}

message($$CURRENTHOST)
CONFIG(debug, debug|release) {
    DEBUG_RELEASE = DEBUG
} else {
    DEBUG_RELEASE = RELEASE
}

PROJECT_COMP_TYPE = $${CURRENTHOST}_$${QMAKE_HOST.arch}_$$DEBUG_RELEASE

PROJECT_APP_PATH = $$PROJECT_SOURCE_TREE/bin/$$PROJECT_COMP_TYPE
PROJECT_LIBRARY_PATH = $$PROJECT_SOURCE_TREE/lib/$$PROJECT_COMP_TYPE
PROJECT_PLUGIN_PATH  = $$PROJECT_APP_PATH/plugins
message($$PROJECT_APP_PATH)
message($$PROJECT_LIBRARY_PATH)
message($$PROJECT_PLUGIN_PATH)

INCLUDEPATH *= \
    $$PROJECT_SOURCE_TREE/libs $$PROJECT_SOURCE_TREE/shared

LIBS *= -L$$PROJECT_LIBRARY_PATH

# 递归决议库依赖性
for(ever) {
    isEmpty(SRC_LIB_DEPENDS): \
        break()
    done_libs += $$SRC_LIB_DEPENDS
    for(dep, SRC_LIB_DEPENDS) {
        include($$PWD/libs/$$dep/$${dep}_dep.pri)
        LIBS *= -l$$SRC_LIB_NAME
    }
    SRC_LIB_DEPENDS = $$unique(SRC_LIB_DEPENDS)
    SRC_LIB_DEPENDS -= $$unique(done_libs)
}

message(forever_$$LIBS)
