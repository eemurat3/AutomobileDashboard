import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.VirtualKeyboard 1.0
import QtQuick.Layouts 1.3

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Automobile Dashboard")


    Column {
        id:leftPanelId
        anchors.left: parent.left
        anchors.top: parent.top
        width: parent.width * 0.2
        spacing: 20
        Button {
            id: confButtonId
            text: "Vehicle Configuration"
            width: simButtonId.width

            onClicked: {
                centralPanelLoader.source = "VehicleConfiguration.qml"
            }

        }

        Button {
            id: simButtonId
            text:  "Dashboard simulation"

            onClicked: {
                centralPanelLoader.source = "DashboardSimulator.qml"
            }

        }
    }

    Loader {
        id: centralPanelLoader
        anchors.centerIn: parent
        width: parent.width
    }


}
