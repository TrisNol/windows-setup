# Note: Run as Admin
$fonts_directory = 'C:/Windows/temp/JetBrainsMono'
$temp_zip = 'C:/Windows/temp/JetBrainsMono.zip'

if (-not(Test-Path -Path $fonts_directory -PathType Leaf)) {
    $ProgressPreference = 'SilentlyContinue'
    Invoke-WebRequest "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip" -OutFile $temp_zip
    Expand-Archive $temp_zip $fonts_directory
    Remove-Item -Path $temp_zip
}
foreach ($Font in Get-ChildItem -Path $fonts_directory -Include '*.ttf', '*.ttc', '*.otf' -Recurse) {
    Write-Host 'Installing font -' $Font.BaseName
    Copy-Item -Force $Font "C:/Windows/Fonts"
    New-ItemProperty -Name $Font.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $Font.name         
}
Remove-Item -Path $fonts_directory -Recurse

choco install -y starship
"Invoke-Expression (&starship init powershell)" >> $PROFILE