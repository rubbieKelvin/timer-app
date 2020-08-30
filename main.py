# with love from rubbie kelvin
# https://twitter.com/kelvinrubbie
# dev.rubbie@gmail.com

import os, sys
from PySide2 import QtQml, QtGui

if __name__ == "__main__":
    
    # set appplication style to google's material design style
    os.environ["QT_QUICK_CONTROLS_STYLE"] = "Material"

    # create application context
    app = QtGui.QGuiApplication(sys.argv)

    # qml engine
    qmlengine = QtQml.QQmlApplicationEngine()

    # load qml file
    qmlengine.load("./qtquick/main.qml")

    # run main loop
    exit_code = app.exec_()

    # quit application
    sys.exit(exit_code)