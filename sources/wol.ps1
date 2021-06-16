function launchwol 
{
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $True, Position = 1)]
    [string] $mac,
    [string] $ip, 
    [int] $port = 7
  )
 
  $mac = (($mac.replace(":", "")).replace("-", "")).replace(".", "")
  $target = 0, 2, 4, 6, 8, 10 | % {[convert]::ToByte($mac.substring($_,2),16)}
  $packet = (,[byte] 255 * 6) + ($target * 16)
 
  $UDPclient = new-Object System.Net.Sockets.UdpClient
  $UDPclient.Connect($ip, $port)
  [void]$UDPclient.Send($packet, 102)
}

# mac and broadcast in tcp/ipv4 format
launchwol -mac XX-XX-XX-XX-XX-XX -ip 192.168.1.255
Start-Sleep -s 12

launchwol -mac XX-XX-XX-XX-XX-XX -ip 192.168.1.255
Start-Sleep -s 12

launchwol -mac XX-XX-XX-XX-XX-XX -ip 192.168.1.255
Start-Sleep -s 12

launchwol -mac XX-XX-XX-XX-XX-XX -ip 192.168.1.255
