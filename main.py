import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

lieu = pd.read_csv("LIEU.csv")
#station = pd.read_csv("STATION.csv")
#r1eleve = pd.read_csv("RELEVE.csv")
#mesure = pd.read_csv("MESURE.csv")
#
alerte = pd.read_csv("ALERTE.csv")

'''
Idées de requetes : 

- pourcentage de types d'alertes par région
- température maximale et minimale par région
- analyse de l'ensoleillement en W/m²

'''

# Pourcentage de types d'alertes par région

import matplotlib.pyplot as plt

donnees_fusionnees = pd.merge(alerte, lieu, left_on='IDL', right_on='IDL')

alertes_orages = donnees_fusionnees[donnees_fusionnees['CATEGORIE'] == 'Orage']

nombre_alertes_orages_par_region = alertes_orages.groupby('NOML').size()

pourcentage_alertes_orages_par_region = (nombre_alertes_orages_par_region / len(alertes_orages)) * 100

# plt.figure(figsize=(10, 6))
# pourcentage_alertes_orages_par_region.plot(kind='bar', color='skyblue')
# plt.title('Pourcentage d\'alertes d\'orages par région')
# plt.xlabel('Région')
# plt.ylabel('Pourcentage')
# plt.xticks(rotation=45, ha='right')
# plt.tight_layout()
# plt.show()

# Rajouter des orages dans toutes les régions

# Température maximale et minimale par région



#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#



# Ensoleillement en W/m2

mesure = pd.read_csv("MESURE.csv")

# Filtrer les données pour ne conserver que les mesures d'ensoleillement
ensoleillement_data = mesure[mesure['NOMM'] == 'Ensoleillement']

# Charger les données de lieu depuis le fichier LIEU.csv
lieu = pd.read_csv("LIEU.csv")

# Fusionner les données d'ensoleillement avec les données de lieu pour obtenir le nom de la région associée à chaque mesure
ensoleillement_merged = pd.merge(ensoleillement_data, lieu, left_on='IDR', right_on='IDL')

# Calculer la moyenne de l'ensoleillement pour chaque région
ensoleillement_moyen_par_region = ensoleillement_merged.groupby('NOML')['MESURE'].mean()

# Tracer un graphique pour visualiser l'ensoleillement moyen par région
plt.figure(figsize=(12, 8))
ensoleillement_moyen_par_region.plot(kind='bar', color='skyblue')
plt.title('Ensoleillement Moyen par Région')
plt.xlabel('Région')
plt.ylabel('Ensoleillement Moyen (W/m²)')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()