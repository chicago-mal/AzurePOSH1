# Login to the ARM Portal
Login-AzureRmAccount

# Select the subscription
Get-AzureRmSubscription | Select-AzureRmSubscription

# Read the contents of the network interface of the blog VM just recovered by Site Recovery.
# Change this name to something else if desired.  I could not find a date created property
# to sort on.
$azurenetint = Get-AzureRmNetworkInterface | where { $_.Name -like "*blog*" }

# Display the Private IP Address of the recovered blog VM
$azurenetint.IpConfigurations.PrivateIPAddress