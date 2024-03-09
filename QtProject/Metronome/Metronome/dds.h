#ifndef DDS_H
#define DDS_H

#include <QByteArray>
#include "qglobal.h"

enum WaveForm {
    Sin = 0,
    Noise = 1,
    Triangle = 2,
    Rect = 3,
    Saw = 4,
    Ramp = 5
};

class DDS {
private:
    quint32 fpgaFrequency;
    quint32 outputAmplitude;
    qreal maxOutputAmplitude;
    qreal currentOutputAmplitude;
    qreal adder;
    quint32 adderInt;
    quint8 wave;
public:
    DDS();
    // getters and setters
    quint32 getFpgaFrequency() const;
    void setFpgaFrequency(quint32 newFpgaFrequency);
    quint32 getOutputAmplitude() const;
    void setOutputAmplitude(qreal amplitudePercent);
    qreal getAdder() const;
    void setAdder(qreal newFrequency);
    quint32 getAdderInt() const;
    quint8 getWave() const;
    void setWave(quint8 newWave);
    // dds functions
    QByteArray formUartCommand();
    qreal getCurrentOutputAmplitude() const;
    void setMaxOutputAmplitude(qreal newMaxOutputAmplitude);
};

#endif // DDS_H
