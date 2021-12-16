import QtQuick 2.12
import QtQml.Models 2.1

ListModel {
    id: vehicleConfModelid

    ListElement {
        name: "engineRPM"
        displayText:  "Engine RPM"
        value: 5000
        unit: ""
    }

    ListElement {
        name: "upShiftRPM"
        displayText:  "Up Shift RPM"
        value: 3000
        unit: ""
    }

    ListElement {
        name: "tyreDiameter"
        displayText:  "Tyre Diameter"
        value: 680
        unit: "mm"
    }

    ListElement {
        name: "driveRatio"
        displayText:  "Final Drive Ratio"
        value: 3.4
        unit: ""
    }


    ListElement {
        name: "firstGear"
        displayText:  "First Gear Ratio"
        value: 2.7
        unit: ""
    }

    ListElement {
        name: "secondGear"
        displayText:  "Second Gear Ratio"
        value: 2.1
        unit: ""
    }

    ListElement {
        name: "thirdGear"
        displayText:  "Third Gear Ratio"
        value: 1.5
        unit: ""
    }

    ListElement {
        name: "fourthGear"
        displayText:  "Fourth Gear Ratio"
        value: 1.0
        unit: ""
    }

    ListElement {
        name: "fifthGear"
        displayText:  "Fifth Gear Ratio"
        value: 0.8
        unit: ""
    }

    ListElement {
        name: "sixthGear"
        displayText:  "Sixth Gear Ratio"
        value: 0.6
        unit: ""
    }

    function refreshProperties() {
        for(var i=0; i<vehicleConfModelid.count;i++) {
            vehicleConfModelId.setProperty(i,"value",EngineConfigCPP.getUpdateEngineProperty(vehicleConfModelId.get(i).name));

        }
    }

    Component.onCompleted: {
        refreshProperties();
    }

}
