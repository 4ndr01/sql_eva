
## SQL Evaluation

## .8
### Index de type B-Tree (Arbre équilibré) :

### Principe de fonctionnement : 
Les index de type B-Tree sont des structures d'arbres équilibrés où chaque nœud contient plusieurs clés triées par ordre croissant, ainsi que des pointeurs vers les sous-arbres correspondants. Les données sont organisées de manière hiérarchique, permettant une recherche efficace en suivant le chemin de l'arbre.

### Avantages:


Ils sont efficaces pour les requêtes qui nécessitent un tri par ordre croissant ou décroissant des résultats, car ils conservent l'ordre des données. Ils sont également efficaces pour les requêtes de type plage (range queries).
### Inconvénients : 
Ils peuvent être moins efficaces pour les opérations de recherche exacte sur des données très volumineuses, car ils nécessitent souvent plusieurs accès disque pour atteindre la feuille correspondante.

### Index de type Hash :

### Principe de fonctionnement :
Les index de type Hash utilisent une fonction de hachage pour mapper les valeurs des clés aux emplacements physiques des données. L'index hash stocke généralement une table de hachage qui associe les valeurs de clé à leurs emplacements de données.
### Avantages : 
Ils offrent des temps de recherche constants (O(1)) pour les opérations de recherche exacte, ce qui les rend très rapides pour les recherches uniques. Ils sont également efficaces pour les opérations de jointure et les requêtes de recherche par valeur.
### Inconvénients : 
Ils ne prennent pas en charge les requêtes de type plage ou les opérations de tri sur les données. De plus, en cas de collisions de hachage (lorsque deux clés différentes sont mappées à la même position dans la table de hachage), les performances peuvent être dégradées.

### .9

