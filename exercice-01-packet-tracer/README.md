# Exercice 01 — Packet Tracer

## Objectif
Mettre en place un mini-lab réseau sous Cisco Packet Tracer permettant :
- la segmentation du réseau via des VLAN
- la communication inter-VLAN
- l’attribution automatique des adresses IP via DHCP
- l’accès à Internet via un routeur

## Environnement
- Cisco Packet Tracer
- 1 routeur Cisco 1941
- 3 switches
- 3 points d’accès Wi-Fi
- Postes fixes, portables et téléphones IP

## Architecture réseau
Chaque bureau contient :
- 1 switch
- 1 point d’accès Wi-Fi
- 1 PC portable
- 2 PC fixes
- 1 téléphone IP

## VLAN configurés
- VLAN 1 : VoIP
- VLAN 10 : Wi-Fi
- VLAN 20 : PC fixes
- VLAN 30 : Administration

Les ports uplink sont configurés en trunk afin de permettre le transport de plusieurs VLAN.

## Adressage IP
Le routeur Cisco 1941 joue les rôles suivants :
- passerelle par défaut
- serveur DHCP
- routage inter-VLAN

Chaque VLAN dispose de son propre plan d’adressage et d’une plage DHCP dédiée.

## Tests effectués
- Vérification de l’attribution DHCP
- Test de connectivité entre les VLAN
- Test d’accès réseau depuis les postes clients

## Fichiers fournis
- Fichier Packet Tracer du mini-lab
- Export des configurations des équipements

