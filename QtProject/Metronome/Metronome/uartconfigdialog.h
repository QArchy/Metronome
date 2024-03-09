#ifndef UARTCONFIGDIALOG_H
#define UARTCONFIGDIALOG_H

#include "serialmanager.h"
#include <QDialog>
#include <QSerialPort>
#include <QSerialportInfo>

namespace Ui {
class UartConfigDialog;
}

class UartConfigDialog : public QDialog
{
    Q_OBJECT

public:
    explicit UartConfigDialog(QWidget *parent = nullptr);
    ~UartConfigDialog();
    void updatePortNames();

private slots:
    void on_buttonBox_accepted();

    void on_buttonBox_rejected();

private:
    Ui::UartConfigDialog *ui;

signals:
    void sig_uartConfig(uartConfig uartConf);
};

#endif // UARTCONFIGDIALOG_H
