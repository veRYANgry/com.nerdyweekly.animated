import QtQuick 2.5
import org.kde.plasma.core 2.0 as PlasmaCore
import QtQuick.Controls 1.0 as QtControls
import QtQuick.Dialogs 1.1 as QtDialogs
import QtGraphicalEffects 1.0
Column {
    id: root
    property alias cfg_Blur: blurCheckBox.checked
    property string cfg_Video1
    property string cfg_Video2
    property string cfg_Video3
    property string cfg_Video4

    property string cfg_Folder

    Row {
        id: blurRow
        spacing: units.largeSpacing / 3

        QtControls.Label {
            width: formAlignment - units.largeSpacing

            anchors.verticalCenter: blurCheckBox.verticalCenter
            horizontalAlignment: Text.AlignRight
        }

        QtControls.CheckBox {
            id: blurCheckBox
            property int textLength: 11
            width: theme.mSize(theme.defaultFont).width * textLength
            text: "Enable blur"
        }
    }

    Row {
        id: previewRow
        spacing: units.largeSpacing / 3
        y: blurRow.height

        Rectangle {
            color: "#00050a"
                width: 200
                height: 140

            AnimatedImage {
                id: animation
                source: cfg_Video1
                fillMode: Image.PreserveAspectFit
                smooth: false
                cache: true
            }

            FastBlur {
                id: blur
                visible: cfg_Blur
                anchors.fill: animation

                source: animation
                radius: 50
            }
        }
    }

    Row {
        id: blurRow22
        spacing: units.largeSpacing / 3
        y: previewRow.height

        Rectangle {
                width: 256
                height: 144
                color: "transparent"
                PlasmaCore.IconItem {
                    source: "org.kde.plasma.clipboard"
                    anchors.fill: parent
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {fileDialog.folder = cfg_Folder; fileDialog.open() }
                    }
                }
            }

            Rectangle {
                width: 256
                height: 144
                color: "transparent"
                PlasmaCore.IconItem {
                    source: "org.kde.plasma.clipboard"
                    anchors.fill: parent
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {fileDialog2.folder = cfg_Folder; fileDialog2.open() }
                    }
                }
            }
                        Rectangle {
                width: 256
                height: 144
                color: "transparent"
                PlasmaCore.IconItem {
                    source: "org.kde.plasma.clipboard"
                    anchors.fill: parent
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {fileDialog3.folder = cfg_Folder; fileDialog3.open() }
                    }
                }
            }
                        Rectangle {
                width: 256
                height: 144
                color: "transparent"
                PlasmaCore.IconItem {
                    source: "org.kde.plasma.clipboard"
                    anchors.fill: parent
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {fileDialog4.folder = cfg_Folder; fileDialog4.open() }
                    }
                }
            }
    }

    QtDialogs.FileDialog {
    id: fileDialog
    title: "Pick a gif file"
    nameFilters: [ "Gif files (*.gif)", "All files (*)" ]
    onAccepted: {
        cfg_Video1 = fileDialog.fileUrls[0]
        cfg_Folder = fileDialog.folder
    }
    }

    QtDialogs.FileDialog {
    id: fileDialog2
    title: "Pick a gif file"
    nameFilters: [ "Gif files (*.gif)", "All files (*)" ]
    onAccepted: {
        cfg_Video2 = fileDialog2.fileUrls[0]
        cfg_Folder = fileDialog2.folder
    }
    }

        QtDialogs.FileDialog {
    id: fileDialog3
    title: "Pick a gif file"
    nameFilters: [ "Gif files (*.gif)", "All files (*)" ]
    onAccepted: {
        cfg_Video3 = fileDialog3.fileUrls[0]
        cfg_Folder = fileDialog3.folder
    }
    }

        QtDialogs.FileDialog {
    id: fileDialog4
    title: "Pick a gif file"
    nameFilters: [ "Gif files (*.gif)", "All files (*)" ]
    onAccepted: {
        cfg_Video4 = fileDialog4.fileUrls[0]
        cfg_Folder = fileDialog4.folder
    }
    }
}
