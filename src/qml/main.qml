import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import "main"
import "../js/utils.js" as Utils
import "../js/scene.js" as Scene

ApplicationWindow {
    id: mainRoot
    property var scene: new Scene.Scene()
    property var logger: new Utils.Logger()
    property alias sysPalette: sysPalette
    property string projectPath
    title: Qt.application.name + (projectPath ? String(" [%1]").arg(projectPath) : "")
    width: Settings.value("MainWindow", "width", 800)
    height: Settings.value("MainWindow", "height", 600)
    visible: true
    menuBar: MainMenu { id: mainMenu }

    Component.onCompleted: {
        x = Settings.value("MainWindow", "x", (Screen.width - width) / 2)
        y = Settings.value("MainWindow", "y", (Screen.height - height) / 2)
        Utils.loadGui()
        Utils.loadRecentPaths("RecentFiles", mainMenu.recentFilesModel)
        Utils.loadRecentPaths("RecentProjects", mainMenu.recentProjectsModel)
        Utils.loadSession()
    }

    onClosing: {
        Utils.saveGeometry("MainWindow")
        Utils.saveGui()
        Utils.saveRecentPaths("RecentFiles", mainMenu.recentFilesModel)
        Utils.saveRecentPaths("RecentProjects", mainMenu.recentProjectsModel)
        Utils.saveSession()
    }

    SystemPalette {
        id: sysPalette
        colorGroup: SystemPalette.Active
    }

    SplitView {
        anchors.fill: parent
        visible: projectPath

        ProjectTreeView {
            id: projectTreeView
            Layout.minimumWidth: 50
            width: Settings.value("Gui", "projectTreeWidth", 200)
        }

        TabView {
            id: tabView
            Layout.fillWidth: true
            Layout.fillHeight: true
            frameVisible: false
        }
    }
}
