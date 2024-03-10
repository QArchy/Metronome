#ifndef METRONOME_H
#define METRONOME_H

#include <QByteArray>
#include "qglobal.h"

class Metronome {
private:
    quint32 bpmCount;
public:
    Metronome();
    // getters and setters
    quint32 getBpmCount() const;
    void setBpmCount(quint32 newBpmCount);
    // dds functions
    QByteArray formUartCommand();
};

#endif // METRONOME_H
