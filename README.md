# Entorn d'Exemple - Skill 17 Desenvolupament Web

![Skill 17 Cendrassos](./images/banner.png)

Aquest repositori conté els scripts necessaris per configurar un entorn de desenvolupament homogeni per als alumnes del *Skill 17 - Desenvolupament Web*. S’hi instal·len eines i entorns habituals com Laravel, Symfony, Node.js, PHP, MySQL, Docker, i VSCode, entre d’altres.

Si trobeu a faltar algun component, eina o configuració ens ho podeu fer arribar amb un pull-request o en un correu.

## Contingut del repositori

### `setup.sh`
Script principal que automatitza la instal·lació de l’entorn. Executa els scripts següents per ordre:

1. `install-vbox.sh` – Instal·la components per a màquines virtuals VirtualBox. (Només cal si treballem amb Virtual Box)
2. `install.sh` – Instal·lació del sistema i eines de desenvolupament.
3. Reinicia el sistema per aplicar canvis.

**Ús recomanat:**
```bash
chmod +x setup.sh
sudo ./setup.sh
```

---

### `install.sh`
Instal·la i configura:

- **Sistema base i Git**
- **PHP 8.4** amb extensions comunes i Apache
- **Composer**
- **MySQL** (Crea dues bases de dades testproject i testproject2. També crea l'usuari skill17 amb password cendrassos amb permissos per manipular les bases de dades)
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

I l'usuari skill17 amb password cendrassos, que té permissos per gestionar aquestes bases dades.

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

---

### `env-sample`
Fitxer `.env` d'exemple utilitzat en els projectes Laravel.

---

## Instruccions d'instal·lació

```bash
git clone https://github.com/usuari/entorn-skill17.git
cd entorn-skill17
chmod +x *.sh
sudo ./setup.sh
```

Després del reinici, pots executar opcionalment l'entorn de treball:

```bash
sh ./work-enviroment.sh
```

---

## Autor

Cendrassos - Skill17  
[sllado1@cendrassos.net](mailto:sllado1@cendrassos.net)
[dprados@cendrassos.net](mailto:dprados@cendrassos.net)
