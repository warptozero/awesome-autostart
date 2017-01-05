package = "awesome-autostart"
version = "v1.0"
source = {
   url = "git://github.com/warptozero/awesome-autostart",
   tag = "v1.0"
}
description = {
   homepage = "https://github.com/warptozero/awesome-autostart",
   license = "MIT"
}
dependencies = {}
build = {
   type = "builtin",
   modules = {
      autostart = "autostart.lua" 
   }
}
