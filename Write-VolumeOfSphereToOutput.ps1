function Write-VolumeOfSphereToOutput {
    if ($args.Count -ne 2) {
        Write-Error ("Insufficent input provided to function Write-VolumeOfSphereToOutput; " + `
                "two parameters are required. The first is an integer indicating the sphere " + `
                "number, and the second is a double-byte float indicating the radius of the " + `
                "sphere.")
        return
    }

    $boolInputError = $false
    Add-Type -Assembly Microsoft.VisualBasic

    if ($null -ne ($args[0])) {
        if ([Microsoft.VisualBasic.Information]::IsNumeric($args[0]) -ne $true) {
            $boolInputError = $true
        }
    } else {
        $boolInputError = $true
    }

    if ($null -ne ($args[1])) {
        if ([Microsoft.VisualBasic.Information]::IsNumeric($args[1]) -ne $true) {
            $boolInputError = $true
        }
    } else {
        $boolInputError = $true
    }

    if ($boolInputError) {
        Write-Error ("Insufficent input provided to function Write-VolumeOfSphereToOutput; " + `
                "two parameters are required. The first is an integer indicating the sphere " + `
                "number, and the second is a double-byte float indicating the radius of the " + `
                "sphere.")
        return
    }

    $intSphereNumber = $args[0]
    $doubleRadius = $args[1]
    $doubleRadiusCubed = [math]::Pow($doubleRadius, 3)
    $doublePi = [math]::PI
    $doubleVolume = 4 / 3 * $doublePi * $doubleRadiusCubed
    Write-Output ("The volume of sphere " + $intSphereNumber + " is " + $doubleVolume)
}
