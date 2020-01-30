import QtQuick 2.5
import org.kde.plasma.core 2.0 as PlasmaCore
import QtGraphicalEffects 1.0

Item {
    id: root
    AnimatedImage {
        id: animation
        source: wallpaper.configuration.Video
        fillMode: Image.Stretch
        width: root.width
        height: root.height
        smooth: false
        cache: true
    }

    FastBlur {
        id: blur
        visible: wallpaper.configuration.Blur
        anchors.fill: animation

        source: animation
        radius: 50
    }
}
