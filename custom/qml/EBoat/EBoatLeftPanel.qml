import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import QGroundControl 1.0
import QGroundControl.Controllers 1.0
import QGroundControl.ScreenTools 1.0
import QGroundControl.Palette 1.0
import QGroundControl.Controls 1.0
import QGroundControl.MultiVehicleManager   1.0
import QGroundControl.FactSystem            1.0
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
    property int planviewBtnState: 0


    property int autoModeState:   0
    property int manualModeState: 0
    property int remoteModeState: 0
    property int anchorModeState: 0
    property int cruiseModeState: 0

    property real targetSpeed: 0
    property real targetHeading: 0

    property var _activeVehicle: QGroundControl.multiVehicleManager.activeVehicle
    property real eboat_heading: _activeVehicle? _activeVehicle.eboatHeading : 0
    property real eboat_speed: _activeVehicle? _activeVehicle.eboatSpeed : 0
    property int eboat_gear: _activeVehicle? _activeVehicle.gear : 0
    property real eboat_batterysoc: _activeVehicle? _activeVehicle.eboatBatterySoc : 0
    property int mode : 0
    property var    _videoSettings:             QGroundControl.settingsManager.videoSettings
    property string videosettingsource:         _videoSettings.videoSource.rawValue
    property bool _initialDownloadComplete: _activeVehicle ? _activeVehicle.initialConnectComplete : true


    function switchbtnclicked(){
        if(swictchBtnState == 0 && _initialDownloadComplete == true)
        {
            _model3D.boatAnimation(swictchBtnState);
            boatbackgrounddisappear.running = false;
            boatbackgroundappear.running = true;
            swictchBtnState = 1;
            switchbtnimage.source = "/res/Start-Green"

            if(_activeVehicle)
            _activeVehicle.uiToPX4Ignition(swictchBtnState);

        }
        else if(swictchBtnState == 1)
        {
            _model3D.boatAnimation(swictchBtnState);
            boatbackgrounddisappear.running = true;
            boatbackgroundappear.running = false;
            swictchBtnState = 0;
            switchbtnimage.source = "/res/Start-White"


            manualmodeclickeffect.opacity = 0;
            manualModeState = 0;

            remotemodeclickeffect.opacity = 0;
            remoteModeState = 0;

            anchorsmodeclickeffect.opacity = 0;
            anchorModeState = 0;

            cruisemodeclickeffect.opacity = 0;
            cruiseModeState = 0;

            automodeclickeffect.opacity = 0;
            autoModeState = 0;

            targetHeadingGroup.visible = false;
            targetSpeedGroup.visible = false;


            modetext.opacity = 0;



            if(_activeVehicle)
            _activeVehicle.uiToPX4Ignition(swictchBtnState);
        }
    }

    function settingbtnclicked()
    {
        if(settingBtnState == 0)
        {
            settingBtnState = 1;
            settingbtnimage.source = "/res/Setting-Green"

            mainWindow.showToolSelectDialog();
        }

        else
        {
            settingBtnState = 0;
            settingbtnimage.source = "/res/Setting-White"
        }
    }

    function settingbtnClose()
    {
        settingBtnState = 0;
        settingbtnimage.source = "/res/Setting-White"
    }

    function planviewbtnclicked()
    {
        if(planviewBtnState == 0 && swictchBtnState == 1)
        {
            planviewBtnState = 1;
            mainWindow.showPlanView();

        }

        else
        {
            mainWindow.showFlyView();
        }
    }

    function camerabtnclicked()
    {
        if(cameraBtnState == 0 && swictchBtnState == 1)
        {
            cameraBtnState = 1;
            camerabtnimage.source = "/res/Camera-Green"
            _videoSettings.videoSource.rawValue = "RTSP Video Stream"
        }

        else
        {
            cameraBtnState = 0;
            camerabtnimage.source = "/res/Camera-White"
            _videoSettings.videoSource.rawValue = "Video Stream Disabled"
        }
    }

    function alarmbtnclicked()
    {
        if(alarmBtnState == 0)
        {
            alarmBtnState = 1;
            alarmbtnimage.source = "/res/Alarm-Red"
        }
        else
        {
            alarmBtnState = 0;
            alarmbtnimage.source = "/res/Alarm-White"
        }

    }


    function automodeclicked(){
        if(autoModeState == 0 && swictchBtnState == 1)
        {
            manualmodeclickeffect.opacity = 0;
            manualModeState = 0;

            remotemodeclickeffect.opacity = 0;
            remoteModeState = 0;

            anchorsmodeclickeffect.opacity = 0;
            anchorModeState = 0;

            cruisemodeclickeffect.opacity = 0;
            cruiseModeState = 0;

            targetHeadingGroup.visible = false;
            targetSpeedGroup.visible = false;

            automodeclickeffect.opacity = 0.8;
            autoModeState = 1;


            modetext.text = "Auto Mode";
            modetext.opacity = 1;

            mode = 1;
            planviewBtnState = 1;
            mainWindow.showPlanView();

            if(_activeVehicle)
            _activeVehicle.uiToPX4Mode(mode);


        }
        else
        {
            automodeclickeffect.opacity = 0;
            autoModeState = 0;
            modetext.opacity = 0;

            mode = 0;
            planviewBtnState = 0;
            mainWindow.showFlyView();

            if(_activeVehicle)
            _activeVehicle.uiToPX4Mode(mode);
        }
    }

    function manualmodeclicked(){
        if(manualModeState == 0 && swictchBtnState == 1)
        {
            automodeclickeffect.opacity = 0;
            autoModeState = 0;

            remotemodeclickeffect.opacity = 0;
            remoteModeState = 0;

            anchorsmodeclickeffect.opacity = 0;
            anchorModeState = 0;

            cruisemodeclickeffect.opacity = 0;
            cruiseModeState = 0;

            targetHeadingGroup.visible = false;
            targetSpeedGroup.visible = false;

            manualmodeclickeffect.opacity = 0.8;
            manualModeState = 1;

            modetext.text = "Manual Mode";
            modetext.opacity = 1;

            mode = 2;
            if(_activeVehicle)
            _activeVehicle.uiToPX4Mode(mode);
        }
        else
        {
            manualmodeclickeffect.opacity = 0;
            manualModeState = 0;
            modetext.opacity = 0;
            mode = 0;
            if(_activeVehicle)
            _activeVehicle.uiToPX4Mode(mode);
        }
    }

    function remotemodeclicked(){
        if(remoteModeState == 0 && swictchBtnState == 1)
        {
            automodeclickeffect.opacity = 0;
            autoModeState = 0;

            manualmodeclickeffect.opacity = 0;
            manualModeState = 0;


            anchorsmodeclickeffect.opacity = 0;
            anchorModeState = 0;

            cruisemodeclickeffect.opacity = 0;
            cruiseModeState = 0;

            targetHeadingGroup.visible = false;
            targetSpeedGroup.visible = false;

            remotemodeclickeffect.opacity = 0.8;
            remoteModeState = 1;

            modetext.text = "Remote Mode";
            modetext.opacity = 1;

            mode = 3;
            if(_activeVehicle)
            _activeVehicle.uiToPX4Mode(mode);
        }
        else
        {
            remotemodeclickeffect.opacity = 0;
            remoteModeState = 0;
            modetext.opacity = 0;
            mode = 0;
            if(_activeVehicle)
            _activeVehicle.uiToPX4Mode(mode);
        }
    }

    function anchorsmodeclicked(){
        if(anchorModeState == 0 && swictchBtnState == 1)
        {
            automodeclickeffect.opacity = 0;
            autoModeState = 0;

            manualmodeclickeffect.opacity = 0;
            manualModeState = 0;

            cruisemodeclickeffect.opacity = 0;
            cruiseModeState = 0;


            remotemodeclickeffect.opacity = 0;
            remoteModeState = 0;

            targetHeadingGroup.visible = false;
            targetSpeedGroup.visible = false;

            anchorsmodeclickeffect.opacity = 0.8;
            anchorModeState = 1;

            modetext.text = "Anchor Mode";
            modetext.opacity = 1;

            mode = 4;
            if(_activeVehicle)
            _activeVehicle.uiToPX4Mode(mode);
        }
        else
        {
            anchorsmodeclickeffect.opacity = 0;
            anchorModeState = 0;
            modetext.opacity = 0;

            mode = 0;
            if(_activeVehicle)
            _activeVehicle.uiToPX4Mode(mode);
        }
    }

    function cruisemodeclicked(){
        if(cruiseModeState == 0 && swictchBtnState == 1)
        {
            automodeclickeffect.opacity = 0;
            autoModeState = 0;

            manualmodeclickeffect.opacity = 0;
            manualModeState = 0;

            anchorsmodeclickeffect.opacity = 0;
            anchorModeState = 0;


            remotemodeclickeffect.opacity = 0;
            remoteModeState = 0;

            cruisemodeclickeffect.opacity = 0.8;
            cruiseModeState = 1;

            modetext.text = "Cruise Mode";
            modetext.opacity = 1;

            targetHeadingGroup.visible = true;
            targetSpeedGroup.visible = true;
            targetSpeed = eboat_speed;
            targetHeading = eboat_heading;


            mode = 5;
            if(_activeVehicle)
            _activeVehicle.uiToPX4Mode(mode);

            if(_activeVehicle)
            _activeVehicle.uiToPX4CruiseParam(targetSpeed,targetHeading);
        }
        else
        {
            cruisemodeclickeffect.opacity = 0;
            cruiseModeState = 0;
            modetext.opacity = 0;

            targetHeadingGroup.visible = false;
            targetSpeedGroup.visible = false;

            mode = 0;
            if(_activeVehicle)
            _activeVehicle.uiToPX4Mode(mode);
        }
    }

    function targetspeedupclicked()
    {
        let newSpeed = targetSpeed + 0.1;
        targetSpeed = Math.min(newSpeed, 30);// 上限30m/s

        if(_activeVehicle)
        _activeVehicle.uiToPX4CruiseParam(targetSpeed,targetHeading);
    }

    function targetspeeddownclicked()
    {
        let newSpeed = targetSpeed - 0.1;
        targetSpeed = Math.max(newSpeed, 0);   // 下限0m/s

        if(_activeVehicle)
        _activeVehicle.uiToPX4CruiseParam(targetSpeed,targetHeading);
    }

    function targetheadingupclicked()
    {
        let newHeading = targetHeading + 1;
        if(newHeading > 360) newHeading = 360; // 上限360度
        targetHeading = newHeading;

        if(_activeVehicle)
        _activeVehicle.uiToPX4CruiseParam(targetSpeed,targetHeading);
    }

    function targetheadingdownclicked()
    {
        let newHeading = targetHeading - 1;
        if(newHeading < 0) newHeading = 0;    // 下限0度
        targetHeading = newHeading;

        if(_activeVehicle)
        _activeVehicle.uiToPX4CruiseParam(targetSpeed,targetHeading);
    }

    //property int batteryLevel: 50

    Rectangle {
        id: batteryContainer
        width: 155
        height: 25
        border.color: "white"
        border.width: 2
        radius: 8
        anchors.right: leftpanel.right
        anchors.rightMargin: 15
        anchors.top: leftpanel.top
        anchors.topMargin: 18

        // 电池正极凸起（右侧小方块）
        Rectangle {
            width: 6
            height: 12
            radius: 8
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.right
                leftMargin: -2
            }
        }

        // 电池内部填充区域
        Rectangle {
            id: batteryLevelDisplay
            width: Math.min(batteryContainer.width * eboat_batterysoc / 100,
                            batteryContainer.width * 0.95)
            height: batteryContainer.height * 0.95
            radius: 6
            // 低于20%时显示红色#33de33 f50e42
            color: eboat_batterysoc > 20 ? "#33de33" : "#f50e42"
            anchors.left: parent.left
            anchors.leftMargin: 1
            anchors.verticalCenter: parent.verticalCenter
        }

        // 显示电量百分比的文本
        Text {
            id: batteryText
            font.family: "Microsoft JhengHei UI"
            font.bold: true
            anchors.right: parent.left
            anchors.rightMargin: 13
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 25
            color: "white"
            style: Text.Outline
            styleColor: "#40000000" // 半透明黑色描边
            text: Math.floor(eboat_batterysoc) + "%"
        }
    }

    // Image {
    //     id: charginglogo
    //     source: "/res/Charging-White"
    //     fillMode: Image.PreserveAspectFit
    //     scale: 0.2
    //     anchors.left: leftpanel.right
    //     anchors.leftMargin: -125
    //     anchors.verticalCenter: batteryContainer.verticalCenter
    // }

    property var    _vehicleInAir:      _activeVehicle ? _activeVehicle.flying || _activeVehicle.landing : false
    property bool   _vtolInFWDFlight:   _activeVehicle ? _activeVehicle.vtolInFwdFlight : false
    property bool   _armed:             _activeVehicle ? _activeVehicle.armed : false
    property real   _margins:           ScreenTools.defaultFontPixelWidth
    property real   _spacing:           ScreenTools.defaultFontPixelWidth / 2
    property bool   _healthAndArmingChecksSupported: _activeVehicle ? _activeVehicle.healthAndArmingCheckReport.supported : false

    QGCPalette { id: qgcPal }

    property color  _mainStatusBGColor: qgcPal.brandingPurple
    property bool   _communicationLost: _activeVehicle ? _activeVehicle.vehicleLinkManager.communicationLost : false

    // Image{
    //     id: vehiclestatus
    //     source: "/res/status"
    //     anchors.right: statusrect.left
    //     anchors.rightMargin: 2
    //     anchors.top: statusrect.top
    //     anchors.bottom: statusrect.bottom
    //     fillMode: Image.PreserveAspectFit
    //     scale: 0.8
    // }

    property  string  statusrectDynamicColor1: "#c7c1c1"
    property  string  statusrectDynamicColor2: "#000000"
    Rectangle {
        id: statusrect
        width: 230
        height: 40
        radius: 30
        border.color: "white"
        border.width: 2
        anchors.right: leftpanel.right
        anchors.rightMargin: 5
        anchors.top: leftpanel.top
        anchors.topMargin: 70

        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: statusrectDynamicColor1
            }
            GradientStop {
                position: 1.0
                color: statusrectDynamicColor2
            }
        }
    }

    Text {
        id:             mainStatusLabel
        font.italic: true
        anchors.horizontalCenter: statusrect.horizontalCenter
        anchors.bottom: statusrect.bottom
        anchors.bottomMargin: 8
        font.family: "Microsoft JhengHei UI"
        font.bold: true
        color:"white"
        font.pixelSize: 20
        text:           mainStatusText()
        font.pointSize: _vehicleInAir ? ScreenTools.defaultFontPointSize : ScreenTools.largeFontPointSize

        property string _commLostText:      qsTr("Communication Lost")
        property string _readyToFlyText:    qsTr("Ready To Cruise")
        property string _notReadyToFlyText: qsTr("Not Ready")
        property string _disconnectedText:  qsTr("Disconnected")
        property string _armedText:         qsTr("Armed")
        property string _flyingText:        qsTr("Cruising")
        property string _landingText:       qsTr("Landing")
        function mainStatusText() {
            var statusText
            if (_activeVehicle)
            {
                if (_communicationLost) {
                    statusrectDynamicColor1 = "#fdf60707";
                    return mainStatusLabel._commLostText
                }
                if (_activeVehicle.armed) {
                    statusrectDynamicColor1 = "#fd03fe0e"
                    if (_healthAndArmingChecksSupported) {
                        if (_activeVehicle.healthAndArmingCheckReport.canArm) {
                            if (_activeVehicle.healthAndArmingCheckReport.hasWarningsOrErrors) {
                                statusrectDynamicColor1 = "#fdf1f90c"
                            }
                        } else {
                            statusrectDynamicColor1 = "#fdf60707";
                        }
                    }

                    if (_activeVehicle.flying) {
                        return mainStatusLabel._flyingText
                    } else if (_activeVehicle.landing) {
                        return mainStatusLabel._landingText
                    } else {
                        return mainStatusLabel._armedText
                    }
                }
                else {
                    if (_healthAndArmingChecksSupported) {
                        if (_activeVehicle.healthAndArmingCheckReport.canArm)
                        {
                            if (_activeVehicle.healthAndArmingCheckReport.hasWarningsOrErrors) {
                                statusrectDynamicColor1 = "#fdf1f90c"
                            } else {
                                statusrectDynamicColor1 = "#fd03fe0e"
                            }
                            return mainStatusLabel._readyToFlyText
                        } else {
                            statusrectDynamicColor1 = "#fdf60707";
                            return mainStatusLabel._notReadyToFlyText
                        }
                    } else if (_activeVehicle.readyToFlyAvailable) {
                        if (_activeVehicle.readyToFly) {
                            statusrectDynamicColor1 = "#fd03fe0e"
                            return mainStatusLabel._readyToFlyText
                        } else {
                            statusrectDynamicColor1 = "#fdf1f90c"
                            return mainStatusLabel._notReadyToFlyText
                        }
                    } else {
                        // Best we can do is determine readiness based on AutoPilot component setup and health indicators from SYS_STATUS
                        if (_activeVehicle.allSensorsHealthy && _activeVehicle.autopilot.setupComplete) {
                            statusrectDynamicColor1 = "#fd03fe0e"
                            return mainStatusLabel._readyToFlyText
                        } else {
                            statusrectDynamicColor1 = "#fdf1f90c"
                            return mainStatusLabel._notReadyToFlyText
                        }
                    }
                }
            } else {
                _mainStatusBGColor = qgcPal.brandingPurple
                return mainStatusLabel._disconnectedText
            }
        }
        // QGCMouseArea {
        //     anchors.fill: parent
        //     enabled:    _activeVehicle
        //     onClicked:  mainWindow.showIndicatorPopup(mainStatusLabel, sensorStatusInfoComponent)
        // }

    }

    // 底部进度条容器
    Rectangle {
        id: progressBarContainer
        anchors {
            top: seperator.bottom
            horizontalCenter: seperator.horizontalCenter
            topMargin: 10
        }
        height: 8.5
        width: seperator.width
        radius: height/2
        color: "#40FFFFFF"
        visible: !_initialDownloadComplete

        // 动态进度条
        Rectangle {
            id: progressBar
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }
            width: _activeVehicle ?
                Math.min(_activeVehicle.loadProgress * parent.width, parent.width) : 0
            radius: parent.radius
            color: "#2ecc71"

            Behavior on width {
                NumberAnimation {
                    duration: 500
                    easing.type: Easing.OutQuint  // 更平滑的缓动曲线
                }
            }
        }

        // 添加细边框装饰
        Rectangle {
            anchors.fill: parent
            color: "transparent"
            radius: parent.radius
            border {
                width: 1
                color: "white"
            }
        }

        // 百分比标签
        Text {
            id: progressText
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: _activeVehicle ? Math.min(
                    parent.width * _activeVehicle.loadProgress + 4,
                    parent.width - width - 4
                ) : 0
            }
            text: _activeVehicle ? Math.round(_activeVehicle.loadProgress * 100) + "%" : ""
            color: "white"
            visible: _activeVehicle ? (parent.visible && _activeVehicle.loadProgress > 0.05) : false

            font {
                family: "Microsoft JhengHei UI"
                pixelSize: 8
                bold: true
                letterSpacing: 0.5
            }
        }

        Text{
            id: waitingText
            anchors{
                top: parent.bottom
                horizontalCenter: parent.horizontalCenter
                topMargin: 15
            }
            color : "white"
            text: "Waiting For Connecting EBoat"
            font {
                family: "Microsoft JhengHei UI"
                pixelSize: 20
                bold: true
            }
        }
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
        width: 130
        height: 130
        color: "transparent"
        border.color: "#065cff"
        border.width: 5
        radius: 100
        anchors.horizontalCenter: leftpanel.horizontalCenter
        anchors.horizontalCenterOffset: -225
        anchors.bottom: seperator.top
        anchors.bottomMargin: 30
    }

    Text {
        id: heading
        anchors.horizontalCenter: headingcircle.horizontalCenter
        anchors.top: headingcircle.top
        anchors.topMargin: 20
        font.family: "Microsoft JhengHei UI"
        font.bold: true
        font.pixelSize: 40
        color: "#ffffff"
        text: Math.floor(eboat_heading)
        horizontalAlignment: Text.AlignHCenter // 水平居中
        verticalAlignment: Text.AlignVCenter   // 垂直居中
    }

    Text{
        id:headinglabel
        anchors.top:    heading.top
        anchors.left:   heading.right
        anchors.leftMargin: -1
        font.family: "Microsoft JhengHei UI"
        font.bold: true
        font.pixelSize: 30
        color: "#ffffff"
        text:"°"
    }

    Image {
        id: headinglogo
        anchors.horizontalCenter: headingcircle.horizontalCenter
        anchors.top: heading.bottom
        anchors.topMargin: 1
        width: 40
        height: 40
        source: "/res/headinglogo"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: gearrect
        width: 70
        height: 70
        color: "transparent"
        radius: 15
        border.color: "#827c7c"
        border.width: 4
        anchors.horizontalCenter: leftpanel.horizontalCenter
        anchors.top: leftpanel.top;
        anchors.topMargin: 15

        Text {
            id: geartext
            font.family: "Microsoft JhengHei UI"
            font.bold: true
            font.pixelSize: 37
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            text: eboat_gear == 0? "P" : eboat_gear == 1? "N" : eboat_gear == 2? "R" : eboat_gear == 3? "D" : "P"
        }
    }

    Text {
        id: mph
        visible: true
        color: "#ffffff"
        text: Math.abs(eboat_speed) % 1 == 0?Math.abs(eboat_speed).toFixed(0) : Math.abs(eboat_speed).toFixed(1)
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
        anchors.topMargin: 280
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

    Item {
        id: targetHeadingGroup
        anchors.top: seperator.bottom
        anchors.topMargin: -45
        anchors.right: leftpanel.right
        anchors.rightMargin: -50
        width: 460
        visible: false

        Image {
            id: targetheadingdown
            anchors.right: parent.right
            anchors.rightMargin: 280
            anchors.top: parent.top
            source: "/res/Down-White"
            scale: 0.2
            z: 0

            MouseArea{
                id:targetheadingdownmousearea
                anchors.fill: parent
                onClicked: targetheadingdownclicked()
            }
        }

        Text {
            id: targetheadingtext
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 0
            anchors.top: parent.top
            anchors.topMargin: 55
            text: "Target Heading"
            font {
                family: "Verdana"
                bold: true
                pointSize: 11
            }
            color: "#07edf3"
        }

        Text {
            id: targetheading
            anchors.horizontalCenter: targetheadingtext.horizontalCenter
            anchors.horizontalCenterOffset: 0
            anchors.top: targetheadingtext.bottom
            anchors.topMargin: 0
            text: targetHeading.toFixed(0)
            font {
                family: "Microsoft JhengHei UI"
                bold: true
                pointSize: 40
            }
            color: "#07edf3"
        }

        Text {
            id: targetheadingunit
            anchors.left: targetheading.right
            anchors.leftMargin: 5
            anchors.top: targetheading.top
            anchors.topMargin: 10
            text: "°"
            font {
                family: "Verdana"
                bold: true
                pointSize: 10
            }
            color: "#07edf3"
        }

        Image {
            id: targetheadingup
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 0
            source: "/res/Up-White"
            scale: 0.2
            z: 0

            MouseArea{
                id:targetheadingupmousearea
                anchors.fill: parent
                onClicked: targetheadingupclicked()
            }
        }
    }

    Item {
        id: targetSpeedGroup
        anchors.top: seperator.bottom
        anchors.topMargin: -45
        anchors.left: leftpanel.left
        anchors.leftMargin: -50
        width: 460
        visible: false

        Image {
            id: targetspeeddown
            anchors.left: parent.left
            anchors.top: parent.top
            source: "/res/Down-White"
            scale: 0.2
            z: 0
            MouseArea{
                id:targetspeeddownmousearea
                anchors.fill: parent
                onClicked:targetspeeddownclicked()
            }
        }

        Text {
            id: targetspeedtext
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 0
            anchors.top: parent.top
            anchors.topMargin: 55
            text: "Target Speed"
            font {
                family: "Verdana"
                bold: true
                pointSize: 11
            }
            color: "#07edf3"
        }

        Text {
            id: targetspeed
            anchors.horizontalCenter: targetspeedtext.horizontalCenter
            anchors.horizontalCenterOffset: 0
            anchors.top: targetspeedtext.bottom
            anchors.topMargin: 0
            text: targetSpeed.toFixed(1)
            font {
                family: "Microsoft JhengHei UI"
                bold: true
                pointSize: 40
            }
            color: "#07edf3"
        }

        Text {
            id: targetspeedunit
            anchors.left: targetspeed.right
            anchors.leftMargin: 10
            anchors.bottom: targetspeed.bottom
            anchors.bottomMargin: 15
            text: "MPH"
            font {
                family: "Verdana"
                bold: true
                pointSize: 8
            }
            color: "#07edf3"
        }

        Image {
            id: targetspeedup
            anchors.left: parent.left
            anchors.leftMargin: 280
            anchors.top: parent.top
            anchors.topMargin: 0
            source: "/res/Up-White"
            scale: 0.2
            z: 0

            MouseArea{
                id:targetspeedupmousearea
                anchors.fill: parent
                onClicked: targetspeedupclicked()
            }
        }
    }


    Column {
        id: leftmodecol
        anchors.left: leftpanel.left
        anchors.leftMargin: 40
        anchors.top: seperator.bottom
        anchors.topMargin: 200
        spacing: 60 // 子元素间的间距
        z: 3
        Rectangle {
            id: automode
            width: 125
            height: 125
            opacity: 1
            color: "#363836"
            radius: 20
            border.color: "#363836"
            border.width: 2

            Image {
                width: 75
                height: 75
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
                font.pointSize: 9
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
            width: 125
            height: 125
            color: "#363836"
            radius: 20
            border.color: "#363836"
            border.width: 2

            Image {
                width: 75
                height: 75
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
                font.pointSize: 9
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
            width: 125
            height: 125
            color: "#363836"
            radius: 20
            border.color: "#363836"
            border.width: 2

            Image {
                width: 75
                height: 75
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
                font.pointSize: 9
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
        anchors.topMargin: 300
        spacing: 60 // 子元素间的间距
        z: 3
        Rectangle {
            id: anchorsmode
            width: 125
            height: 125
            opacity: 1
            color: "#363836"
            radius: 20
            border.color: "#363836"
            border.width: 2

            Image {
                width: 75
                height: 75
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
                font.pointSize: 9
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
            width: 125
            height: 125
            color: "#363836"
            radius: 20
            border.color: "#363836"
            border.width: 2

            Image {
                width: 75
                height: 75
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
                font.pointSize: 9
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
            width: 60
            height: 60
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
            id: planviewbtn
            width: 60
            height: 60
            background: Image {
                id: planviewbtnimage
                source: planviewBtnState == 1?"/res/planview-Green" : "/res/planview-White"
                fillMode: Image.PreserveAspectFit // 保持图片比例
            }
            onClicked:{
                planviewbtnclicked();
            }
        }

        Button {
            id: switchbtn
            width: 60
            height: 60
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
            width: 60
            height: 60
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
            width: 60
            height: 60
            background: Image {
                id: alarmbtnimage
                source: "/res/Alarm-White"
                fillMode: Image.PreserveAspectFit // 保持图片比例
            }
            onClicked: {
                alarmbtnclicked();
            }
        }
        z: 3
    }


    EBoat3DModel {
        id: _model3D
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 250
        visible:true
        scale: 1.2
        z:3

    }

    Image {
        id: boatbackground
        anchors.centerIn: leftpanel
        source: "/res/ocean"
        anchors.verticalCenterOffset: 150
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
