#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QThread>
#include <QVector>
#include <QtMath>
#include "uartconfigdialog.h"
#include "serialmanager.h"
#include "dds.h"

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
    // ui windows
    Ui::MainWindow *ui;
    UartConfigDialog *uartConfigDialog;
    // class instances
    SerialManager* serialManager;
    DDS* dds;

private slots:
    // slots to acquire dds configuration
    void slot_frequencyTextChanged(const QString& str);
    void slot_amplitudeTextChanged(const QString& str);
    void slot_waveformCheckChanged(bool checked);
    // slots dedicated to uart configuration
    void slot_showUartConfig(bool checked = false);
    void slot_uartGetConfig(uartConfig uartConf);

    void on_MaxVoutLineEdit_textChanged(const QString &arg1);

signals:
    void sendCommand();
};
#endif // MAINWINDOW_H
