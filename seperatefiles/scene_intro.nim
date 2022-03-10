import scene
import scene_menu

type
  SceneIntro* = ref object of Scene

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