local BasePlugin = require "kong.plugins.base_plugin"
local cjson = require "cjson"

local MyPlugin = BasePlugin:extend()

MyPlugin.PRIORITY = 1000

function MyPlugin:new()
  MyPlugin.super.new(self, "my-plugin")
end

function MyPlugin:access(config)
  MyPlugin.super.access(self)

  -- Prevent SQL injection
  if ngx.req.get_method() == "POST" then
    ngx.req.read_body()
    local post_args = ngx.req.get_post_args()
    for k, v in pairs(post_args) do
      if type(v) == "string" and string.match(v, "select") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "insert into") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "delete from") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "update set") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "drop table") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "union select") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "exec") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "xp_cmdshell") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "sp_configure") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "sp_executesql") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "sp_") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "xp_") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "dbcc_") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "systables") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "syscolumns") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "information_schema") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "master") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "backup") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "restore") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      if type(v) == "string" and string.match(v, "SELECT") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      
      if type(v) == "string" and string.match(v, "INSERT INTO") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      
      if type(v) == "string" and string.match(v, "DELETE FROM") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      
      if type(v) == "string" and string.match(v, "UPDATE SET") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      
      if type(v) == "string" and string.match(v, "DROP TABLE") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      
      if type(v) == "string" and string.match(v, "UNION SELECT") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      
      if type(v) == "string" and string.match(v, "EXEC") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      
      if type(v) == "string" and string.match(v, "XP_CMDShell") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      
      if type(v) == "string" and string.match(v, "SP_CONFIGURE") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      
      if type(v) == "string" and string.match(v, "SP_EXECUTESQL") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      
      if type(v) == "string" and string.match(v, "SP_") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
      
      if type(v) == "string" and string.match(v, "XP_") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end

      if type(v) == "string" and string.match(v, "DBCC_") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end

      if type(v) == "string" and string.match(v, "SYSTABLES") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end

      if type(v) == "string" and string.match(v, "INFORMATION_SCHEMA") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end

      if type(v) == "string" and string.match(v, "MASTER") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end

      if type(v) == "string" and string.match(v, "BACKUP") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end

      if type(v) == "string" and string.match(v, "RESTORE") then
        ngx.log(ngx.ERR, "SQL injection detected in post arg '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end

    end
  end

  -- Prevent XSS attacks
  if ngx.ctx.response_body then
    local decoded_body = cjson.decode(ngx.ctx.response_body)
    for k, v in pairs(decoded_body) do
      if type(v) == "string" and string.match(v, "<.+>") then
        ngx.log(ngx.ERR, "XSS attack detected in response body '", k, "': '", v, "'")
        return ngx.exit(ngx.HTTP_BAD_REQUEST)
      end
    end
  end
end

return MyPlugin