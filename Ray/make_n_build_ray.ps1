$ErrorActionPreference = "Stop"

cmake --build build

if ($LASTEXITCODE -ne 0) {
    Write-Error "Build failed with exit code $LASTEXITCODE."
    exit $LASTEXITCODE
}

.\build\Debug\Ray.exe > image.ppm

if ($LASTEXITCODE -ne 0) {
    Write-Error "Ray.exe failed with exit code $LASTEXITCODE."
    exit $LASTEXITCODE
}

Write-Host "Build completed and image.ppm was generated."