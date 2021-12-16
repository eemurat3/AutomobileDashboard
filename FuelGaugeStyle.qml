import QtQuick 2.12
import QtQuick.Controls.Styles 1.4


CircularGaugeStyle {
    id: fuelGaugeStyleId

    function degree2Rad(deg) {
        return deg * (Math.PI / 180)
    }

    labelStepSize: 20
    labelInset: outerRadius * 0.3
    maximumValueAngle: 0
    minimumValueAngle: 90

    tickmarkLabel: Text {
        text: styleData.value === 100 ? "F" : (styleData.value === 0 ? "E" : " ")
        font.pixelSize: Math.max(15,outerRadius * 0.1);
        color : text === "F" ? "green" :(text === "E" ? "#e34c22" : "#e5e5e5")
    }

    tickmark : Rectangle {
        visible: styleData.value % 20 == 0
        implicitWidth: outerRadius * 0.05
        antialiasing: true
        implicitHeight: outerRadius * 0.11
        color:styleData.value === 100 ? "green" : ((styleData.value <= 15 && styleData.value !== 100) ? "#e34c22" : "#e5e5e5")
    }

    background: Canvas {

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: outerRadius * 0.2

            Text {
                id: unitSpeedId
                text: " Fuel"
                color: "white"
                font.pixelSize: outerRadius * 0.2
            }
        }
    }
}
