#ifndef SERIALMANAGER_H
#define SERIALMANAGER_H

#include <QVector>
#include <QByteArray>
#include <QSerialPort>
#include <QSerialportInfo>

struct uartConfig {
    QString portName = "COM4";
    QIODevice::OpenModeFlag openMode = QIODevice::OpenModeFlag::ReadWrite;
    quint32 baudRate = 115200;
    QSerialPort::DataBits dataBits = QSerialPort::DataBits::Data8;
    QSerialPort::Parity parity = QSerialPort::Parity::NoParity;
    QSerialPort::StopBits stopBits = QSerialPort::StopBits::OneStop;
    QSerialPort::FlowControl flowControl = QSerialPort::FlowControl::NoFlowControl;
    quint64 readBufferSize = 1024;
};

class SerialManager: public QObject {
    Q_OBJECT

private:
    QSerialPort* port;
public:
    SerialManager();
    ~SerialManager();
    bool configurePort(uartConfig uartConf);
    quint64 write(QByteArray data);
};

#endif // SERIALMANAGER_H
