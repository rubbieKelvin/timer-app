import QtQuick 2.0
import QtQuick.Layouts 1.9
import QtQuick.Controls 2.9
import QtQuick.Controls.Material 2.0

import "./components/" as MyComponent

ApplicationWindow{
    id: root
    width: 430
    height: 248
    visible: true   // this line is neccessary for the window to be displayed
    title: qsTr("Timer")

    property bool running: false
    property bool paused: false
    property var starttime
    property var pausetime: null

    FontLoader{
        id: basefont
        name: "poppins"
        source: "./resources/fonts/WorkSans-VariableFont_wght.ttf"
    }

    font.family: basefont.name

    Material.theme: Material.Dark
    Material.accent: Material.Teal

    MyComponent.TimeLabel{
        id: timelabel
        x: 71
        y: 50
        anchors.horizontalCenter: parent.horizontalCenter
    }

    RowLayout{
        id: buttons
        x: 102
        y: 162
        width: 314
        height: 48
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            text: qsTr("start")
            icon.source: "./resources/images/player-play-circle.svg"
            Layout.fillWidth: true
            Material.background: "#121212"
            enabled: !running

            onClicked: {
                running = true;
                starttime = new Date();
            }
        }

        Button {
            text: qsTr((paused) ? "play":"pause")
            icon.source: "./resources/images/player-pause-circle.svg"
            Layout.fillWidth: true
            Material.background: "#121212"
            enabled: running

            onClicked: {
                paused = !paused;

                if (paused){
                    pausetime = new Date();
                }else{
                    starttime.setMilliseconds(
                        new Date() - pausetime
                    );
                    pausetime = null;
                }
            }
        }

        Button {
            text: qsTr("stop")
            icon.source: "./resources/images/player-stop-circle.svg"
            Layout.fillWidth: true
            enabled: running
            Material.background: "#121212"

            onClicked: {
                running = false;
                paused = false;
                pausetime = null;
            }
        }
    }

    Label {
        id: tagline
        width: root.width
        color: "#969696"
        text: qsTr("Rendered in Qml and Js, Powered by Python")
        horizontalAlignment: Text.AlignHCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Timer{
        id: stopwatch
        running: root.running && !root.paused
        repeat: true
        interval: 100

        onTriggered: {
            let timepassed = new Date(new Date() - starttime);
            timelabel.setTime(timepassed);
        }
    }
}
