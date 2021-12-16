import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.VirtualKeyboard 1.0
import QtQuick.Layouts 1.3

Item {
    ValueSource {
        id: valueSourceId
    }

    IndicatorModel {
        id: indicatorId
    }

    Rectangle {
        id: dashboardId
        height: 500
        width: 1000
        color: "black"
        anchors.centerIn: parent

        Row {
            id: rowIndicator
            spacing: dashboardId.width * 0.02
            anchors.top: dashboardId.top
            anchors.topMargin: dashboardId.width * 0.02
            anchors.horizontalCenter: parent.horizontalCenter

            ArrowIndicator {
                id: leftIndicatorId
                height: dashboardId.height * 0.05
                width: height * 1.5
                direction: Qt.LeftArrow
            }

            Rectangle {
                height: dashboardId.height * 0.05
                width: height
                color: "black"
                Image {
                    id:iconImageLightId
                    anchors.fill: parent
                    source: "Images/light.svg"
                    visible: false
                }
            }

            ArrowIndicator {
                id: rightIndicatorId
                height: dashboardId.height * 0.05
                width: height * 1.5
                direction: Qt.RightArrow
            }

        }

        Row {
            id: dashboardRowId
            spacing: dashboardId.width * 0.02
            anchors.top: rowIndicator.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            CircularGauge {
                id: tempMeterId
                anchors.bottom: parent.bottom
                width: height
                height: dashboardId.height * 0.3
                value: EngineConfigCPP.getTempLevel
                maximumValue: 140
                minimumValue: 50

                style: TemperatureGaugeStyle {}
            }


            CircularGauge {
                id: rpmMeterId
                width: height
                height: dashboardId.height * 0.6
                value: EngineConfigCPP.getEngineRpm
                maximumValue: EngineConfigCPP.getMaxEngineRPM
                style: RpmMeterStyle{}
            }

            CircularGauge {
                id: speedometerId
                value: EngineConfigCPP.getSpeed
                width: height
                height: dashboardId.height * 0.6
                maximumValue: 180

                style: SpedometerStyle{}

                property bool acceleration: false
                Component.onCompleted: forceActiveFocus()
            }

            CircularGauge {
                id: fuelGaugeId
                anchors.bottom: parent.bottom
                width: height
                height: dashboardId.height * 0.3
                value: EngineConfigCPP.getFuelLevel
                maximumValue: 100
                style: FuelGaugeStyle { }

                onValueChanged: {
                    if( value <= 10 ) {
                        indicatorId.setIconVisibility("gasoline",true)
                    }
                    else {
                        indicatorId.setIconVisibility("gasoline",false)
                    }
                }
            }

        }

        Rectangle {
            id: speedrect
            height: dashboardId.height * 0.05
            width: dashboardId.width * 0.1
            color: "#327dc8"
            radius: height * 0.2

            anchors.right: parent.right
            anchors.rightMargin: dashboardId.width * 0.286
            anchors.top: dashboardRowId.bottom

            Text {
                id: speedrectText
                text: EngineConfigCPP.getDistance + " km"
                font.pointSize: 10
                color: "white"

            }
        }

        Rectangle {
            height: dashboardId.height * 0.1
            anchors.top: dashboardRowId.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: height
            color: "black"
            Image {
                id:iconSoeedId
                anchors.fill: parent
                source: "Images/speed130.svg"
                visible: speedometerId.value > 130
            }

        }

        DashboardIndicators {
            id: leftBottomId
            iconModel: indicatorId.leftIcon
            height: dashboardId.height * 0.1
            anchors.top: dashboardRowId.bottom
            anchors.left: parent.left
            anchors.topMargin: dashboardId.width * 0.02
        }

        DashboardIndicators {
            id: rightBottomId
            iconModel: indicatorId.rightIcon
            height: dashboardId.height * 0.1
            anchors.top: dashboardRowId.bottom
            anchors.right: parent.right
            anchors.topMargin: dashboardId.width * 0.02
        }

        Keys.onUpPressed: {
            EngineConfigCPP.applyBrake(false);
            EngineConfigCPP.accelerate(true);
            speedometerId.acceleration = true
        }

        Keys.onDownPressed: {
            EngineConfigCPP.applyBrake(true);
            EngineConfigCPP.accelerate(false);
        }

        Keys.onLeftPressed: {
            leftIndicatorId.isOn =true
            rightIndicatorId.isOn = false

        }

        Keys.onRightPressed: {
            rightIndicatorId.isOn = true
            leftIndicatorId.isOn = false
        }

        Keys.onDigit0Pressed: {
            rightIndicatorId.isOn = false
            leftIndicatorId.isOn = false
        }

        Keys.onPressed: {
            if(event.key === Qt.Key_D)
                indicatorId.setIconVisibility("WindowDefrost",!indicatorId.getIconVisibility("WindowDefrost"))
            else if(event.key === Qt.Key_A)
                indicatorId.setIconVisibility("Acin",!indicatorId.getIconVisibility("Acin"))
            else if(event.key === Qt.Key_W)
                indicatorId.setIconVisibility("Wiper",!indicatorId.getIconVisibility("Wiper"))
            else if(event.key === Qt.Key_L)
                iconImageLightId.visible = !iconImageLightId.visible

        }

        Keys.onReleased: {
            if( event.key === Qt.Key_Up) {
                EngineConfigCPP.accelerate(false);
                speedometerId.acceleration = false
                event.accepted = true
            }

            else if( event.key === Qt.Key_Down) {
                EngineConfigCPP.applyBrake(false);
                event.accepted = true
            }

        }

    }

    Connections {
        target: EngineConfigCPP
        function onEventGenerated(event) {
            if(event === "Battery"){
                indicatorId.setIconVisibility("Battery",true)
            }
            else if(event === "settings"){
                indicatorId.setIconVisibility("settings",true)
            }

            else if(event === "engineFault"){
                indicatorId.setIconVisibility("engineFault",true)
            }
        }


    }
}
