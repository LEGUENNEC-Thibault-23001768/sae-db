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


# Analyse de la pression par région


mesure = pd.read_csv("MESURE.csv")

pression_data = mesure[mesure['NOMM'] == 'Pression']

lieu = pd.read_csv("LIEU.csv")

pression_merged = pd.merge(pression_data, lieu, left_on='IDR', right_on='IDL')

pression_moyenne_par_region = pression_merged.groupby('NOML')['MESURE'].mean()

plt.figure(figsize=(12, 8))
pression_moyenne_par_region.plot(kind='bar', color='lightgreen')
plt.title('Moyenne de la Pression Atmosphérique par Région')
plt.xlabel('Région')
plt.ylabel('Pression Atmosphérique (hPa)')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()
