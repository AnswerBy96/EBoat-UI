import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import QGroundControl 1.0
import QGroundControl.Controllers 1.0
import QGroundControl.ScreenTools 1.0
import QGroundControl.Palette 1.0
import QGroundControl.Controls 1.0
import QtQuick.Extras 1.4



Rectangle {
    id: leftpanel
    color: "#000000"
    border.color: "#000000"
    z: 1

    Image {
        source: "/res/background1"
        anchors.fill:parent
        fillMode: Image.Stretch
    }

    property int swictchBtnState: 0
    property int settingBtnState: 0
    property int cameraBtnState: 0
    property int alarmBtnState: 0


    property int autoModeState:   0
    property int manualModeState: 0
    property int remoteModeState: 0
    property int anchorModeState: 0
    property int cruiseModeState: 0

    function switchbtnclicked(){
        if(swictchBtnState == 0)
        {
            _model3D.boatAnimation(swictchBtnState);
            boatbackgrounddisappear.running = false;
            boatbackgroundappear.running = true;
            swictchBtnState = 1;
            switchbtnimage.source = "/res/Start-Green"
        }
        else
        {
            _model3D.boatAnimation(swictchBtnState);
            boatbackgrounddisappear.running = true;
            boatbackgroundappear.running = false;
            swictchBtnState = 0;
            switchbtnimage.source = "/res/Start-White"
        }
    }

    function settingbtnclicked()
    {
        if(settingBtnState == 0)
        {
            settingBtnState = 1;
            settingbtnimage.source = "/res/Setting-Green"
        }

        else
        {
            settingBtnState = 0;
            settingbtnimage.source = "/res/Setting-White"
        }
    }

    function camerabtnclicked()
    {
        if(cameraBtnState == 0)
        {
            cameraBtnState = 1;
            camerabtnimage.source = "/res/Camera-Green"
        }

        else
        {
            cameraBtnState = 0;
            camerabtnimage.source = "/res/Camera-White"
        }
    }

    function automodeclicked(){
        if(autoModeState == 0)
        {
            manualmodeclickeffect.opacity = 0;
            manualModeState = 0;

            remotemodeclickeffect.opacity = 0;
            remoteModeState = 0;

            anchorsmodeclickeffect.opacity = 0;
            anchorModeState = 0;

            cruisemodeclickeffect.opacity = 0;
            cruiseModeState = 0;

            automodeclickeffect.opacity = 0.8;
            autoModeState = 1;


            modetext.text = "Auto Mode";
            modetext.opacity = 1;
        }
        else
        {
            automodeclickeffect.opacity = 0;
            autoModeState = 0;
            modetext.opacity = 0;
        }
    }

    function manualmodeclicked(){
        if(manualModeState == 0)
        {
            automodeclickeffect.opacity = 0;
            autoModeState = 0;

            remotemodeclickeffect.opacity = 0;
            remoteModeState = 0;

            anchorsmodeclickeffect.opacity = 0;
            anchorModeState = 0;

            cruisemodeclickeffect.opacity = 0;
            cruiseModeState = 0;

            manualmodeclickeffect.opacity = 0.8;
            manualModeState = 1;

            modetext.text = "Manual Mode";
            modetext.opacity = 1;
        }
        else
        {
            manualmodeclickeffect.opacity = 0;
            manualModeState = 0;
            modetext.opacity = 0;
        }
    }

    function remotemodeclicked(){
        if(remoteModeState == 0)
        {
            automodeclickeffect.opacity = 0;
            autoModeState = 0;

            manualmodeclickeffect.opacity = 0;
            manualModeState = 0;


            anchorsmodeclickeffect.opacity = 0;
            anchorModeState = 0;

            cruisemodeclickeffect.opacity = 0;
            cruiseModeState = 0;

            remotemodeclickeffect.opacity = 0.8;
            remoteModeState = 1;

            modetext.text = "Remote Mode";
            modetext.opacity = 1;
        }
        else
        {
            remotemodeclickeffect.opacity = 0;
            remoteModeState = 0;
            modetext.opacity = 0;
        }
    }

    function anchorsmodeclicked(){
        if(anchorModeState == 0)
        {
            automodeclickeffect.opacity = 0;
            autoModeState = 0;

            manualmodeclickeffect.opacity = 0;
            manualModeState = 0;

            cruisemodeclickeffect.opacity = 0;
            cruiseModeState = 0;

            anchorsmodeclickeffect.opacity = 0.8;
            anchorModeState = 1;

            modetext.text = "Anchor Mode";
            modetext.opacity = 1;
        }
        else
        {
            anchorsmodeclickeffect.opacity = 0;
            anchorModeState = 0;
            modetext.opacity = 0;
        }
    }

    function cruisemodeclicked(){
        if(cruiseModeState == 0)
        {
            cruisemodeclickeffect.opacity = 0;
            cruiseModeState = 0;

           cruisemodeclickeffect.opacity = 0;
            cruiseModeState = 0;

            anchorsmodeclickeffect.opacity = 0;
            anchorModeState = 0;

            cruisemodeclickeffect.opacity = 0.8;
            cruiseModeState = 1;

            modetext.text = "Cruise Mode";
            modetext.opacity = 1;
        }
        else
        {
            cruisemodeclickeffect.opacity = 0;
            cruiseModeState = 0;
            modetext.opacity = 0;
        }
    }

    property int batteryLevel: 70

    Rectangle {
        id: batteryContainer
        width: 128
        height: 18
        border.color: "black"
        border.width: 2
        radius: 20
        anchors.right: leftpanel.right
        anchors.rightMargin: 50
        anchors.top: leftpanel.top
        anchors.topMargin: 30

        // 电池内部填充区域
        Rectangle {
            id: batteryLevelDisplay
            width: batteryContainer.width * batteryLevel / 100
            height: batteryContainer.height * 0.75
            radius: 20
            // 低于20%时显示红色#33de33 f50e42
            color: batteryLevel > 20 ? "#33de33" : "#f50e42"
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
        }

        // 显示电量百分比的文本
        Text {
            id: batteryText
            font.family: "Microsoft JhengHei UI"
            font.bold: true
            anchors.right: parent.left
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 25
            color: "white"
            text: "50%"
        }
    }

    Image {
        id: charginglogo
        source: "/res/Charging-White"
        fillMode: Image.PreserveAspectFit
        scale: 0.2
        anchors.left: leftpanel.right
        anchors.leftMargin: -125
        anchors.verticalCenter: batteryContainer.verticalCenter
    }

    Image {
        id: yachtlogo
        source: "/res/yachtlogo"
        anchors.top: leftpanel.top
        anchors.leftMargin: -59
        anchors.topMargin: -62
        anchors.left: leftpanel.left
        fillMode: Image.PreserveAspectFit
        scale: 0.25
        z: 3
    }

    Text {
        id: modetext
        anchors.centerIn: yachtlogo.Center
        anchors.left: yachtlogo.right
        anchors.top: yachtlogo.top
        anchors.leftMargin: -68
        anchors.topMargin: 89
        color: "#0cb2fa"
        text: qsTr("Manual Mode")
        font.pixelSize: 20
        font.family: "Verdana"
        font.styleName: "Regular"
        font.bold: true
        opacity: 0
    }

    Rectangle {
        id: headingcircle
        width: 120
        height: 120
        color: "transparent"
        border.color: "#065cff"
        border.width: 5
        radius: 100
        anchors.horizontalCenter: leftpanel.horizontalCenter
        anchors.horizontalCenterOffset: -225
        anchors.bottom: seperator.top
        anchors.bottomMargin: 50
    }

    Text {
        id: heading
        width: 60
        height: 60
        anchors.horizontalCenter: headingcircle.horizontalCenter
        anchors.top: headingcircle.top
        anchors.topMargin: 18
        font.family: "Microsoft JhengHei UI"
        font.bold: true
        font.pixelSize: 45
        color: "#ffffff"
        text: qsTr("45°")
    }

    Image {
        id: headinglogo
        anchors.horizontalCenter: headingcircle.horizontalCenter
        anchors.top: heading.bottom
        anchors.topMargin: -2
        width: 35
        height: 35
        source: "/res/headinglogo"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: gearrect
        width: 65
        height: 65
        color: "transparent"
        radius: 15
        border.color: "#827c7c"
        border.width: 4
        anchors.horizontalCenter: leftpanel.horizontalCenter
        anchors.bottom: seperator.top
        anchors.bottomMargin: 220

        Text {
            id: geartext
            font.family: "Microsoft JhengHei UI"
            font.bold: true
            font.pixelSize: 33
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            text: qsTr("D")
        }
    }

    Text {
        id: mph
        visible: true
        color: "#ffffff"
        text: "56"
        font.family: "Microsoft JhengHei UI"
        font.bold: true
        font.pointSize: 85
        anchors.horizontalCenter: leftpanel.horizontalCenter
        anchors.bottom: seperator.top
        anchors.bottomMargin: 10
        font.weight: Font.Normal
    }

    Text {
        id: mphLable
        text: qsTr("MPH")
        font.family: "Verdana"
        font.bold: true
        font.pixelSize: 16
        anchors.horizontalCenter: leftpanel.horizontalCenter
        anchors.bottom: seperator.top
        anchors.bottomMargin: 10
        color: "#ffffff"
    }

    Rectangle {
        id: seperator
        height: 2.5
        width: parent.width * 0.95
        anchors.top: leftpanel.top
        anchors.topMargin: leftpanel.height / 4
        anchors.horizontalCenter: leftpanel.horizontalCenter
        border.width: 1
        border.color: "black"

        LinearGradient {
            anchors.fill: parent
            start: Qt.point(0, 0)
            end: Qt.point(width, 0) //横向渐变
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "black"
                }
                GradientStop {
                    position: 0.35
                    color: "white"
                }
                GradientStop {
                    position: 0.7
                    color: "white"
                }
                GradientStop {
                    position: 1.0
                    color: "black"
                }
            }
        }
    }

    Column {
        id: leftmodecol
        anchors.left: leftpanel.left
        anchors.leftMargin: 40
        anchors.top: seperator.bottom
        anchors.topMargin: 150
        spacing: 60 // 子元素间的间距
        z: 3
        Rectangle {
            id: automode
            width: 105
            height: 105
            opacity: 1
            color: "#363836"
            radius: 20
            border.color: "#363836"
            border.width: 2

            Image {
                width: 65
                height: 65
                source: "/res/Auto-White"
                anchors.verticalCenterOffset: -17
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
            }

            Text {
                text: "Auto Mode"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.bottom
                anchors.topMargin: -25
                font.family: "Verdana"
                font.bold: true
                color: "white"
                font.pointSize: 7
            }

            Rectangle {
                id: automodeclickeffect
                anchors.fill: parent
                color: "#414958"
                //color: "transparent"
                opacity: 0 // 初始透明度为 0
                radius: parent.radius
                border.color: "#168bf7"
                border.width: 4
            }

            MouseArea {
                id: automodemouseArea
                anchors.fill: parent
                onClicked: {
                    automodeclicked();
                }
            }
        }

        Rectangle {
            id: manualmode
            width: 105
            height: 105
            color: "#363836"
            radius: 20
            border.color: "#363836"
            border.width: 2

            Image {
                width: 65
                height: 65
                source: "/res/Manual-White"
                anchors.verticalCenterOffset: -12
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
            }

            Text {
                text: "Manual Mode"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.bottom
                anchors.topMargin: -25
                font.family: "Verdana"
                font.bold: true
                color: "white"
                font.pointSize: 7
            }

            Rectangle {
                id: manualmodeclickeffect
                anchors.fill: parent
                color: "#414958"
                //color: "transparent"
                opacity: 0 // 初始透明度为 0
                radius: parent.radius
                border.color: "#168bf7"
                border.width: 4
            }

            MouseArea {
                id: manualmodemouseArea
                anchors.fill: parent
                onClicked: {
                    manualmodeclicked();
                }
            }
        }

        Rectangle {
            id: remotemode
            width: 105
            height: 105
            color: "#363836"
            radius: 20
            border.color: "#363836"
            border.width: 2

            Image {
                width: 65
                height: 65
                source: "/res/Remote-White"
                anchors.verticalCenterOffset: -12
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
            }

            Text {
                text: "Remote Mode"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.bottom
                anchors.topMargin: -25
                font.family: "Verdana"
                font.bold: true
                color: "white"
                font.pointSize: 7
            }

            Rectangle {
                id: remotemodeclickeffect
                anchors.fill: parent
                color: "#414958"
                //color: "transparent"
                opacity: 0 // 初始透明度为 0
                radius: parent.radius
                border.color: "#168bf7"
                border.width: 4
            }

            MouseArea {
                id: remotemodemouseArea
                anchors.fill: parent
                onClicked: {
                    remotemodeclicked();
                }
            }
        }
    }

    Column {
        id: rightmodecol
        anchors.right: leftpanel.right
        anchors.rightMargin: 40
        anchors.top: seperator.bottom
        anchors.topMargin: 250
        spacing: 60 // 子元素间的间距
        z: 3
        Rectangle {
            id: anchorsmode
            width: 105
            height: 105
            opacity: 1
            color: "#363836"
            radius: 20
            border.color: "#363836"
            border.width: 2

            Image {
                width: 65
                height: 65
                source: "/res/Anchors-White"
                anchors.verticalCenterOffset: -17
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
            }

            Text {
                text: "Anchor Mode"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.bottom
                anchors.topMargin: -25
                font.family: "Verdana"
                font.bold: true
                color: "white"
                font.pointSize: 7
            }

            Rectangle {
                id: anchorsmodeclickeffect
                anchors.fill: parent
                color: "#414958"
                //color: "transparent"
                opacity: 0 // 初始透明度为 0
                radius: parent.radius
                border.color: "#168bf7"
                border.width: 4
            }

            MouseArea {
                id: anchorsmodemouseArea
                anchors.fill: parent
                onClicked: {
                    anchorsmodeclicked();
                }
            }
        }

        Rectangle {
            id: cruisemode
            width: 105
            height: 105
            color: "#363836"
            radius: 20
            border.color: "#363836"
            border.width: 2

            Image {
                width: 65
                height: 65
                source: "/res/Cruise-White"
                anchors.verticalCenterOffset: -12
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
            }

            Text {
                text: "Cruise Mode"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.bottom
                anchors.topMargin: -25
                font.family: "Verdana"
                font.bold: true
                color: "white"
                font.pointSize: 7
            }

            Rectangle {
                id: cruisemodeclickeffect
                anchors.fill: parent
                color: "#414958"
                //color: "transparent"
                opacity: 0 // 初始透明度为 0
                radius: parent.radius
                border.color: "#168bf7"
                border.width: 4
            }

            MouseArea {
                id: cruisemodemouseArea
                anchors.fill: parent
                onClicked: {
                    cruisemodeclicked();
                }
            }
        }
    }


    Row {
        id: btncol
        anchors.horizontalCenter: leftpanel.horizontalCenter // 水平居中对齐
        anchors.bottom: leftpanel.bottom
        anchors.bottomMargin: 40
        spacing: 120 // 子元素间的间距

        Button {
            id: settingbtn
            width: 50
            height: 50
            background: Image {
                id: settingbtnimage
                source: "/res/Setting-White"
                fillMode: Image.PreserveAspectFit // 保持图片比例
            }
            onClicked:{
                settingbtnclicked();
            }
        }

        Button {
            id: switchbtn
            width: 50
            height: 50
            background: Image {
                id: switchbtnimage
                source: "/res/Start-White"
                fillMode: Image.PreserveAspectFit // 保持图片比例
            }
            onClicked:{
               switchbtnclicked();
            }
        }

        Button {
            id: camerabtn
            width: 50
            height: 50
            background: Image {
                id: camerabtnimage
                source: "/res/Camera-White"
                fillMode: Image.PreserveAspectFit // 保持图片比例
            }
            onClicked:{
                camerabtnclicked();
            }
        }

        Button {
            id: alarmbtn
            width: 50
            height: 50
            background: Image {
                id: alarmbtnimage
                source: "/res/Alarm-White"
                fillMode: Image.PreserveAspectFit // 保持图片比例
            }
        }
        z: 3
    }


    EBoat3DModel {
        id: _model3D
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 200
        visible:true
        scale: 1.2
        z:3

    }

    Image {
        id: boatbackground
        anchors.centerIn: leftpanel
        source: "/res/ocean"
        anchors.verticalCenterOffset: 100
        anchors.horizontalCenterOffset: -10
        fillMode: Image.PreserveAspectCrop
        opacity: 0
        scale: 1.1
        z: 2

        NumberAnimation {
            id: boatbackgroundappear
            target: boatbackground
            property: "opacity"
            running: false
            duration: 1500
            to: 1
            from: 0
        }

        NumberAnimation {
            id: boatbackgrounddisappear
            target: boatbackground
            property: "opacity"
            running: false
            duration: 1500
            to: 0
            from: 1
        }
    }


}
