import QtQuick 2.5
import org.kde.plasma.core 2.0 as PlasmaCore
import QtGraphicalEffects 1.0
import org.kde.kwindowsystem 1.0 as KWindowSystem


Item {
    id: root

    property var act_image

    AnimatedImage {
        id: animation
        source: act_image
        fillMode: Image.Stretch
        width: root.width
        height: root.height
        smooth: false
        cache: true
    }
    Component.onCompleted: {
    handleDesktopChanged();
}


    KWindowSystem.KWindowSystem {
	id: kWindowSystem
    onCurrentDesktopChanged: handleDesktopChanged()
    }

    function handleDesktopChanged() {

    switch(kWindowSystem.currentDesktop){
        case 0:{
        act_image = wallpaper.configuration.Video1;
        break;
        }
        case 1:{
        act_image = wallpaper.configuration.Video2;
        break;
        }
        case 2:{
        act_image = wallpaper.configuration.Video3;
        break;
        }
        case 3:{
        act_image = wallpaper.configuration.Video4;
        break;
        }
        default: {
        act_image = wallpaper.configuration.Video1;
        break;
        }
    }
}

    FastBlur {
        id: blur
        visible: wallpaper.configuration.Blur
        anchors.fill: animation

        source: animation
        radius: 50
    }
}
