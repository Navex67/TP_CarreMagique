{ALGORITHME:Carré magique
//BUT: Faire un carré magique de taille MAX 5/5 ou 7/7 
//ENTREE: L'utilisateur n'a rien a rentrée
//SORTIE: Le carré magique complet avec les nombres au bonnes positions

CONST
	//taille du carré
	MAX=5:ENTIER

TYPE
	Tableau2dim=Tableau[1..MAX,1..MAX]de ENTIER

PROCEDURE initTab(VAR T1:Tableau2dim)
//BUT : initialiser le tableau avec des 0 partout afin de crée la structure pour le carré
//ENTREE: Deux variables i,j pour former le tableau
//SORTIE: Le tableau avec des 0 dans chaques cases

	VAR
	i:ENTIER
	j:ENTIER

	DEBUT

	
	POUR i de 1 a MAX FAIRE
		DEBUT
		POUR j de 1 a MAX FAIRE
			DEBUT
			T1[i,j] <- 0
			FINPOUR
		FINPOUR

	FINPROCEDURE


PROCEDURE constructCarre(var T1:Tableau2dim)
//BUT:Construction du carré le rendre sphérique / initialisation du 1 / déplacement nord-est et nord-ouest / integration des valeurs dans le tableau
//ENTREE: ligne et colonne qui vont permettre de se deplacer dans le tableau et poser le nombre
//SORTIE: Le carré rempli avec les nombres dans les bonnes cases

	VAR
	i:ENTIER
	j:ENTIER
	ligne:ENTIER
	colonne:ENTIER

	DEBUT

	ligne <- ((MAX-1) div 2)
	colonne <- ((MAX+1) div 2)


	POUR i DE 1 A MAX*MAX FAIRE
	DEBUT
	
	
	SI ligne>MAX ALORS
		ligne <- ligne-MAX
	SI colonne>MAX ALORS
		colonne <- colonne-MAX
	
	SI ligne<1 ALORS
		ligne <- ligne+MAX
	SI colonne<1 ALORS
		colonne <- colonne+MAX


	
	SI T1[ligne,colonne]<>0 ALORS
		DEBUT
			ligne <- ligne-1
			colonne <- colonne-1

				SI ligne>MAX ALORS
					ligne<-ligne-MAX

				SINON SI colonne<1 ALORS
					colonne:=colonne+MAX

				SINON SI ligne<1 ALORS
					ligne <- ligne+MAX
				FINSI
				FINSINONSI
				FINSINONSI
		FINSI




	T1[ligne,colonne] <- i

	 

	ligne <- ligne-1
	colonne <- colonne+1

	FINPOUR

	FINPROCEDURE

PROCEDURE affichageCarre(var T1:Tableau2dim)
//BUT: Afficher le carré après traitement des autres procédures dans le programme principal
//ENTREE: i et j pour afficher la structure et les valeurs dans le tableau
//SORTIE: Affichage du tableau 

	VAR
	i:ENTIER
	j:ENTIER

	DEBUT

	POUR i DE 1 A MAX FAIRE
		DEBUT
		POUR j de 1 A MAX FAIRE
			DEBUT
			ECRIRE T1[i,j] & ' '
			FINPOUR
			writeln;
		FINPOUR
	
	FINPROCEDURE



VAR 
	
	Carre=Tableau[1..MAX,1..MAX]de ENTIER
	i,j,ligne,colonne:ENTIER

DEBUT

	initTab(Carre)
	constructCarre(Carre)
	ECRIRE 'Voici votre carre magique de taille ' & MAX ' x ' & MAX
	affichageCarre(Carre)

FIN }



program TP_carre_magique;

uses crt;

CONST
	//taille du carré
	MAX = 5;


Type
	Tableau2dim=Array[1..MAX,1..MAX]of integer;

procedure initTab(var T1:Tableau2dim);
//BUT : initialiser le tableau avec des 0 partout afin de crée la structure pour le carré
//ENTREE: Deux variables i,j pour former le tableau
//SORTIE: Le tableau avec des 0 dans chaques cases

	var
	i:integer;
	j:integer;

	BEGIN

	//initialisation du tableau avec des 0 dans chaque cases

	for i := 1 to MAX do
		begin
		for j:= 1 to MAX do
			begin
			T1[i,j]:=0;
			end;
		end;

	end;


procedure constructCarre(var T1:Tableau2dim);
//BUT:Construction du carré le rendre sphérique / initialisation du 1 / déplacement nord-est et nord-ouest / integration des valeurs dans le tableau
//ENTREE: ligne et colonne qui vont permettre de se deplacer dans le tableau et poser le nombre
//SORTIE: Le carré rempli avec les nombres dans les bonnes cases


	var
	ligne:integer;
	colonne:integer;
	i:integer;
	j:integer;

	BEGIN

	//initialisation de la position de 1

	ligne:=((MAX-1) div 2);
	colonne:=((MAX+1) div 2);

	//pose du 1 grace a la boucle

	for i:=1 to MAX*MAX do
	begin
	
	//on rend le carré sphérique afin que si les valeurs dépassent MAX soit dans le carré (ici on fait les valeurs positives)
	if ligne>MAX then
		ligne:=ligne-MAX;
	if colonne>MAX then
		colonne:=colonne-MAX;
	//pareil avec les valeurs négatives
	if ligne<1 then
		ligne:=ligne+MAX;
	if colonne<1 then
		colonne:=colonne+MAX;


	//mise en place du système pour mettre le nombre en position nord-ouest si la case nord-est est prise
	if T1[ligne,colonne]<>0 then
		begin
			ligne:=ligne-1;
			colonne:=colonne-1;
				if ligne>MAX then
					ligne:=ligne-MAX
				else if colonne<1 then
					colonne:=colonne+MAX
				else if ligne<1 then
					ligne:=ligne+MAX;
		end;

	//integration des données dans le tableau

	T1[ligne,colonne]:=i;

	//déplacement nord-est habituel 
	ligne:=ligne-1;
	colonne:=colonne+1;

	end;
	end;

procedure affichageCarre(var T1:Tableau2dim);
//BUT: Afficher le carré après traitement des autres procédures dans le programme principal
//ENTREE: i et j pour afficher la structure et les valeurs dans le tableau
//SORTIE: Affichage du tableau 


	var
	i:integer;
	j:integer;

	//affichage du carré complet apres traitement des variables
	BEGIN
	for i := 1 to MAX do
		begin
		for j:= 1 to MAX do
			begin
			write(T1[i,j],'  ');
			end;
			writeln;
		end;
	end;



var
	Carre : array[1..MAX,1..MAX] of integer;
	i,j,ligne,colonne:integer;

BEGIN

	clrscr;

	//appel des procedures dans le corps principal du programme
	initTab(Carre);
	constructCarre(Carre);
	writeln('Voici votre carre magique de taille : ', MAX, ' x ', MAX);
	affichageCarre(Carre);
	
	readln;
END.



