import QtQuick 2.5
import OsgBridge 1.0 as Osg

UnitBase {
    type: "instruction"
    title: qsTr("Instruction")
    color: "yellow"
    shape: Osg.Sphere {
        radius: 0.1
    }
}