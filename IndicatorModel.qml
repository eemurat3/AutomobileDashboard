import QtQuick 2.12

QtObject {
    id: indicatorId

    property ListModel leftIcon : ListModel {
        id: leftBottomIndicators

        ListElement {
            name: "WindowDefrost"
            src: "Images/defrost.svg"
            isvisible: false
        }

        ListElement {
            name: "Acin"
            src: "Images/acin.svg"
            isvisible: false
        }

        ListElement {
            name: "Wiper"
            src: "Images/wiper.svg"
            isvisible: false
        }

    }

    property ListModel rightIcon : ListModel {
        id: rightBottomIndicators

        /*ListElement {
            name: "overSpeed"
            src: "Images/speed130.svg"
            isvisible: false
        }*/

        ListElement {
            name: "Battery"
            src: "Images/battery.svg"
            isvisible: false
        }

        ListElement {
            name: "gasoline"
            src: "Images/gasoline.svg"
            isvisible: false
        }

        ListElement {
            name: "settings"
            src: "Images/settings.svg"
            isvisible: false
        }

        ListElement {
            name: "engineFault"
            src: "Images/enginefault.svg"
            isvisible: false
        }

    }

    function getIconVisibility (name ) {
        for(var i=0;i<leftBottomIndicators.count;i++) {
            if(leftIcon.get(i).name === name )
                return leftIcon.get(i).isvisible
        }

        for(var i=0;i<rightIcon.count;i++) {
            if(rightIcon.get(i).name === name )
                return rightIcon.get(i).isvisible
        }
    }

    function setIconVisibility(name,value) {
        for(var i=0;i<leftBottomIndicators.count;i++) {
            if(leftIcon.get(i).name === name ){
                leftIcon.setProperty(i,"isvisible",value);
                return;
            }
        }

        for(var i=0;i<rightIcon.count;i++) {
            if(rightIcon.get(i).name === name ) {
                rightIcon.setProperty(i,"isvisible",value);
                return;
            }
        }
    }
}
