package = "awesome-autostart"
version = "1.0-1"
source = {
   url = "git://github.com/warptozero/awesome-autostart",
   tag = "v1.0"
}
description = {
   summary = "A fast run-only-once autostart module for Awesome WM",
   homepage = "https://github.com/warptozero/awesome-autostart",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1"
}
supported_platforms = { "linux" }
build = {
   type = "builtin",
   modules = {
      autostart = "autostart.lua" 
   }
}
