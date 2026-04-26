import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Scope {

  PwObjectTracker {
    objects: Pipewire.defaultAudioSink ? [ Pipewire.defaultAudioSink ] : []
  }

  property var controls: { return {
    hasAudio: !!Pipewire.defaultAudioSink,
    volume: Math.round((Pipewire.defaultAudioSink?.audio.volume ?? 0) * 100),
    setVolume: (num) => {
      if (Pipewire.defaultAudioSink) {
        let vol = Math.max(0, Math.min(100, Math.round(num)))
        Pipewire.defaultAudioSink.audio.volume = vol / 100
      }
    },
    muted: Pipewire.defaultAudioSink?.audio.muted ?? false,
    setMuted: (val) => {
      if (Pipewire.defaultAudioSink) {
        Pipewire.defaultAudioSink.audio.muted = val
      }
    }
  }}
}
