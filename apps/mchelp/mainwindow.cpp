#include <lputils/lputils.h>
#include <test_lib/test_lib.h>

#include <QtDebug>
#include <QMessageBox>

#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    Lputils l;
    qDebug() << l.MinWithFillZero();

    Test_lib tl;
    qDebug() << tl.MinWithFillZeroAdp();

    ui->setupUi(this);
    connect(ui->pb_hello, SIGNAL(clicked()), this, SLOT(on_pbHelloClick()));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pbHelloClick()
{
   QMessageBox *msg = new QMessageBox(this);
    msg->setText("hello world");
    msg->show();
}
