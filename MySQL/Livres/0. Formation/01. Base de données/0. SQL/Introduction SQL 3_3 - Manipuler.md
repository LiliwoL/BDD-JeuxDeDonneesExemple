# SQL  - Manipuler les données 3/3

[Source](https://notebooks.lecluse.fr)

[[TOC]]

***

# Manipuler les données avec SQL

Dans ce dernier TP, nous allons voir comment **insérer**, **mettre à jour** ou **supprimer** des enregistrements dans des tables.

## Insérer un enregistrement dans une table

Nous avons déjà rencontré cerre requète **INSERT**. 

Elle s'applique que la table **soit vide ou non**.
On peut très bien ajouter par exemple une troisième langue dans notre table **Langues**:

```sql
INSERT INTO Langues (Langue) VALUES('Klingon');
```

Vérifions:

```sql
SELECT *
FROM Langues;
```

***

## Mise a jour, effacement : UPDATE et DELETE

Les requêtes **UPDATE** et **DELETE** fonctionnent sur le même modèle que les requêtes **SELECT**.

> 💥 ATTENTION:
> On a vite fait d'effacer toutes ses données si on ne configure pas bien sa requête. Une bonne habitude à prendre est de tester d'abord ses critères à l'aide d'un **SELECT**.

Observez les exemples ci-dessous :

```sql
SELECT NomAuteur
FROM Auteurs 
WHERE IdAuteur = 10;
```

C'est bien lui que l'on veut modifier!

Modifions le nom de l'auteur grâce à une requête de mise à jour :

**UPDATE** *table*
**SET** *attribut1* = *valeur1*, *attribut2* = *valeur2*, ...
**WHERE** *critère*;

```sql
UPDATE Auteurs 
SET NomAuteur = "Ze Djloule", PrenomAuteur = "Juju"
WHERE IdAuteur=10;

# Vérification
SELECT *
FROM Auteurs;
```

Supprimons vite cette entrée ! 
Nous utiliserons une requête de suppression:

**DELETE FROM** *table* 
**WHERE** *critere*;

> 💥 ATTENTION:
> Soyez bien sûr de votre critère sous peine de perdre des données importantes !

```sql
DELETE
FROM Auteurs
WHERE IdAuteur=10;

# Vérification
SELECT * FROM Auteurs;
```

***

### Attention à la cohérence des données

Dans une base de données relationnelle il faut être vigilant lors de la suppression d'enregistrements.
En effet la suppression d'un enregistrement entraîne **la suppression de sa clé primaire** qui peut être utilisée en tant que clé externe dans une autre table.

Cela entraîne la **corruption des données**.

Observez l'exemple ci-dessous dans lequel j'attribue à **Donald Duck** un livre célèbre sans toucher à la table **Livres**.

Il existe en SQL des moyens pour se prémunir de ce type de problèmes mais cela dépasse le cadre de ce cours. (CASCADE)

```sql
INSERT INTO Auteurs
(NomAuteur, PrenomAuteur, IdLangue, AnneeNaissance) 
VALUES
("Duck", "Donald", 2, 1850);

# Vérification
SELECT Titre, NomAuteur
FROM Livres
JOIN Auteurs 
USING (IdAuteur);
```

***

> ### 🔧 **Travail à réaliser**
> 
> 1.  Réinsérez l'auteur Jules Verne à sa place !
> 2.  Supprimez tous les livres écrits au 19e sciecle

### [](#A-vous-de-jouer)A vous de jouer[](#A-vous-de-jouer)

1.  Réinsérez l'auteur Jules Verne à sa place !
2.  Supprimez tous les livres écrits au 19e sciecle