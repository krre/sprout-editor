import QtQuick 2.5
import Qt3D.Renderer 2.0
import "../entities"

EntityBase {
    property alias arg: arg.text
    objectName: "module"
    mesh: CylinderMesh {
        radius: 3
        length: 6
    }

    Text3D {
        id: arg
        x: 2
        y: 2
    }
}