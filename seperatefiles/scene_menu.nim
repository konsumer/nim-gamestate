import scene

type
  SceneMenu* = ref object of Scene

# do all initialization
method load*(this:SceneMenu) =
  echo "loaded SceneMenu"

# called in update-loop
method update*(this:SceneMenu, time: float) =
 echo "update SceneMenu"

# called when this is unloaded
method unload*(this:SceneMenu) =
  echo "unloaded SceneMenu"