import Quickshell
import Quickshell.Io

Scope {
  required property var volumeControls

  IpcHandler {
    id: fooipc
    target: "main"
    function volume(c: string): void {
      if (c == 'up') volumeControls.setVolume(volumeControls.volume + 5)
      if (c == 'down') volumeControls.setVolume(volumeControls.volume - 5)
    }
  }
}
