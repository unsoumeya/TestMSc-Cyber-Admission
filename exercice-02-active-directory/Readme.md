# Exercice 02 — Active Directory

## Objectif
Créer un domaine Active Directory et automatiser la gestion des utilisateurs et des groupes à l’aide de PowerShell.

## Environnement
- Windows Server (Contrôleur de domaine)
- Active Directory Domain Services
- PowerShell

## Domaine
- Nom de domaine : laplateforme.io

## Fichiers
- users.csv : liste des utilisateurs et des groupes
- import-users.ps1 : script PowerShell d’import automatisé

## Fonctionnement du script
- Lecture des utilisateurs depuis un fichier CSV
- Création automatique des groupes s’ils n’existent pas
- Création des comptes utilisateurs
- Ajout des utilisateurs à plusieurs groupes
- Mot de passe commun : Azerty_2025!
- Changement du mot de passe forcé à la première connexion

## Exécution
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
cd C:\AD
.\import-users.ps1
