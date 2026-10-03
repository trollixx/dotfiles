# pwsh on Windows reads profiles only from the Documents folder, which may be
# redirected (e.g. by OneDrive). Point it at ~/.config/powershell/profile.ps1.
$loader = Join-Path ([Environment]::GetFolderPath('MyDocuments')) 'PowerShell\profile.ps1'
$line = '. "$HOME\.config\powershell\profile.ps1"'

if (Test-Path $loader) {
    $current = (Get-Content -Raw $loader).Trim()
    if ($current -ne $line) {
        Write-Error "$loader already exists with other content. Move it aside and run chezmoi apply again."
        exit 1
    }
} else {
    New-Item -ItemType Directory -Force (Split-Path $loader) | Out-Null
    Set-Content -Path $loader -Value $line -Encoding ascii
}

$consoleProfile = Join-Path (Split-Path $loader) 'Microsoft.PowerShell_profile.ps1'
if (Test-Path $consoleProfile) {
    Write-Warning "$consoleProfile also loads in the console. Delete it if it's the old profile."
}
