# Traduction française féminisée de Roundcube
# Roundcube French Gender Neutral Translation

## Français

Le français est reconnu pour être une langue particulièrement genrée. En effet,
certaines règles de grammaires comme *le masculin l'emporte toujours* laissent
peu de place au genre féminin et renforcent l'emprise du patriarcat sur notre
langue.

Ce dépôt git a donc comme but d'offrir une traduction français féminisée de
l'interface web de gestion de courriels Roundcube.

La méthode de féminisation préférée est celle éponyme (`tous` -> `tout le
monde`). Quand ce n'est pas possible, la méthode avec des traits d'union est
utilisée (`étudiant-e-s`, `politicien-ne-s`). Quand aucune de ces deux méthodes
n'est possible, la méthode au long est utilisée (`utilisatrice / utilisateur`).

Le code de locale offert pour cette traduction est `fr_FEM`.

### Intégrer cette traduction

*Attention! Par défaut, les fichiers fournis dans ce dépôt git utilisent la
locale `fr_FEM` comme locale française par défaut, plutôt que `fr_FR`.*

Pour ajouter la locale `fr_FEM` à votre instance Roundcube, commencez par
copier ce dépôt git sur votre serveur:

    $ git clone https://github.com/baldurmen/roundcubemail.git

Vous pouvez ensuite fusionner votre dossier principal Roundcube et ce dépôt:

    $ rsync -a "CHEMIN/VERS/CE/DÉPÔT/GIT/" "CHEMIN/VERS/ROUNDCUBE/"

Veuillez noter que le `/` à la fin des deux chemins est important.

## English

French is known to be a very gendered language. Some grammar rules like
*masculine is always right* only contributes to reinforce the patriarcal
chokehold on our society.

This git repository thus aims to offer a French gender neutral translation of
the Roundcube email web interface.

The locale for this translation is `fr_FEM`.

### Integrate this translation

*Warning! By default, these files in this git repository use the `fr_FEM`
locale for the French default locale, instead of `fr_FR`.*

To add the `fr_FEM` locale to your Roundcube instance, start by cloning this
git repository:

    $ git clone https://github.com/baldurmen/roundcubemail.git

You can then merge your main Roundcube directory and this repository:

    $ rsync -a "PATH/TO/THIS/GIT/REPOSITORY/" "PATH/TO/ROUNDCUBE/"

Please note that the `/` at the end of the paths is important.
