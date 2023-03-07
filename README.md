# Kong Plugin: Prevent SQL injuction and XSS Attack
![alt text](https://github.com/arockiyastephenl/kong-prevent-SQL-XSS/blob/master/banner-jwt2header.png "Kong prvent SQL/XSS")

The plugin you are describing is likely a security plugin that is designed to prevent SQL injection and cross-site scripting (XSS) attacks on a web application.

SQL injection is a type of attack where an attacker inserts malicious SQL code into a web application's input fields or parameters, which can then be executed by the application's database. This can allow the attacker to access sensitive information or manipulate the database in unintended ways.

Similarly, cross-site scripting (XSS) is a type of attack where an attacker injects malicious scripts into a web application, which are then executed by unsuspecting users who visit the affected page. This can allow the attacker to steal sensitive user data or perform actions on the user's behalf.

To prevent these types of attacks, the security plugin you are describing likely intercepts incoming HTTP requests to the web application and scans the request body for any potentially malicious SQL code or scripts. If any such code or scripts are detected, the plugin will block the request and return a 400 bad request error, indicating that the request was malformed or contained malicious code.

If no malicious code or scripts are detected, the plugin will allow the request to proceed to the upstream server, which will process the request and return a response. The security plugin will then inspect the response from the upstream server to ensure that it does not contain any malicious code or scripts before sending it back to the user.

Overall, this plugin helps to ensure the security of a web application by detecting and blocking potential SQL injection and XSS attacks, which can help to prevent data breaches and other security incidents.

## Blocking Keywords:

```javascript
local strings_to_match = {
    "select",
    "insert into",
    "INSERT INTO",
    "update set",
    "UPDATE SET",
    "delete from",
    "DELETE FROM",
    "drop table",
    "DROP TABLE",
    "union select",
    "UNION SELECT",
    "exec",
    "EXEC",
    "xp_cmdshell",
    "XP_CMDSHELL",
    "sp_configure",
    "SP_CONFIGURE",
    "sp_executesql",
    "SP_EXECUTESQL",
    "sp_",
    "SP_",
    "xp_",
    "XP_",
    "dbcc_",
    "DBCC_",
    "systables",
    "SYSTABLES",
    "syscolumns",
    "SYSCOLUMNS",
    "information_schema",
    "INFORMATION_SCHEMA",
    "master",
    "MASTER",
    "backup",
    "BACKUP",
    "restore",
    "RESTORE"
  }

```

## Installation

### Manual

1. To manually install plugin, create directory called `/usr/local/share/lua/5.1/kong/plugins/my-plugin` on Kong node and copy contents of `/plugins` directory there.
2. Update your KONG_PLUGINS environment variable or configuration to include `my-plugin`
3. Restart Kong and you're ready to go.

If you are using Docker, a helpful script is included to help deploy the plugin to a Docker container and reload Kong with proper env variables.



