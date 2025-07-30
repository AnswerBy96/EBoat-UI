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
    id: chargingpanel
    color: "#faffff" // 白色背景

    z:1

    // property real testCurrent : 60
    // property real testVoltage : 48

    property var _activeVehicle: QGroundControl.multiVehicleManager.activeVehicle
    property real eboat_batterysoc: _activeVehicle? _activeVehicle.eboatBatterySoc : 0
    property real eboat_batteryCurrent: _activeVehicle? _activeVehicle.eboatBatteryCurrent : 0
    property real eboat_batteryVoltage: _activeVehicle? _activeVehicle.eboatBatteryVoltage : 0
    property int remainingTime: 0
    property real chargepower: 0.0
    property int capacity_ah: 280
    property int cv_time_estimate : 30
    property real soc : 0

    function calremainingTime()
    {
        soc = eboat_batterysoc / 100.0;  // 转换为0~1的比例

        if (eboat_batteryCurrent <= 0)
            return 0; // 电流为0，无法充电

        if (soc < 0.9) {
            remainingTime = (0.9 - soc) * capacity_ah / eboat_batteryCurrent;
            return remainingTime * 60 + cv_time_estimate;
        } else if (soc < 1.0) {
            // 已进入恒压阶段，剩余时间按线性比例缩放
            return cv_time_estimate * (1.0 - soc) / 0.1;
        } else {
            return 0.0; // SOC = 100%，充电完成
        }
    }

    Item {
        id: batteryContainer
        width: 900
        height: 450
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 0

        // 电池背面（深色部分，表示厚度）
        Rectangle {
            id: batteryBack
            width: 800
            height: 400
            color: "#cdced3"
            radius: 20
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -12
            anchors.verticalCenterOffset: 10


            Rectangle {
                anchors.fill: parent
                radius: parent.radius
                opacity: 0.1
                gradient: Gradient {
                    GradientStop {
                        position: 0.0
                        color: "white"
                    }
                    GradientStop {
                        position: 0.5
                        color: "transparent"
                    }
                    GradientStop {
                        position: 1.0
                        color: "white"
                    }
                }
                rotation: 45
            }
        }

        // 电池主体（正面）
        Rectangle {
            id: batteryBody
            width: 800
            height: 400
            color: "#222335"
            radius: 20
            anchors.centerIn: parent

            // 表面条纹
            Repeater {
                model: 13 // 条纹数量
                delegate: Rectangle {
                    width: batteryBody.width - 20
                    height: 2
                    color: index % 2 ? "#707070" : "#d0d0d0" // 深浅条纹交替
                    y: 15 + index * 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    radius: 1

                    // 条纹3D效果
                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "#40ffffff"
                        anchors.top: parent.top
                        visible: index % 2 === 0
                    }
                }
            }

            // 电量填充
            Rectangle {
                id: batteryFill
                width: (batteryBody.width - 20) * (eboat_batterysoc / 100 )
                height: batteryBody.height - 20
                radius: 15
                anchors {
                    left: batteryBody.left
                    leftMargin: 10
                    verticalCenter: batteryBody.verticalCenter
                }

                // 根据电量水平动态改变颜色
                color: {
                    if (eboat_batterysoc <= 15) {  // 0-15%: 红色（危险电量）
                        return "#ff3b30"
                    } else if (eboat_batterysoc <= 40) {  // 15-30%: 橙色（低电量）
                        return "#ff9500"
                    } else {  // 40%以上: 绿色（充足电量）
                        return "#34c759"
                    }
                }

                // 顶部高光增强3D效果
                Rectangle {
                    width: parent.width
                    height: 8
                    color: "#88ffffff"
                    radius: 4
                    anchors.top: parent.top
                }

                // 充电动画效果
                SequentialAnimation {
                    running: true
                    loops: Animation.Infinite
                    PropertyAnimation {
                        target: batteryFill
                        property: "opacity"
                        from: 0.9
                        to: 0.6
                        duration: 1000
                        easing.type: Easing.InOutQuad
                    }
                    PropertyAnimation {
                        target: batteryFill
                        property: "opacity"
                        from: 0.6
                        to: 0.9
                        duration: 1000
                        easing.type: Easing.InOutQuad
                    }
                }
            }

            // 电量百分比文字
            Text {
                text: Math.floor(eboat_batterysoc) + "%"
                color: "#ffffff"
                font.pixelSize: 90
                font.bold: true
                font.family: "Microsoft JhengHei UI"
                anchors.centerIn: parent
                z: 2
            }
        }

        // 电池前部高光（增强3D感）
        Rectangle {
            width: batteryBody.width - 10
            height: batteryBody.height - 10
            color: "transparent"
            radius: 18
            border {
                width: 2
                color: "#40ffffff"
            }
            anchors.centerIn: batteryBody
        }
    }

    // 充电状态文字
    Text {
        id: chargingtext
        text: "Charging"
        color: "#000000"
        font.pixelSize: 85
        font.bold: true
        font.family: "Times New Roman"
        anchors {
            top: chargingpanel.top
            left: chargingpanel.left
            leftMargin: 100
        }

        Image {
            id: chargeimg
            source: "/res/Charging-Green"
            fillMode: Image.PreserveAspectFit
            scale: 1.1
            anchors {
                top: parent.top
                right: parent.left
                rightMargin: 0
                verticalCenter: parent.verticalCenter
            }
        }
    }

    // 预计充电时间
    Text {
        id: remainingTimetext
        text: "Time Remaining"
        color: "#000000"
        font.pixelSize: 40
        font.bold: true
        font.family: "Times New Roman"
        anchors {
            top: chargingtext.bottom
            topMargin: 70
            left: chargingtext.left
            leftMargin: 0
        }
    }

    Text {
        color: "#fc0505"
        text: Math.floor(calremainingTime()) + " Min"
        font.pixelSize: 65
        font.bold: true
        font.family: "Microsoft JhengHei UI"
        anchors {
            top: remainingTimetext.bottom
            topMargin: 10
            left: remainingTimetext.left
            leftMargin: 0
        }
    }

    // 充电信息面板
    Row {
        anchors {
            top: batteryContainer.bottom
            topMargin: 150
            horizontalCenter: batteryContainer.horizontalCenter
        }
        spacing: 250

        // 充电电流
        Text {
            text: "Charging Current :"
            color: "#000000"
            font.pixelSize: 40
            font.bold: true
            font.family: "Times New Roman"

            Text {
                text: " " + eboat_batteryCurrent.toFixed(2) + " A"
                color: "#fd0404"
                font.pixelSize: 40
                font.bold: true
                font.family: "Microsoft JhengHei UI"
                anchors.left: parent.right
                anchors.bottom: parent.bottom
                anchors.centerIn: parent.Center
            }
        }

        // 充电电压
        Text {
            text: "Charging Voltage :"
            color: "#000000"
            font.pixelSize: 40
            font.bold: true
            font.family: "Times New Roman"

            Text {
                text: " " + eboat_batteryVoltage.toFixed(2) + " V"
                color: "#fd0404"
                font.pixelSize: 40
                font.bold: true
                font.family: "Microsoft JhengHei UI"
                anchors.left: parent.right
                anchors.bottom: parent.bottom
                anchors.centerIn: parent.Center
            }
        }

        Text {
            text: "Charging Power :"
            color: "#000000"
            font.pixelSize: 40
            font.bold: true
            font.family: "Times New Roman"
            Text {
                text: " " + (eboat_batteryVoltage.toFixed(2) * eboat_batteryCurrent.toFixed(2)) + " W"
                color: "#fd0404"
                font.pixelSize: 40
                font.bold: true
                font.family: "Microsoft JhengHei UI"
                anchors.left: parent.right
                anchors.bottom: parent.bottom
                anchors.centerIn: parent.Center
            }
        }
    }
}
