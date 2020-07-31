$actionPreferenceOriginalVerbose = $VerbosePreference
$VerbosePreference = [System.Management.Automation.ActionPreference]::Continue

$arrCommands = @(Get-Command -Name "Get-WindowsOSVersion" -ErrorAction Ignore)
if ($arrCommands.Count -eq 0) {
    # Dot source the function from current folder
    . .\Get-WindowsOSVersion.ps1
}

# Use the function
$versionWindows = Get-WindowsOSVersion

if ($versionWindows -ge ([version]"10.0.19041")) {
    Write-Verbose ("Congrats! You are on Windows 10 2004 or newer!")
} else {
    Write-Warning ("You are not on the latest release of Windows. " + `
            "Please download the latest ISO, extract it using 7-Zip " + `
            "or similar, then run setup.exe.")
}

$VerbosePreference = $actionPreferenceOriginalVerbose
