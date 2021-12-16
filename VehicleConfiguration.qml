import QtQuick 2.12
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.3

Item {
    id: rootComponentId

    VehicleConfModel {
        id: vehicleConfModelId
    }


    Column {
        id: settingPanelId
        width: parent.width
        anchors.centerIn: parent
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10
        anchors.leftMargin: 50
        anchors.rightMargin: 50

        Repeater {
            id: parameterRepeaterId
            model: vehicleConfModelId
            Row {
                id: rpmRowId
                spacing: 10

                Text {
                    id: name
                    anchors.verticalCenter: parent.verticalCenter
                    width: settingPanelId.width * 0.4
                    font.pointSize: 15
                    text: displayText


                }

                TextField {
                    anchors.verticalCenter: parent.verticalCenter
                    width: settingPanelId.width * 0.4
                    font.pointSize: 15
                    text: value

                    onTextChanged: {
                        for (var i=0; i <vehicleConfModelId.count; i++)
                        {
                            if (vehicleConfModelId.get(i).displayText === name.text)
                                vehicleConfModelId.setProperty(i, "value", parseFloat(text));
                        }
                    }

                }

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    width: settingPanelId.width * 0.4
                    font.pointSize: 15
                    text: unit

                }
            }
        }

        Button {
            id: updateButtonId
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Update"
            width: settingPanelId.width * 0.1
            height: width * 0.4

            onClicked: {

                for(var i=0;i<vehicleConfModelId.count;i++) {
                    var pName = vehicleConfModelId.get(i).name;
                    var pValue = vehicleConfModelId.get(i).value;
                    EngineConfigCPP.updateEngineProp(pName,pValue);
                }
            }

        }
    }



}
