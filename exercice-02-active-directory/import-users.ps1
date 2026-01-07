Import-Module ActiveDirectory
$csv = Import-Csv "C:\AD\users.csv" -Delimiter ';'

$Password = ConvertTo-SecureString "Azerty_2025!" -AsPlainText -Force

foreach ($user in $csv) {

    # Récupérer la liste des groupes (groupe1..groupe6) non vides
    $groups = $user.PSObject.Properties |
        Where-Object { $_.Name -like "groupe*" -and $_.Value } |
        Select-Object -ExpandProperty Value

    # Créer les groupes s'ils n'existent pas
    foreach ($group in $groups) {
        if (-not (Get-ADGroup -Filter "Name -eq '$group'" -ErrorAction SilentlyContinue)) {
            New-ADGroup -Name $group -GroupScope Global -GroupCategory Security
        }
    }

    # Créer un identifiant (ex: mdupont)
    $SamAccountName = ($user.prenom.Substring(0,1) + $user.nom).ToLower()

    # Créer l'utilisateur
    New-ADUser `
        -Name "$($user.prenom) $($user.nom)" `
        -GivenName $user.prenom `
        -Surname $user.nom `
        -SamAccountName $SamAccountName `
        -UserPrincipalName "$SamAccountName@laplateforme.io" `
        -AccountPassword $Password `
        -Enabled $true `
        -ChangePasswordAtLogon $true

    # Ajouter l'utilisateur aux groupes
    foreach ($group in $groups) {
        Add-ADGroupMember -Identity $group -Members $SamAccountName
    }
}
