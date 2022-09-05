# Uninstall Cortana
Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage

# Perform Windows Update
$Updates = Start-WUScan -SearchCriteria "IsInstalled=0 AND IsHidden=0 AND IsAssigned=1"
Install-WUUpdates -Updates $Updates

# Ensure Get-ExecutionPolicy is not Restricted
if((Get-ExecutionPolicy) -eq "Restricted"){
    write-host("ExecutionPolicy is restricted - set to AllSigned to enable following commands but with a bit of security")
    Set-ExecutionPolicy AllSigned
}
# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Iterate over list of packages hosted in /packages directory and install the tools listed in the nested files
$files = Get-ChildItem "./packages" -Recurse
foreach ($file in $files){
    $file = $file.FullName
    Write-Host("Processing {$file}")
    foreach($line in Get-Content $file) {
        choco install $line
    }
}