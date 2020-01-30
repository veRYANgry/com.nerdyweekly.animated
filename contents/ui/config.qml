import QtQuick 2.5
import org.kde.plasma.core 2.0 as PlasmaCore
import QtQuick.Controls 1.0 as QtControls
import QtQuick.Dialogs 1.1 as QtDialogs
import QtGraphicalEffects 1.0
Column {
    id: root
    property alias cfg_Blur: blurCheckBox.checked
    property string cfg_Video
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

            AnimatedImage {
                id: animation
                source: cfg_Video
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
    }

    QtDialogs.FileDialog {
    id: fileDialog
    title: "Pick a gif file"
    nameFilters: [ "Gif files (*.gif)", "All files (*)" ]
    onAccepted: {
        cfg_Video = fileDialog.fileUrls[0]
        cfg_Folder = fileDialog.folder
    }
}
}
