param([int]$Port = 4000)
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not (Get-Command ruby -ErrorAction SilentlyContinue)) {
    if (Test-Path 'C:\Ruby33-x64\bin\ruby.exe') {
        $env:Path = 'C:\Ruby33-x64\bin;' + $env:Path
    } else {
        throw 'Install Ruby 3.3 with DevKit and reopen PowerShell.'
    }
}
$env:JEKYLL_ENV = 'development'
& bundle _2.6.6_ check
if ($LASTEXITCODE -ne 0) {
    & bundle _2.6.6_ install
    if ($LASTEXITCODE -ne 0) { throw 'Dependency installation failed.' }
}
& bundle _2.6.6_ exec jekyll serve --host 127.0.0.1 --port $Port --livereload --trace
exit $LASTEXITCODE