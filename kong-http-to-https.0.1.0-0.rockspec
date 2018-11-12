package = "kong-http-to-https"
version = "0.1.0-0"
source = {
    url = "https://github.com/ingresse/kong-plugin-http-to-https",
    branch = "master"
}
description = {
    summary = "Kong plugin to redirect HTTP requests to HTTPS",
    detailed = [[
      Kong plugin to redirect HTTP requests to HTTPS with 301 status.
    ]],
    homepage = "https://github.com/ingresse/kong-plugin-http-to-https",
    license = "MIT"
}
dependencies = {}
build = {
    type = "builtin",
    modules = {
      ["kong.plugins.kong-http-to-https.handler"] = "src/handler.lua",
      ["kong.plugins.kong-http-to-https.schema"] = "src/schema.lua",
    }
}
