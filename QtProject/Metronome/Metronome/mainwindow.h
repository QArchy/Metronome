#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QThread>
#include <QVector>
#include <QtMath>
#include "uartconfigdialog.h"
#include "serialmanager.h"
#include "metronome.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private:
    Ui::MainWindow *ui;
    UartConfigDialog *uartConfigDialog;
    SerialManager* serialManager;
    Metronome* metronome;

private slots:
    void slot_BpmTextChanged(const QString& str);
    void slot_showUartConfig(bool checked = false);
    void slot_uartGetConfig(uartConfig uartConf);
signals:
    void sendCommand();
};
#endif // MAINWINDOW_H
