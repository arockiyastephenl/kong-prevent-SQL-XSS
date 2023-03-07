local strings_to_match = {
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
  
  local line = "restoreThis is a line containing aDROP TABLE statement insert"
  
  local match_found = false
  for _, str in ipairs(strings_to_match) do
    if string.find(line, str) then
      print("Matched string: " .. str)
      match_found = true
    end
  end
  
  if not match_found then
    print("No match found")
  end