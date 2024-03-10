#include "metronome.h"
#include <QDebug>

Metronome::Metronome() { bpmCount = 0; }
quint32 Metronome::getBpmCount() const { return bpmCount; }
void Metronome::setBpmCount(quint32 newBpmCount) { bpmCount = newBpmCount; }

QByteArray Metronome::formUartCommand() {
    QByteArray command;
    command.append('s');
    char tmpBpmCount[4] = {*((char*)(&bpmCount) + 3),
                           *((char*)(&bpmCount) + 2),
                           *((char*)(&bpmCount) + 1),
                           *((char*)(&bpmCount))};
    command.append(tmpBpmCount, 4);
    command.append('e');
    return command;
}
