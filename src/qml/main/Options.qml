import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2
import "../../js/utils.js" as Utils

Dialog {
    id: root
    title: qsTr("Options")
    width: 400
    height: 200
    visible: true
    modality: Qt.ApplicationModal
    standardButtons: StandardButton.Ok | StandardButton.Cancel

    Component.onCompleted: {
        sproutPath.text = SETTINGS.sproutPath()
        session.checked = SETTINGS.autoLoadSession()
    }

    onVisibilityChanged: if (!visible) root.destroy()
    onAccepted: {
        SETTINGS.setSproutPath(sproutPath.text)
        SETTINGS.setAutoLoadSession(session.checked)
    }

    GridLayout {
        width: parent.width
        rows: 2
        columns: 3

        Label {
            text: qsTr("Sprout Path:")
        }

        TextField {
            id: sproutPath
            Layout.fillWidth: true
        }

        Button {
            implicitWidth: 30
            text: "..."
            onClicked: {
                var fileDialog = Utils.createDynamicObject(mainRoot, "qrc:/qml/components/filedialog/FileDialogOpen.qml", { nameFilters: [ qsTr("All files (*)") ] })
                fileDialog.accepted.connect(function() {
                    sproutPath.text = UTILS.urlToPath(fileDialog.fileUrl)
                })
            }
        }

        CheckBox {
            id: session
            text: qsTr("Autoload Session")
            Layout.columnSpan: 2
        }
    }
}
