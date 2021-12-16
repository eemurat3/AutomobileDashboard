import QtQuick 2.12
import QtQuick.Controls.Styles 1.4


CircularGaugeStyle {
    id: temperatureGaugeStyleId

    function degree2Rad(deg) {
        return deg * (Math.PI / 180)
    }

    labelStepSize: 4
    labelInset: outerRadius * 0.3
    maximumValueAngle: 0
    minimumValueAngle: -90

    tickmarkLabel: Text {
        text: styleData.value === 140 ? "H" : (styleData.value === 50 ? "C" : " ")
        font.pixelSize: Math.max(15,outerRadius * 0.1);
        color : styleData.value === 140 ? "red" : "#e5e5e5"
    }

    tickmark : Rectangle {
        visible: styleData.value % 10 == 0
        implicitWidth: outerRadius * 0.05
        antialiasing: true
        implicitHeight: outerRadius * 0.11
        color:((styleData.value >= 130 && styleData.value) ? "#e34c22" : "#e5e5e5")
    }

    background: Canvas {

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: outerRadius * 0.2

            Text {
                text:temp
                font.pixelSize: Math.max(15,outerRadius * 0.1)
                color: "white"

                readonly property int temp: tempMeterId.value
            }

            Text {
                id: unitSpeedId
                text: " °C"
                color: "white"
                font.pixelSize: outerRadius * 0.2
            }
        }
    }
}
