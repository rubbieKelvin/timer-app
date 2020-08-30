import QtQuick 2.0
import QtQuick.Layouts 1.9
import QtQuick.Controls 2.9
import QtQuick.Controls.Material 2.0

import "../javascript/app.js" as Js

RowLayout{

    function setTime(date) {
        minute.text = Js.twoDigit(date.getMinutes());
        seconds.text = Js.twoDigit(date.getSeconds());
        millisec.text = Js.threeDigit(date.getMilliseconds());
    }

    Label{
        id: minute
        font.pixelSize: 64
        font.weight: Font.Medium
        text: "00"
        horizontalAlignment: Text.AlignHCenter
        Layout.preferredWidth: 80
        font.bold: false
    }

    Label{
        text: ":"
        font.pixelSize: 64
    }

    Label{
        id: seconds
        font.pixelSize: 64
        text: "00"
        horizontalAlignment: Text.AlignHCenter
        Layout.preferredWidth: 80
        font.weight: Font.Light
    }

    Label{
        text: ":"
        font.pixelSize: 64
    }

    Label{
        id: millisec
        font.pixelSize: 64
        text: "000"
        // horizontalAlignment: Text.AlignHCenter
        Layout.preferredWidth: 130
        font.weight: Font.Light
    }
}
