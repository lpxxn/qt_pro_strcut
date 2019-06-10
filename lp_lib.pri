include($$replace(_PRO_FILE_PWD_, ([^/]+$), \\1/\\1_dep.pri))

TARGET = $$SRC_LIB_NAME

include(lp_pro_comm.pri))

DESTDIR = $$PROJECT_LIBRARY_PATH
