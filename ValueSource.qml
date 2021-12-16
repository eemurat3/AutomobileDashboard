import QtQuick 2.0

Item {

    id: valueSourceId

    property real currentGear : EngineConfigCPP.getCurrentGear
    property string gearValue: {
        var gear;
        if( EngineConfigCPP.getSpeed === 0)
            return "P"
        else if( currentGear == 1)
            return "1"
        else if( currentGear == 2)
            return "2"
        else if( currentGear == 3)
            return "3"
        else if(currentGear == 4)
            return "4"
        else if( currentGear == 5)
            return "5"
        else
            return "6"
    }
}
