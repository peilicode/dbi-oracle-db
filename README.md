# DBI Oracle Database — GitHub Codespaces Setup
 
Oracle Free 23c Datenbank für den DBI-Unterricht an der HTL Leonding, betrieben via GitHub Codespaces. Kein lokales Docker oder BIOS-Setup nötig.
 
---
 
## Voraussetzungen
 
- [GitHub Account](https://github.com) (kostenlos)
- [GitHub CLI](https://cli.github.com) installiert
- [SQL Developer](https://www.oracle.com/database/sqldeveloper/) installiert
---
 
## Setup (einmalig)
 
### 1. Repository forken
 
Klicke oben rechts auf **Fork** → **Create fork**
 
### 2. Codespace starten
 
Im geforkten Repository: **Code** → **Codespaces** → **Create codespace on main**

Der Browser öffnet eine VS Code Umgebung. Warte bis der Terminal bereit ist.
 
### 3. Oracle Datenbank starten
 
Im Terminal des Codespace:
 
```bash
docker compose up -d
```
 
Warte bis die Datenbank bereit ist (~2-3 Minuten):
 
```bash
docker compose logs -f
```
 
Wenn `DATABASE IS READY TO USE!` erscheint → weiter mit Schritt 4.
 
---
 
## Verbindung mit SQL Developer am Laptop lokal
 
### 4. GitHub CLI einrichten (einmalig)
 
```powershell
gh auth login
gh auth refresh -h github.com -s codespace
```
 
Den Anweisungen im Terminal folgen (Browser öffnet sich automatisch).
 
### 5. Port-Tunnel starten
 
Den Codespace-Namen aus der URL kopieren — er sieht so aus:  
`https://<codespace-name>-1521.app.github.dev/`
 
```powershell
gh codespace ports forward 1521:1521 --codespace <codespace-name>
```
 
**Dieses Terminal-Fenster offen lassen** solange du mit SQL Developer arbeitest.
 
### 6. SQL Developer Verbindung erstellen
 
| Feld | Wert |
|---|---|
| Datenbanktyp | Oracle |
| Benutzername | `system` |
| Kennwort | `dbi2026` |
| Verbindungstyp | Einfach |
| Hostname | `localhost` |
| Port | `1521` |
| Service-Name | `FREEPDB1` |
 
---
 
## Täglicher Workflow
 
1. Codespace öffnen: [github.com/codespaces](https://github.com/codespaces)
2. Bestehenden Codespace starten (nicht neu erstellen)
3. Im Terminal: `docker compose up -d`
4. Port-Tunnel starten: `gh codespace ports forward 1521:1521 --codespace <name>`
5. SQL Developer verbinden
---
 
## Datenbank-Details
 
| Parameter | Wert |
|---|---|
| Image | `gvenzl/oracle-free:23-slim` |
| Version | Oracle Database 23c Free |
| Port | `1521` |
| Service-Name | `FREEPDB1` |
| System-User | `system` |
| Passwort | `dbi2026` |
 
---
 
## Hinweise
 
- **Codespace Limit:** GitHub Free bietet 60h/Monat — ausreichend für den Unterricht
- **Daten:** Bleiben im Volume erhalten solange der Codespace existiert (nicht gelöscht wird)
- **Codespace schlafen lassen:** Nach 30 Minuten Inaktivität pausiert der Codespace automatisch — Daten gehen dabei nicht verloren
 
