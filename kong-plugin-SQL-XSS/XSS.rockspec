package = "kong-plugin-SQL-XSS"
version = "1.0-3"

source = {
  url = "https://github.com/arockiyastephenl/kong-prevent-SQL-XSS"
}

description = {
  summary = "Prevent SQL injuction and Xss Attack.",
  license = ""
}

dependencies = {
  "lua ~> 5.1"
}

build = {
  type = "builtin",
  modules = {
    ["kong.plugins.kong-plugin-SQL-XSS.handler"] = "plugin/handler.lua",
    ["kong.plugins.kong-plugin-SQL-XSS.schema"] = "plugin/schema.lua",
  }
}
