# Windows Setup
Whenever a new PC has to be configured - be it because you bought a new one or had to reset your current machine - there will be a long list of settings to make and tools to be installed.
Since download and installing those is a tedious task, this repo aims to speed up the process by automating it.

Additionally, the script will also perform a Windows update and uninstall [Cortana](https://support.microsoft.com/en-us/topic/what-is-cortana-953e648d-5668-e017-1341-7f26f7d0f825).

## How to run the automation?
1. Open Powershell with `Administrator` rights
2. Check the files under `/packages` and update the list of tools to be installed via [chocolatey](https://community.chocolatey.org/) to your liking
3. Run `setup.ps1`
4. Reboot your machine and enjoy