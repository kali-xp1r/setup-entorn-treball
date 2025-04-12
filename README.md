# Entorn d'Exemple - Skill 17 Desenvolupament Web

![Skill 17 Cendrassos](./images/banner.png)

Aquest repositori conté els scripts necessaris per configurar un entorn de desenvolupament homogeni per als alumnes del *Skill 17 - Desenvolupament Web*. S’hi instal·len eines i entorns habituals com Laravel, Symfony, Node.js, PHP, MySQL, Docker, i VSCode, entre d’altres.

Si trobeu a faltar algun component, eina o configuració ens ho podeu fer arribar amb un pull-request o en un correu.

Per instal·lar el repositori cal tenir el git configurat

```bash
sudo apt update
sudo apt install git
git clone https://github.com/Skill-17-Cendrassos/setup-entorn-treball.git
```

## Instal·lació de l'entorn de desenvolupament

**Ús recomanat**

Per instal·lar les eines i deixar l'entorn configurat:

```bash
cd setup-entorn-treball
chmod +x setup.sh
sudo ./setup.sh
```

Per crear l'entorn de desenvolupament:

```bash
sh workenviroment.sh
```

## Si es vol utilitzar MailPit per simular el servei de correu

Si per algun procés cal enviar correus, l'entorn tindrà un contenidor de Docker amb el servei MailPit a punt.

Per iniciar el servei: 

```bash
mailpit start
```

Per aturar-lo:
```bash
mailpit down
```

## Contingut del repositori

### `setup.sh`
Script principal que automatitza la instal·lació de l’entorn. Executa els scripts següents per ordre:

1. `install-vbox.sh` – Instal·la components per a màquines virtuals VirtualBox. (Només cal si treballem amb Virtual Box)
2. `install.sh` – Instal·lació del sistema i eines de desenvolupament.
3. Reinicia el sistema per aplicar canvis.

---

### `install.sh`
Instal·la i configura:

- **Sistema base i Git**
- **PHP 8.4** amb extensions comunes i Apache
- **Composer**
- **MariaDb** (Crea dues bases de dades testproject i testproject2. També crea l'usuari user amb password skill17 amb permissos per manipular les bases de dades)
- **phpMyAdmin**  Hi podeu accedir amb http://localhost/phpmyadmin
- **Docker i Docker Compose**
- **Node.js i npm**
- **Symfony CLI**
- **Laravel Installer**
- **Visual Studio Code**

També configura Git amb:
- Nom d'usuari: `skill17`
- Correu electrònic: `catskills@cendrassos.net`

Es pot canviar al que calgui.

---

### `install.sql`
Script SQL per preparar la base de dades. S’executa automàticament des de `install.sh`.

Crea dues bases de dades

- testproject
- testproject2

I l'usuari **user** amb password **skill17**, que té permissos per gestionar aquestes bases dades.

---

### `install-vbox.sh`
Prepara l'entorn dins d'una màquina virtual amb VirtualBox:

- Actualitza el sistema
- Instal·la les VBox Guest Additions
- Activa l'intercanvi del porta-retalls

**Nota:** Cal muntar el CD de les VBox Guest Additions abans d'executar aquest script.

---

### `work-enviroment.sh`
Script per crear entorns de prova:

- **Laravel + Vue + Pest:** `test-project-vue`
- **Laravel + React + Pest:** `test-project-react`
- **Symfony + React:** `test-project-symfony`

Pels projectes Laravel:

- Es copia el `.env` d’exemple
- Es genera la clau de l’aplicació
- Es fa la migració de la base de dades
- S’instal·len i es compilen les dependències frontend

Pel projectes Symfony:

- Instal·la bundle
- S’instal·len i es compilen les dependències frontend

En els dos entorns instal·la la llibreria de icones Fontawesome i el Bootstrap, tot i que per defecte està configurat el Tailwind. Ajustant la configuració es pot canviar d'un framework css a l'altre.

---

### `env-sample`
Fitxer `.env` d'exemple utilitzat en els projectes Laravel.

---


## Autors

Institut Cendrassos - Skill17  
- [sllado1@cendrassos.net](mailto:sllado1@cendrassos.net)
- [dprados@cendrassos.net](mailto:dprados@cendrassos.net)
