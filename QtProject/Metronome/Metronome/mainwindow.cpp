#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>

MainWindow::MainWindow(QWidget *parent): QMainWindow(parent), ui(new Ui::MainWindow) {
    ui->setupUi(this);

    uartConfigDialog = new UartConfigDialog();
    dds = new DDS();
    serialManager = new SerialManager();

    // window uartConfig
    QObject::connect(ui->actionComPortConfig, SIGNAL(triggered(bool)), this, SLOT(slot_showUartConfig(bool)));
    QObject::connect(uartConfigDialog, SIGNAL(sig_uartConfig(uartConfig)), this, SLOT(slot_uartGetConfig(uartConfig)));

    // Frequency slots
    QObject::connect (ui->Freq_1Hz_SpinBox, SIGNAL(textChanged(const QString&)), this, SLOT(slot_frequencyTextChanged(const QString&)));
    QObject::connect (ui->Freq_10Hz_SpinBox, SIGNAL(textChanged(const QString&)), this, SLOT(slot_frequencyTextChanged(const QString&)));
    QObject::connect (ui->Freq_100Hz_SpinBox, SIGNAL(textChanged(const QString&)), this, SLOT(slot_frequencyTextChanged(const QString&)));
    QObject::connect (ui->Freq_1KHz_SpinBox, SIGNAL(textChanged(const QString&)), this, SLOT(slot_frequencyTextChanged(const QString&)));
    QObject::connect (ui->Freq_10KHz_SpinBox, SIGNAL(textChanged(const QString&)), this, SLOT(slot_frequencyTextChanged(const QString&)));
    QObject::connect (ui->Freq_100KHz_SpinBox, SIGNAL(textChanged(const QString&)), this, SLOT(slot_frequencyTextChanged(const QString&)));
    QObject::connect (ui->Freq_1MHz_SpinBox, SIGNAL(textChanged(const QString&)), this, SLOT(slot_frequencyTextChanged(const QString&)));
    QObject::connect (ui->Freq_10MHz_SpinBox, SIGNAL(textChanged(const QString&)), this, SLOT(slot_frequencyTextChanged(const QString&)));

    // Amplitude slots
    QObject::connect (ui->VPercentSpinBox, SIGNAL(textChanged(const QString&)), this, SLOT(slot_amplitudeTextChanged(const QString&)));

    // Wafeform slots
    QObject::connect (ui->SinRadioBtn, SIGNAL(clicked(bool)), this, SLOT(slot_waveformCheckChanged(bool)));
    QObject::connect (ui->NoiseRadioBtn, SIGNAL(clicked(bool)), this, SLOT(slot_waveformCheckChanged(bool)));
    QObject::connect (ui->TriangleRadioBtn, SIGNAL(clicked(bool)), this, SLOT(slot_waveformCheckChanged(bool)));
    QObject::connect (ui->RectangleRadioBtn, SIGNAL(clicked(bool)), this, SLOT(slot_waveformCheckChanged(bool)));
    QObject::connect (ui->SawRadioBtn, SIGNAL(clicked(bool)), this, SLOT(slot_waveformCheckChanged(bool)));
    QObject::connect (ui->RampRadioBtn, SIGNAL(clicked(bool)), this, SLOT(slot_waveformCheckChanged(bool)));
}

MainWindow::~MainWindow() {
    delete serialManager;
    delete dds;
    delete uartConfigDialog;
    delete ui;
}

void MainWindow::slot_frequencyTextChanged(const QString& str) {
    Q_UNUSED(str);
    QString newFrequencyStr =
        ui->Freq_10MHz_SpinBox->text() + ui->Freq_1MHz_SpinBox->text() +
        ui->Freq_100KHz_SpinBox->text() + ui->Freq_10KHz_SpinBox->text() + ui->Freq_1KHz_SpinBox->text() +
        ui->Freq_100Hz_SpinBox->text() + ui->Freq_10Hz_SpinBox->text() + ui->Freq_1Hz_SpinBox->text();
    dds->setAdder(newFrequencyStr.toDouble());
    ui->adderLineEdit->setText(QString::number(dds->getAdder()));
    ui->adderIntLineEdit->setText(QString::number(dds->getAdderInt()));
    serialManager->write(dds->formUartCommand());
}

void MainWindow::slot_amplitudeTextChanged(const QString& str) {
    dds->setOutputAmplitude(str.toDouble());
    ui->CurrentVoutLineEdit->setText(QString::number(dds->getCurrentOutputAmplitude()));
    serialManager->write(dds->formUartCommand());
    qDebug() << "Output amplitude: " << dds->getOutputAmplitude();
}

void MainWindow::slot_waveformCheckChanged(bool checked) {
    Q_UNUSED(checked);
    if (ui->SinRadioBtn->isChecked()) {
        dds->setWave(WaveForm::Sin);
    } else if (ui->NoiseRadioBtn->isChecked()) {
        dds->setWave(WaveForm::Noise);
    } else if (ui->TriangleRadioBtn->isChecked()) {
        dds->setWave(WaveForm::Triangle);
    } else if (ui->RectangleRadioBtn->isChecked()) {
        dds->setWave(WaveForm::Rect);
    } else if (ui->SawRadioBtn->isChecked()) {
        dds->setWave(WaveForm::Saw);
    } else if (ui->RampRadioBtn->isChecked()) {
        dds->setWave(WaveForm::Ramp);
    }
    serialManager->write(dds->formUartCommand());
    qDebug() << "Dds wave: " << dds->getWave();
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

void MainWindow::on_MaxVoutLineEdit_textChanged(const QString &arg1) {
    dds->setMaxOutputAmplitude(arg1.toDouble());
    dds->setOutputAmplitude(ui->VPercentSpinBox->text().toDouble());
    ui->CurrentVoutLineEdit->setText(QString::number(dds->getCurrentOutputAmplitude()));
    serialManager->write(dds->formUartCommand());
    qDebug() << "Output amplitude: " << dds->getOutputAmplitude();
}

