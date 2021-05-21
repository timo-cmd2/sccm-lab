cd \\s-sccm-01\r$\Repository\SourceIn\Applications
Get-ChildItem -Recurse $pwd | Where-Object {$_.Extension -ilike ".xml"} | Foreach-Object {$_.FullName} | > %TEMP%\ressources.txt
