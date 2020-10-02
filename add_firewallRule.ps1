$remoteport = bash.exe -c "ip a s dev eth0 | grep 'inet '"
$found = $remoteport -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';
echo $matches[0];

New-NetFirewallRule -DisplayName "WSL 2 Firewall Unlock" -Direction Inbound  -LocalAddress $matches[0] -Action Allow
New-NetFirewallRule -DisplayName "WSL 2 Firewall Unlock" -Direction Outbound  -LocalAddress $matches[0] -Action Allow
