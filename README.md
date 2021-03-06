# Kotlin/Native
*  Site officiel: https://kotlinlang.org/docs/reference/native-overview.html
*  Tutoriel pour créer une application pour iOS et Android: https://play.kotlinlang.org/hands-on/Targeting%20iOS%20and%20Android%20with%20Kotlin%20Multiplatform/01_Introduction
*  Conférence interensate sur le sujet: https://www.youtube.com/watch?v=dMm6zyW2i9I


## Objectif de la R&D
Création d'un projet pour tester les capacités de Kotlin/Native:
*  Créer un projet commun (qui appelle un WS)
*  Utiliser le projet commun dans une application Android (Afficher le résultat WS)
*  Utiliser le projet commun dans une application iOS (Afficher le résultat WS)
*  Définir le périmètre du code partagé et le code à développer sous Android et iOS

## Le projet
Ce projet est la réponse à cet objectif, il consiste en un appel à l'URL https://itunes.apple.com/search?term=Michael et en affichant la réponse à l'écran.

Le résultat initial de l'URL contient de nombreuses propriétés et doit être traité pour extraire uniquement une liste de chaînes contenant les valeurs de la variable **artistName**.

Voici le résultat des applications Android et iOS

<img src="images/Screenshot_2019-11-19_at_13.24.07.png" >

## Organisation du code
Le projet comprend trois parties:
1. Le projet principal **KotlinNative** contenant le code Android,
2. Le projet commun contenu dans le projet Android dans un dossier appelé **SharedCode**.
3. Le projet iOS qui ne doit pas nécessairement être contenu dans le projet Android, mais par commodité, il a été inclus dans un dossier appelé **iOSProjects**

<img src="images/Screenshot_2019-11-19_at_10.48.59.png" >

### **SharedCode**
Le projet code commun **SharedCode** a 3 dossiers. Un pour tout le code partagé et deux autres pour les comportements spécifiques des plateformes Android et iOS

#### Commun 
<img src="images/Screenshot_2019-11-14_at_17.27.45.png" >

#### iOS
<img src="images/Screenshot_2019-11-14_at_17.28.07.png" >

#### Android 
<img src="images/Screenshot_2019-11-14_at_17.27.55.png" >

## Procédure d’exécution 
1.  Installer gradle sur la machine (normalement déjà installé avec Android Studio)
2.  Build le projet Android **KotlinNative**
3.	Générer le .framework iOS en exécutant la task gradle **packForXcode** du projet commun **SharedCode** (SharedCode/build.gradle)

<img src="images/Picture_1.png" >

4.	Pour Android, exécuter le projet **KotlinNative**
5.	Pour iOS, exécuter le projet KotlinNative/iOSProjets/native (le projet pointe vers le .framework generé avec la task **packForXcode**)
