#include "serialmanager.h"

SerialManager::SerialManager() {
    port = new QSerialPort();
}

bool SerialManager::configurePort(uartConfig uartConf) {
    if (port->isOpen())
        port->close();
    port->setPortName(uartConf.portName);
    port->setBaudRate(uartConf.baudRate);
    port->setDataBits(uartConf.dataBits);
    port->setParity(uartConf.parity);
    port->setStopBits(uartConf.stopBits);
    port->setFlowControl(uartConf.flowControl);
    port->setReadBufferSize(uartConf.readBufferSize);
    return port->open(uartConf.openMode);
}

quint64 SerialManager::write(QByteArray data) {
    return port->write(data);
}

SerialManager::~SerialManager() {
    delete port;
}
