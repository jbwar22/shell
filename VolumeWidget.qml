import Quickshell
import Quickshell.Services.Pipewire
import QtQuick


Item {
  id: root
  required property var controls
  required property var screenSettings

  height: root.screenSettings.barHeight
  implicitWidth: twrap.implicitWidth

  MouseArea {
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    hoverEnabled: true
    onClicked: (e) => {
      if (e.button == Qt.LeftButton) {
        controls.setMuted(!controls.muted)
      }
    }

    onWheel: (e) => {
      if (e.angleDelta.y > 0) controls.setVolume(controls.volume + 5)
      if (e.angleDelta.y < 0) controls.setVolume(controls.volume - 5)
    }
  }

  Item {
    id: twrap
    implicitHeight: text.implicitHeight
    implicitWidth: text.implicitWidth

    y: parent.height - height - root.screenSettings.baseline

    Text {
      id: text
      text: {
        let vtext = "V"
        if (controls.muted) {
           vtext += '-M'
        } else if (controls.volume == '100') {
          vtext += 'XX'
        } else if (controls.volume.length == 1) {
          vtext += '0' + controls.volume
        } else {
          vtext += controls.volume
        }
        return vtext
      }

      color: "#FFFFFF"
      font {
        pixelSize: root.screenSettings.fontSize
        family: "Noto Sans Mono"
      }
    }
  }
}
