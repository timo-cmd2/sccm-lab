Get-ChildItem -Recurse $pwd | Where-Object {$_.Extension -ilike "Package.yaml"} | Foreach-Object {$_.FullName} | > %TEMP%\ressources.txt
