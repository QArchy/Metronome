#include "uartconfigdialog.h"
#include "ui_uartconfigdialog.h"

UartConfigDialog::UartConfigDialog(QWidget *parent) : QDialog(parent), ui(new Ui::UartConfigDialog) {
    ui->setupUi(this);
}

UartConfigDialog::~UartConfigDialog() {
    delete ui;
}

void UartConfigDialog::on_buttonBox_accepted() {
    uartConfig uartConf;
    uartConf.portName = ui->PortNameComboBox->currentText();
    if (ui->OpenModeComboBox->currentText() == "Read") {
        uartConf.openMode = QIODevice::OpenModeFlag::ReadOnly;
    } else if (ui->OpenModeComboBox->currentText() == "Write") {
        uartConf.openMode = QIODevice::OpenModeFlag::WriteOnly;
    } else if (ui->OpenModeComboBox->currentText() == "Read/Write") {
        uartConf.openMode = QIODevice::OpenModeFlag::ReadWrite;
    }
    uartConf.baudRate = ui->BaudRateComboBox->currentText().toInt();
    if (ui->DataBitsComboBox->currentText() == "8") {
        uartConf.dataBits = QSerialPort::DataBits::Data8;
    }
    if (ui->ParityComboBox->currentText() == "None") {
        uartConf.parity = QSerialPort::Parity::NoParity;
    }
    if (ui->StopBitsComboBox->currentText() == "1") {
        uartConf.stopBits = QSerialPort::StopBits::OneStop;
    }
    if (ui->FlowControlComboBox->currentText() == "None") {
        uartConf.flowControl = QSerialPort::FlowControl::NoFlowControl;
    }
    uartConf.readBufferSize = ui->ReadBufferSizeComboBox->currentText().toInt();
    emit sig_uartConfig(uartConf);
    this->close();
}

void UartConfigDialog::on_buttonBox_rejected() {
    this->close();
}

void UartConfigDialog::updatePortNames() {
    ui->PortNameComboBox->clear();

    auto portList = QSerialPortInfo::availablePorts();

    if (portList.empty()) {
        ui->PortNameComboBox->addItem("No ports found");
    } else {
        for (auto i = portList.begin(); i < portList.end(); i++) {
            ui->PortNameComboBox->addItem(i->portName());
        }
    }
}
