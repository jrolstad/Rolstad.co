[string[]] $filesTodeploy = "index.html", "error.html", "hal-eye.png";
$bucketName = "rolstad.co"

[string[]] $resolvedFiles = $filesToDeploy | foreach-Object {(Resolve-path $_).Path}

Write-Host("Deploying {0} to {1}" -f [string]::Join(',',$resolvedFiles),$bucketName)
$response = Push-ToS3Bucket -files $resolvedFiles -bucketName $bucketName
Write-Host("Done")