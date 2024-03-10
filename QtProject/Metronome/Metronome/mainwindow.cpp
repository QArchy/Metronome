#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>

MainWindow::MainWindow(QWidget *parent): QMainWindow(parent), ui(new Ui::MainWindow) {
    ui->setupUi(this);

    uartConfigDialog = new UartConfigDialog();
    metronome = new Metronome();
    serialManager = new SerialManager();

    QObject::connect(ui->actionComPortConfig, SIGNAL(triggered(bool)), this, SLOT(slot_showUartConfig(bool)));
    QObject::connect(uartConfigDialog, SIGNAL(sig_uartConfig(uartConfig)), this, SLOT(slot_uartGetConfig(uartConfig)));

    QObject::connect (ui->Bpm_SpinBox, SIGNAL(textChanged(const QString&)), this, SLOT(slot_BpmTextChanged(const QString&)));
}

MainWindow::~MainWindow() {
    delete serialManager;
    delete metronome;
    delete uartConfigDialog;
    delete ui;
}

void MainWindow::slot_BpmTextChanged(const QString& str) {
    metronome->setBpmCount(str.toInt());
    serialManager->write(metronome->formUartCommand());
}

void MainWindow::slot_showUartConfig(bool checked) {
    Q_UNUSED(checked);
    uartConfigDialog->updatePortNames();
    uartConfigDialog->open();
}

void MainWindow::slot_uartGetConfig(uartConfig uartConf) {
    bool portOpened = serialManager->configurePort(uartConf);
    Q_UNUSED(portOpened);
    qDebug() << "Port opened: " << portOpened;
}
