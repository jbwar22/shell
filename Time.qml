import Quickshell
import QtQuick

Scope {
  id: root
  property string time: Qt.locale('ja_JP').toString(clock.date, 'hh:mm:ss yyyy年MM月dd日 (ddd)')

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}

