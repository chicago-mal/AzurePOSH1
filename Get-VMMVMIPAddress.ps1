param
(
	[parameter(Mandatory = $true)]
	[string]$VMMServerName
)

# Create a new session to the target machine where the VMM Administrator Console (the snapin/module) is installed
$session = New-PSSession $VMMServerName

# Load the VMM cmdlets in the PS Session
Invoke-command $session { Import-Module virtualmachinemanager } 

# Import the get-vmmserver and the get-vm cmdlets from the remote pssession into the current session
$vmmcmdletstoimport = @("get-vmmserver", "get-vm")
Import-PSSession $session –CommandName $vmmcmdletstoimport

# Connect to the VMM Server
Get-VMMServer $VMMServerName

# Get the IP address of the last VMRole deployed via the tenant so you can browse to it
# The Read-SCVirtualMachine command is necessary to do a refresh on the VM so the IP appears
Invoke-Command -ScriptBlock { Get-SCVirtualMachine | sort AddedTime -Descending | select -First 1 | Read-SCVirtualMachine | Get-SCVirtualNetworkAdapter | ft Name,IPv4Addresses -AutoSize} -Session $session
# Invoke-Command -ScriptBlock { Get-SCVirtualMachine -Name firstvm01 | Get-SCVirtualNetworkAdapter | ft Name,IPv4Addresses -AutoSize} -Session $session