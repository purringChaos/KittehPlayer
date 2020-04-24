import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.2
import QtQuick.Window 2.2
import Qt.labs.settings 1.0
import QtGraphicalEffects 1.0

import QtQuick 2.0

Control {
    id: root
    hoverEnabled: true
    property alias iconSource: buttonImage.source
    property alias containsMouse: mouseArea.containsMouse

    background: null

    focusPolicy: Qt.NoFocus

    signal clicked
    leftPadding: root.height / (appearance.themeName == "Niconico" ?  2.5 : 12)
    rightPadding: root.leftPadding

    contentItem: Image {
        id: buttonImage
        smooth: true
        fillMode: Image.PreserveAspectFit
        sourceSize.height: Math.floor(root.parent.height / (appearance.themeName == "Niconico" ? 2 : 1.25))
        sourceSize.width: Math.floor(root.parent.height / (appearance.themeName == "Niconico" ? 2 : 1.25))
        ColorOverlay {
            id: colorOverlay
            anchors.fill: parent
            source: parent
            color: getAppearanceValueForTheme(appearance.themeName, "buttonColor")
            Binding on color {
                when: root.hovered
                value: root.hovered ? getAppearanceValueForTheme(
                             appearance.themeName,
                             "buttonHoverColor") : getAppearanceValueForTheme(
                             appearance.themeName, "buttonColor")
            }
        }
    }


    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        propagateComposedEvents: true
        onClicked: root.clicked()
    }
}