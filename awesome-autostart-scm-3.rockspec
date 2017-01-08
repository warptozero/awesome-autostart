package = "awesome-autostart"
version = "scm-3"
source = {
   url = "git://github.com/warptozero/awesome-autostart",
}
description = {
   summary = "A fast run-only-once autostart module for Awesome WM",
   homepage = "https://github.com/warptozero/awesome-autostart",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1",
   "luafilesystem"
}
supported_platforms = { "linux" }
build = {
   type = "builtin",
   modules = {
      autostart = "autostart.lua" 
   }
}
