$domain = “@grigori.loc”
Import-Module activedirectory
Import-Csv "C:\AD_users.csv" | ForEach-Object {
$userSAM = $_.FirstName + $_.LastName

if (@(Get-ADUser -Filter "SamAccountName -eq '$($userSAM)'").Count -ne 0) {
Write-Host "Пользователь с именем $userSAM уже существует"
Return
}

$upn = $userSAM + $domain
$uname = $_.LastName + " " + $_.FirstName

New-ADUser `
-Name $uname `
-DisplayName $uname `
-GivenName $_.FirstName `
-Surname $_.LastName `
-Department $_.Department `
-Title $_.JobTitle `
-UserPrincipalName $upn `
-SamAccountName $userSAM `
-Path $_.OU `
-AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -force) `
-Enabled $true
}

