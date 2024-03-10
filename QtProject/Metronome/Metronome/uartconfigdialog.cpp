#include "uartconfigdialog.h"
#include "ui_uartconfigdialog.h"

UartConfigDialog::UartConfigDialog(QWidget *parent) : QDialog(parent), ui(new Ui::UartConfigDialog) { ui->setupUi(this); }
UartConfigDialog::~UartConfigDialog() { delete ui; }

void UartConfigDialog::on_buttonBox_accepted() {
    uartConfig uartConf;
    uartConf.portName = ui->PortNameComboBox->currentText();
    uartConf.openMode = QIODevice::OpenModeFlag::WriteOnly;
    uartConf.baudRate = QSerialPort::BaudRate::Baud115200;
    uartConf.dataBits = QSerialPort::DataBits::Data8;
    uartConf.parity = QSerialPort::Parity::NoParity;
    uartConf.stopBits = QSerialPort::StopBits::OneStop;
    uartConf.flowControl = QSerialPort::FlowControl::NoFlowControl;
    uartConf.readBufferSize = 1024;
    emit sig_uartConfig(uartConf);
    this->close();
}

void UartConfigDialog::on_buttonBox_rejected() { this->close(); }

void UartConfigDialog::updatePortNames() {
    ui->PortNameComboBox->clear();

    QList<QSerialPortInfo> portList = QSerialPortInfo::availablePorts();

    if (portList.empty())
        ui->PortNameComboBox->addItem("No ports found");
    else
        for (auto i = portList.begin(); i < portList.end(); i++)
            ui->PortNameComboBox->addItem(i->portName());
}
