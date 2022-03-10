import std/[times, os]
import scene
import scene_intro

scene = SceneIntro()
scene.load()

var keep_looping = true

echo "Press Ctrl-C to quit."

proc ctrlc() {.noconv.} =
  keep_looping = false
setControlCHook(ctrlc)

while keep_looping:
  sleep(1000) 
  scene.update(cpuTime() * 10000)

scene.unload()