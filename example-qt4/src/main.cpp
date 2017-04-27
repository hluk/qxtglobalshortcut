#include <QApplication>

#include <qxtglobalshortcut.h>

#include <QTextStream>
#include <QTimer>

int main(int argc, char **argv)
{
    QApplication app(argc, argv);

    QTextStream out(stdout);
    QTextStream err(stderr);

    const QKeySequence shortcut("Ctrl+Shift+T");
    const QxtGlobalShortcut globalShortcut(shortcut);

    if ( !globalShortcut.isValid() ) {
        err << QString("Error: Failed to set shortcut %1")
            .arg(shortcut.toString()) << endl;
        return 1;
    }

    QTimer t;
    QObject::connect(&t, SIGNAL(timeout()), &app, SLOT(quit()));
    t.setSingleShot(true);
    t.setInterval(5000);
    t.start();

    out << QString("Press shortcut %1 (or CTRL+C to exit; times out in 5 seconds)").arg(shortcut.toString()) << endl;

    QObject::connect(
                &globalShortcut, SIGNAL(activated(QxtGlobalShortcut*)),
                &app, SLOT(quit()));

    app.exec();

    return t.isActive() ? 0 : 1;
}
