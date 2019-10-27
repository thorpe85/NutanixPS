$myvarLoaded = Get-PSSnapin -Name NutanixCmdletsPSSnapin -ErrorAction SilentlyContinue | % {$_.Name}
if ($myvarLoaded -eq $null){Add-PSSnapin NutanixCmdletsPSSnapin}
#Cluster Credentials
$ipAddress = "192.168.1.10"
$clusterUserName = "admin"
$Secure_String_Pwd = ConvertTo-SecureString "nutanix/4u" -AsPlainText -Force
Connect-NutanixCluster -Server $ipAddress -UserName $clusterUserName  -Password $Secure_String_Pwd -AcceptInvalidSSLCerts -ForcedConnection
$vm = Get-NTNXVM -SearchString "my-VM" 
Set-NTNXVMPowerOff -Vmid $vm.vmId
