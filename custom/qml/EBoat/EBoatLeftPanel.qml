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
    id: rect

    Image {
        source: "/res/background1"
        anchors.fill:parent
        fillMode: Image.Stretch
    }

    EBoat3DModel {
        id: _model3D
        anchors.fill: parent
        visible: true
    }
}
