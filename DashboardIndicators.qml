import QtQuick 2.12

Row {
    id: rowIndicatorId
    spacing: height * 0.2
    property alias iconModel: iconRepeaterId.model

    Repeater {
        id: iconRepeaterId
        //model: IndicatorModel{}

        Rectangle {
            height: parent.height
            width: height
            color: "black"

            Image {
                id:iconImageId
                anchors.fill: parent
                source: src
                visible: isvisible
            }

        }
    }
}

