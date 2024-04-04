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

'''donnees_fusionnees = pd.merge(alerte, lieu, left_on='IDL', right_on='IDL')

alertes_orages = donnees_fusionnees[donnees_fusionnees['CATEGORIE'] == 'Orage']

nombre_alertes_orages_par_region = alertes_orages.groupby('NOML').size()

pourcentage_alertes_orages_par_region = (nombre_alertes_orages_par_region / len(alertes_orages)) * 100

plt.figure(figsize=(10, 6))
pourcentage_alertes_orages_par_region.plot(kind='bar', color='skyblue')
plt.title('Pourcentage d\'alertes d\'orages par région')
plt.xlabel('Région')
plt.ylabel('Pourcentage')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()'''

# Rajouter des orages dans toutes les régions

# Température maximale et minimale par région

'''mesure_df = pd.read_csv("MESURE.csv")
lieu_df = pd.read_csv("LIEU.csv")

merged_df = pd.merge(mesure_df, lieu_df, left_on='IDR', right_on='IDL')

temp_df = merged_df[merged_df['NOML'] != ''].loc[merged_df['NOMM'] == 'Temperature']

temp_df['MESURE'] = temp_df['MESURE'].astype(float)

temp_min_max = temp_df.groupby('NOML')['MESURE'].agg(['min', 'max'])

temp_min_max.plot(kind='bar', figsize=(10, 6))
plt.title('Température minimale et maximale par région')
plt.xlabel('Région')
plt.ylabel('Température (°C)')
plt.xticks(rotation=45)
plt.legend(title='Statistique')
plt.tight_layout()
plt.show()'''

# Analyse de la pression par région

'''
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
plt.show()'''

# Répartition du nombre d'alertes par région 

'''alerte_merged = pd.merge(alerte, lieu, left_on='IDL', right_on='IDL')

nombre_alertes_par_region = alerte_merged['NOML'].value_counts()

plt.figure(figsize=(10, 8))
nombre_alertes_par_region.plot(kind='pie', autopct='%1.1f%%', startangle=140)
plt.title('Répartition du Nombre d\'Alertes par Région')
plt.axis('equal')  # Assurer que le camembert est circulaire
plt.tight_layout()
plt.show()'''

# Catégories d'alertes en France

'''alerte = pd.read_csv("ALERTE.csv")

nombre_alertes_par_categorie = alerte['CATEGORIE'].value_counts()

plt.figure(figsize=(10, 6))
nombre_alertes_par_categorie.plot(kind='bar', color='skyblue')
plt.title('Nombre d\'Alertes par Catégorie')
plt.xlabel('Catégorie')
plt.ylabel('Nombre d\'Alertes')
plt.xticks(rotation=45)
plt.grid(axis='y', linestyle='--', alpha=0.7)
plt.tight_layout()
plt.show()'''

