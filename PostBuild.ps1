param($ProjectDir, $ConfigurationName, $TargetDir, $TargetFileName, $SolutionDir)

if($ConfigurationName -like "Debug*")
{
	$psModulesFolder = "C:\PSModules\";
	if($TargetDir -like "*Core*")
	{
		$DestinationFolder = "$psModulesFolder\PowerShell\Modules\PnPPowerShellCore"
	} else {
		if($ConfigurationName -like "Debug15")
		{
			$DestinationFolder = "$psModulesFolder\SharePointPnPPowerShell2013"
		} elseif($ConfigurationName -like "Debug16")
		{
			$DestinationFolder = "$psModulesFolder\SharePointPnPPowerShell2016"
		} elseif($ConfigurationName -like "Debug19")
		{
			$DestinationFolder = "$psModulesFolder\SharePointPnPPowerShell2019"
		} else {
			$DestinationFolder = "$psModulesFolder\SharePointPnPPowerShellOnline"
		}
	}
	# Module folder there?
	if(Test-Path $DestinationFolder)
	{
		# Yes, empty it
		Remove-Item $DestinationFolder\*
	} else {
		# No, create it
		Write-Host "Creating target folder: $DestinationFolder"
		New-Item -Path $DestinationFolder -ItemType Directory -Force >$null # Suppress output
	}

	Write-Host "Copying files from $TargetDir to $DestinationFolder"
	Try {
		Copy-Item "$TargetDir\*.dll" -Destination "$DestinationFolder"
		Copy-Item "$TargetDir\*help.xml" -Destination "$DestinationFolder"
		if($TargetDir -like "*Core*")
		{
			Copy-Item "$TargetDir\ModuleFiles\*" -Destination "$DestinationFolder"
		} else {
			switch($ConfigurationName)
			{
				"Debug15" {
					Copy-Item "$TargetDir\ModuleFiles\SharePointPnPPowerShell2013.psd1" -Destination  "$DestinationFolder"
					Copy-Item "$TargetDir\ModuleFiles\PnP.PowerShell.2013.Commands.Format.ps1xml" -Destination "$DestinationFolder"
				} 
				"Debug16" {
					Copy-Item "$TargetDir\ModuleFiles\SharePointPnPPowerShell2016.psd1" -Destination  "$DestinationFolder"
					Copy-Item "$TargetDir\ModuleFiles\PnP.PowerShell.2016.Commands.Format.ps1xml" -Destination "$DestinationFolder"
				} 
				"Debug19" {
					Copy-Item "$TargetDir\ModuleFiles\SharePointPnPPowerShell2019.psd1" -Destination  "$DestinationFolder"
					Copy-Item "$TargetDir\ModuleFiles\PnP.PowerShell.2019.Commands.Format.ps1xml" -Destination "$DestinationFolder"
				} 
				"Debug" {
					Copy-Item "$TargetDir\ModuleFiles\SharePointPnPPowerShellOnline.psd1" -Destination  "$DestinationFolder"
					Copy-Item "$TargetDir\ModuleFiles\PnP.PowerShell.Online.Commands.Format.ps1xml" -Destination "$DestinationFolder"
				}
			}
		}
	}
	Catch
	{
		exit 1
	}
} elseif ($ConfigurationName -like "Release*")
{
    $psModulesFolder = [environment]::getfolderpath("mydocuments");
	if($TargetDir -like "*Core*")
	{
		$DestinationFolder = "$psModulesFolder\PowerShell\Modules\PnPPowerShellCore"
	} else {
		switch($ConfigurationName)
		{
			"Release15" 
			{
				$DestinationFolder = "$psModulesFolder\WindowsPowerShell\Modules\SharePointPnPPowerShell2013"
			}
			"Release16"
			{
				$DestinationFolder = "$psModulesFolder\WindowsPowerShell\Modules\SharePointPnPPowerShell2016"
			}
			"Release19"
			{
				$DestinationFolder = "$psModulesFolder\WindowsPowerShell\Modules\SharePointPnPPowerShell2019"
			}
			"Release"
			{
				$DestinationFolder = "$psModulesFolder\WindowsPowerShell\Modules\SharePointPnPPowerShellOnline"
			}
		}
	}

	# Module folder there?
	if(Test-Path $DestinationFolder)
	{
		# Yes, empty it
		Remove-Item $DestinationFolder\*
	} else {
		# No, create it
		Write-Host "Creating target folder: $DestinationFolder"
		New-Item -Path $DestinationFolder -ItemType Directory -Force >$null # Suppress output
	}

	Write-Host "Copying files from $TargetDir to $DestinationFolder"
	Try
	{
		Copy-Item "$TargetDir\*.dll" -Destination "$DestinationFolder"
		Copy-Item "$TargetDir\*help.xml" -Destination "$DestinationFolder"
		if($TargetDir -like "*Core*")
		{
			Copy-Item "$TargetDir\ModuleFiles\PnPPowerShellCore.psd1" -Destination "$DestinationFolder"
			Copy-Item "$TargetDir\ModuleFiles\PnP.PowerShell.Core.Format.ps1xml" -Destination "$DestinationFolder"
		} else {
			switch($ConfigurationName)
			{
				"Release15" {
					Copy-Item "$TargetDir\ModuleFiles\PnPPowerShell2013.psd1" -Destination  "$DestinationFolder"
					Copy-Item "$TargetDir\ModuleFiles\PnP.PowerShell.2013.Commands.Format.ps1xml" -Destination "$DestinationFolder"
				} 
				"Release16" {
					Copy-Item "$TargetDir\ModuleFiles\PnPPowerShell2016.psd1" -Destination  "$DestinationFolder"
					Copy-Item "$TargetDir\ModuleFiles\PnP.PowerShell.2016.Commands.Format.ps1xml" -Destination "$DestinationFolder"
				} 
				"Release19" {
					Copy-Item "$TargetDir\ModuleFiles\PnPPowerShell2019.psd1" -Destination  "$DestinationFolder"
					Copy-Item "$TargetDir\ModuleFiles\PnP.PowerShell.2019.Commands.Format.ps1xml" -Destination "$DestinationFolder"
				} 
				"Release" {
					Copy-Item "$TargetDir\ModuleFiles\PnPPowerShellOnline.psd1" -Destination  "$DestinationFolder"
					Copy-Item "$TargetDir\ModuleFiles\PnP.PowerShell.Online.Commands.Format.ps1xml" -Destination "$DestinationFolder"		
				}
			}
		}
	} 
	Catch
	{
		exit 1
	}
}

	