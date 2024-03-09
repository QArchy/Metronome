#include "dds.h"
#include <QDebug>

quint32 DDS::getFpgaFrequency() const {
    return fpgaFrequency;
}

void DDS::setFpgaFrequency(quint32 newFpgaFrequency) {
    fpgaFrequency = newFpgaFrequency;
}

quint32 DDS::getOutputAmplitude() const {
    return outputAmplitude;
}

void DDS::setOutputAmplitude(qreal amplitudePercent) {
    currentOutputAmplitude = maxOutputAmplitude / 100 * amplitudePercent;
    outputAmplitude = qRound(amplitudePercent / 100 * 255);
}

qreal DDS::getAdder() const {
    return adder;
}

void DDS::setAdder(qreal newFrequency) {
    adder = newFrequency / fpgaFrequency * 4294967296 /* 2^32 */;
    adderInt = qRound(adder);
}

quint32 DDS::getAdderInt() const {
    return adderInt;
}

quint8 DDS::getWave() const {
    return wave;
}

void DDS::setWave(quint8 newWave) {
    wave = newWave;
}

QByteArray DDS::formUartCommand() {
    QByteArray command;
    command.append('s');
    command.append((char)(wave));
    qDebug() << "Transmitting Output wave: " << (quint8)command[1];
    char tmpAdderInt[4] = {*((char*)(&adderInt) + 3),
                           *((char*)(&adderInt) + 2),
                           *((char*)(&adderInt) + 1),
                           *((char*)(&adderInt))};
    command.append(tmpAdderInt, 4);
    qDebug() << "Transmitting Adder: " << (quint8)command[2] << ' ' << (quint8)command[3] << ' ' << (quint8)command[4] << ' ' << (quint8)command[5] << ' ';
    char tmpOutputAmplitude[4] = {*((char*)(&outputAmplitude) + 3),
                                  *((char*)(&outputAmplitude) + 2),
                                  *((char*)(&outputAmplitude) + 1),
                                  *((char*)(&outputAmplitude))};
    command.append(tmpOutputAmplitude, 4);
    qDebug() << "Transmitting Output amplitude: " << (quint8)command[6] << ' ' << (quint8)command[7] << ' ' << (quint8)command[8] << ' ' << (quint8)command[9] << ' ';
    command.append('e');
    return command;
}

qreal DDS::getCurrentOutputAmplitude() const {
    return currentOutputAmplitude;
}

void DDS::setMaxOutputAmplitude(qreal newMaxOutputAmplitude) {
    maxOutputAmplitude = newMaxOutputAmplitude;
}

DDS::DDS() {
    fpgaFrequency = 200000000;
    outputAmplitude = 255;
    maxOutputAmplitude = 3.3;
    adder = 0;
    adderInt = 0;
    wave = WaveForm::Sin;
}
