# Sommaire

1. [Installation et Utilisation](#installation)
2. [Conception](#conception)
3. [Référence](#référence)

# Prérequis

Avant de commencer assurez vous d'avoir installer Mysql pour pouvoir utiliser le projet.

## 1. Clonage du projet
Cloner le projet avec la commande ci dessous ou aller sur github pour téléchager le projet.



```bash
git clone git@github.com:4ndr01d/eval-sql.git
```

## 2. Après avoir cloner le projet ouvrer le avec votre ide préféré

```bash
cd eval-sql
```



## 3. ouvrez le terminal et assurez vous d'etre bien dans le bon repertoire pour lancer la commande suivante :

```bash
sudo mysql -u "nom de votre utilisateur" -p Bus < queries.sql
```

## 4. Créez la database et allez dessus :

```bash
CREATE DATABASE Bus;
```

```bash
use Bus;
```

## 5. Après cette étape lancer les fichierschema.sql, data.sql et queries.sql dans le terminal mysql

```bash
source "path du fichier schema.sql"
```



```bash
source "path du fichier data.sql"
```



```bash
source "path du fichier queries.sql"
```



## Conception <a name="conception"></a>
MCD avec toutes les tables et les relations

<img src="./mcd/Bus.png">

Dictionnaire des données:

```bash
| Libellé             | Code                | Type   | Longueur | Obligatoire | Règle de calcul | Contrainte d'intégrité | Commentaire                       |
|---------------------|---------------------|--------|----------|-------------|-----------------|------------------------|-----------------------------------|
| ID_Arret            | ID_Arret            | N      |          | Oui         |                 | PRIMARY KEY            | Identifiant unique de l'arrêt    |
| arret_name          | arret_name          | AN     | 200      | Non         |                 |                        | Nom de l'arrêt                  |
| ID_Ligne            | ID_Ligne            | N      |          | Oui         |                 | PRIMARY KEY            | Identifiant unique de la ligne   |
| ligne_name          | ligne_name          | AN     | 64       | Non         |                 |                        | Nom de la ligne                 |
| ID_direction        | ID_direction        | N      |          | Oui         |                 | PRIMARY KEY            | Identifiant unique de la direction |
| direction_name      | direction_name      | AN     | 64       | Non         |                 |                        | Nom de la direction             |
| ID_Horaire          | ID_Horaire          | N      |          | Oui         |                 | PRIMARY KEY            | Identifiant unique de l'horaire |
| hour_Horaires       | hour_Horaires       | D      |          | Non         |                 |                        | Heure des horaires             |
| order_in_direction  | order_in_direction  | N      |          | Oui         |                 |                        | Ordre dans la direction         |

```


