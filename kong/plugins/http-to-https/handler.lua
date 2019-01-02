local BasePlugin = require "kong.plugins.base_plugin"
local responses  = require "kong.tools.responses"

local HttpHandler = BasePlugin:extend()

function HttpHandler:new()
  HttpHandler.super.new(self, "http-to-https")
end

function HttpHandler:access(conf)
  HttpHandler.super.access(self)

  local headers = ngx.req.get_headers()
  local proto

  if headers["x-forwarded-proto"] then
    proto = headers["x-forwarded-proto"]
  else
    proto = ngx.var.scheme
  end

  if proto ~= "https" then
    local host = ngx.var.host
    local uri = ngx.var.request_uri

    return ngx.redirect("https://" .. host .. uri, ngx.HTTP_MOVED_PERMANENTLY)
  end
end

return HttpHandler
