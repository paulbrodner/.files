#!/usr/bin/env powershell

# ---------------------------- 
# define  a powershell terminal based on https://docs.microsoft.com/en-us/windows/terminal/tutorials/powerline-setup
# using Zash theme: https://github.com/JanDeDobbeleer/oh-my-posh#themes
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser

Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck

# define the profile
Write-Host "Start writing a new PS profile to $PROFILE"

$my_profile=@"
# in powershell find the location of the profile and update with this content
# echo $profile
Function cdtc {Set-Location -Path C:\code\tc}
Set-Alias -Name gotc -Value cdtc

Function cdta {Set-Location -Path C:\code\tc\tc-test-automation}
Set-Alias -Name gota -Value cdta

Function cdcode {Set-Location -Path C:\code}
Set-Alias -Name go -Value  cdcode


Function cdgod {Set-Location -Path C:\code\tc\reporting\dashboard}
Set-Alias -Name god -Value cdgod

Set-Alias -Name venv -Value  .\venv\Scripts\activate.ps1

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Zash
"@

rm $PROFILE
New-Item $PROFILE
Set-Content $PROFILE $my_profile