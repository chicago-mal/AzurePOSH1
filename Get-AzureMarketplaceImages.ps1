<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2016 v5.2.124
	 Created on:   	7/26/2016 4:45 PM
	 Created by:   	Michael Lamia
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		This script was created to identify the Azure Marketplace image publishers, 
		offers, skus, and versions using PowerShell for the locations into which 
		you might want to deploy in Azure.

		***You'll want to parameterize this script and fully deploy a VM from image
		using this script. Until then, change the variable below manually as necessary
		to return the desired result.***
#>
Login-AzureRmAccount

$locName = "Central US"
Get-AzureRmVMImagePublisher -Location $locName | Select PublisherName

$pubName = "F5-Networks"
Get-AzureRmVMImageOffer -Location $locName -Publisher $pubName | Select Offer

$offerName = "f5-waf-evaluation"
Get-AzureRMVMImageSku -Location $locName -Publisher $pubName -Offer $offerName | Select Skus