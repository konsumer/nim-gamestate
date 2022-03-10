# base-class other scenes are built on
type
  Scene* = ref object of RootObj
  SceneMenu* = ref object of Scene
  SceneIntro* = ref object of Scene

# this is the global current scene
var scene*: Scene

# do all initialization
method load*(this:Scene) {.base.} =
  discard

# called in update-loop
method update*(this:Scene, time: float) {.base.} =
  discard

# called when this is unloaded
method unload*(this:Scene) {.base.} =
  discard

# switch to a new scene
method set_scene*(this:Scene, s:Scene) {.base.} =
  this.unload()
  scene = s
  scene.load()


# do all initialization
method load*(this:SceneMenu) =
  echo "loaded SceneMenu"

# called in update-loop
method update*(this:SceneMenu, time: float) =
 echo "update SceneMenu"

# called when this is unloaded
method unload*(this:SceneMenu) =
  echo "unloaded SceneMenu"


# do all initialization
method load*(this:SceneIntro) =
  echo "loaded SceneIntro"

# called in update-loop
method update*(this:SceneIntro, time: float) =
  echo "update SceneIntro"
  if time > 30:
    echo "switch to menu"
    this.set_scene(SceneMenu())
  else:
    echo "wait..."

# called when this is unloaded
method unload*(this:SceneIntro) =
  echo "unloaded SceneIntro"


# TEST LOOP
import std/[times, os]

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
