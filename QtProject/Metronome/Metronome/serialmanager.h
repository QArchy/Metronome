#ifndef SERIALMANAGER_H
#define SERIALMANAGER_H

#include <QVector>
#include <QByteArray>
#include <QSerialPort>
#include <QSerialportInfo>

enum ReadState {
    SOM = 1,
    SIGNAL_DATA_32_24 = 2,
    SIGNAL_DATA_23_16 = 3,
    SIGNAL_DATA_15_8 = 4,
    SIGNAL_DATA_7_0 = 5,
    EOM = 6,
};

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
    qreal plotData;
    quint8 asciiData;

public:
    SerialManager();
    ~SerialManager();
    bool configurePort(uartConfig uartConf);
    quint64 write(QByteArray data);
};

#endif // SERIALMANAGER_H
