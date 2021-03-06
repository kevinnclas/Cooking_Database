create database cooking;
use cooking;
set sql_safe_updates=0;
--
-- CREEE PAR HULLARD ALEXANDRE & NICOLAS KEVIN
--
drop table if exists Top;
drop table if exists Client;
drop table if exists Commande;
drop table if exists CommandeDetails;
drop table if exists Recette;
drop table if exists Produit;
drop table if exists Fournisseur;
drop table if exists Composition;
--
-- CREATION DES TABLES
--
CREATE TABLE `cooking`.`Top` (
  `num_semaine` INT NOT NULL,
  `cdr_or` VARCHAR(40) NULL,
  `cdr_semaine` VARCHAR(40) NULL,
  `recette1` VARCHAR(40) NULL,
  `recette2` VARCHAR(40) NULL,
  `recette3` VARCHAR(40) NULL,
  `recette4` VARCHAR(40) NULL,
  `recette5` VARCHAR(40) NULL,
  PRIMARY KEY (`num_semaine`),
  CONSTRAINT `cdr_or` FOREIGN KEY (`cdr_or`)
		REFERENCES `cooking`.`Client` (`email`)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
  CONSTRAINT `cdr_semaine` FOREIGN KEY (`cdr_semaine`)
		REFERENCES `cooking`.`Client` (`email`)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
  CONSTRAINT `recette1` FOREIGN KEY (`recette1`)
		REFERENCES `cooking`.`Recette` (`nom_recette`)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
  CONSTRAINT `recette2` FOREIGN KEY (`recette2`)
		REFERENCES `cooking`.`Recette` (`nom_recette`)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
  CONSTRAINT `recette3` FOREIGN KEY (`recette3`)
		REFERENCES `cooking`.`Recette` (`nom_recette`)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
  CONSTRAINT `recette4` FOREIGN KEY (`recette4`)
		REFERENCES `cooking`.`Recette` (`nom_recette`)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
  CONSTRAINT `recette5` FOREIGN KEY (`recette5`)
		REFERENCES `cooking`.`Recette` (`nom_recette`)
        ON DELETE CASCADE
        ON UPDATE CASCADE);
--  
--  
CREATE TABLE `cooking`.`Client` (
  `prenom` VARCHAR(20) NULL,
  `nom` VARCHAR(20) NULL,
  `num` VARCHAR(10) NULL,
  `cooks` INT DEFAULT 0,
  `email` VARCHAR(40) NOT NULL,
  `mdp` VARCHAR(40) NOT NULL,
  `adresse` VARCHAR(40) NOT NULL,
  `codePostal` INT NOT NULL,
  `ville` VARCHAR(20) NOT NULL,
  `cdr_statut` BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (`email`));
--
--
CREATE TABLE `cooking`.`Recette` (
  `nom_recette` VARCHAR(40) NOT NULL,
  `type` VARCHAR(20) NULL,
  `description` VARCHAR(256) NULL,
  `prixUnit` FLOAT NOT NULL,
  `nb_commandes` INT NULL,
  `remuneration_cdr` INT NULL,
  `createur` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`nom_recette`),
  CONSTRAINT `createur` FOREIGN KEY (`createur`)
		REFERENCES `cooking`.`Client` (`email`)
        ON DELETE CASCADE
        ON UPDATE CASCADE);
 --
 --
CREATE TABLE `cooking`.`Commande` (
  `id_commande` INT AUTO_INCREMENT,
  `date` VARCHAR(60) NOT NULL,
  `prix` FLOAT DEFAULT 0.00,
  `id_client` VARCHAR(40) NOT NULL,
  `commentaire`VARCHAR (400) NULL,
  PRIMARY KEY (`id_commande`),
  CONSTRAINT `id_client` FOREIGN KEY (`id_client`)
		REFERENCES `cooking`.`Client` (`email`)
        ON UPDATE CASCADE);
--
--        
CREATE TABLE `cooking`.`CommandeDetails` (
  `num_ligne`INT AUTO_INCREMENT,
  `id_commande` INT NOT NULL,
  `quantit??` INT NOT NULL,
  `nom_recette` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`num_ligne`),
  CONSTRAINT `id_commande` FOREIGN KEY (`id_commande`)
		REFERENCES `cooking`.`Commande` (`id_commande`)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
  CONSTRAINT `nom_recette` FOREIGN KEY (`nom_recette`)
		REFERENCES `cooking`.`Recette` (`nom_recette`)
        ON DELETE CASCADE
        ON UPDATE CASCADE);
--
--
CREATE TABLE `cooking`.`Fournisseur` (
  `nom_F` VARCHAR(20) NOT NULL,
  `num_F` INT NULL,
  PRIMARY KEY (`nom_F`));
--
-- 
CREATE TABLE `cooking`.`Produit` (
  `nom_produit` VARCHAR(20) NOT NULL,
  `cat??gorie_produit` VARCHAR(20) NULL,
  `unit??` INT NULL,
  `stock` INT NOT NULL,
  `stock_min` INT NULL,
  `stock_max` INT NULL,
  `fournisseur` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`nom_produit`),
  CONSTRAINT `fournisseur` FOREIGN KEY (`fournisseur`)
		REFERENCES `cooking`.`Fournisseur` (`nom_F`)
        ON UPDATE CASCADE);
 --
 --
 CREATE TABLE `cooking`.`Composition` (
    `num_compo`INT AUTO_INCREMENT,
    `nomdelarecette` VARCHAR(40) NOT NULL,
    `produitID` VARCHAR(40) NOT NULL,   
    `quantit??` INT NOT NULL,
     PRIMARY KEY (`num_compo`),
     CONSTRAINT `produitID` FOREIGN KEY (`produitID`)
        REFERENCES `cooking`.`Produit` (`nom_produit`)
        ON UPDATE CASCADE,
	 CONSTRAINT `nomdelarecette` FOREIGN KEY (`nomdelarecette`)
		REFERENCES `cooking`.`Recette` (`nom_recette`)
		ON DELETE CASCADE
        ON UPDATE CASCADE);
--
-- INSERTION DANS LES TABLES
--  
-- TABLE TOP (0)
-- 
-- TABLE CLIENT (12)
--
INSERT INTO `cooking`.`Client` (`nom`,`prenom`,`num`,`email`,`mdp`,`adresse`,`codePostal`,`ville`) VALUES ('Juniot','G??rard','0610121418','gerardjugnot@gmail.com','icicestparis75','45 rue de la Paix', 75002,'Paris');
INSERT INTO `cooking`.`Client` (`nom`,`prenom`,`num`,`email`,`mdp`,`adresse`,`codePostal`,`ville`) VALUES ('Depardieu','G??rard','0680809078','gerarddepardieu@gmail.com','allezlol69','18 boulevard des Capucines', 75009,'Paris');
INSERT INTO `cooking`.`Client` (`nom`,`prenom`,`num`,`email`,`mdp`,`adresse`,`codePostal`,`ville`) VALUES ('Aulas','Jean-Michel','0669231054','jeanmichelaulas@gmail.com','neymar10','69 rue Louis Gu??rin', 69006,'Lyon');
INSERT INTO `cooking`.`Client` (`nom`,`prenom`,`num`,`email`,`mdp`,`adresse`,`codePostal`,`ville`) VALUES ('Kambouar??','Antoine','0615883002','antoinelimog??@gmail.com','championautomne','12 rue des Minimes', 72100,'Le Mans');
INSERT INTO `cooking`.`Client` (`nom`,`prenom`,`num`,`email`,`mdp`,`adresse`,`codePostal`,`ville`) VALUES ('Moscato','Vincent','0788265410','moscatoshow@gmail.com','rmc98','39 rue Montcade', 64300,'Orthez');
INSERT INTO `cooking`.`Client` (`nom`,`prenom`,`num`,`email`,`mdp`,`adresse`,`codePostal`,`ville`) VALUES ('Martin','Marvin','0789656600','lefuturzidane@gmail.com','findecarriere2012','10 rue Jean Jaur??s', 25600,'Sochaux');
INSERT INTO `cooking`.`Client` (`nom`,`prenom`,`num`,`email`,`mdp`,`adresse`,`codePostal`,`ville`) VALUES ('Desailly','Marcel','0652981465','ahahah98@gmail.com','best5210life','126 rue de Strasbourg', 44000,'Nantes');
INSERT INTO `cooking`.`Client` (`nom`,`prenom`,`num`,`email`,`mdp`,`adresse`,`codePostal`,`ville`) VALUES ('Saha','Louis','0589881214','louissaha@gmail.com','united2000LS','60 rue des Commailles', 95580,'Andilly');
INSERT INTO `cooking`.`Client` (`nom`,`prenom`,`num`,`email`,`mdp`,`adresse`,`codePostal`,`ville`) VALUES ('Watson','Emma','0621584336','emmawatson@gmail.com','harrypottercrush88','68 avenue Arago', 78600,'Maisons-Laffitte');
INSERT INTO `cooking`.`Client` (`nom`,`prenom`,`num`,`email`,`mdp`,`adresse`,`codePostal`,`ville`) VALUES ('Boulleau','Laure','0740163098','laureboulleau@gmail.com','sgmachine78','5 rue de Beauregard', 78300,'Poissy');
INSERT INTO `cooking`.`Client` (`nom`,`prenom`,`num`,`email`,`mdp`,`adresse`,`codePostal`,`ville`) VALUES ('Porrovecchio','Coralie','0721563098','golddigger13@gmail.com','kamaralpb13','29 rue des Pistoles', 13002,'Marseille');
INSERT INTO `cooking`.`Client` (`nom`,`prenom`,`num`,`email`,`mdp`,`adresse`,`codePostal`,`ville`) VALUES ('Casta','Laetitia','0754203099','castalaetita@gmail.com','iledebeaute2A','72 rue Henri Dunant', 20000,'Ajaccio');
--
-- TABLE RECETTE (6)
--
INSERT INTO `cooking`.`Recette` (`nom_recette`,`type`,`description`,`prixUnit`,`nb_commandes`,`remuneration_cdr`,`createur`) VALUES ('Quattro','Sandwich','Le quattro est un gros pain garni de steaks hach??s, fromage, salade, tomates, sauce au choix et le tout accompagn?? de frites. Il fait d??j?? fureur aupr??s de toute une g??n??ration, alors ne r??sistez plus!',16.00,0,2,'gerarddepardieu@gmail.com');
INSERT INTO `cooking`.`Recette` (`nom_recette`,`type`,`description`,`prixUnit`,`nb_commandes`,`remuneration_cdr`,`createur`) VALUES ('Grec','Sandwich','Cr???? dans les ann??es 70 en Allemagne, ce sandwich fourr?? de viande grill??e est un incontournable de la restauration rapide. Essayez d??s maintenant le v??tre!',10.00,0,2,'lefuturzidane@gmail.com');
INSERT INTO `cooking`.`Recette` (`nom_recette`,`type`,`description`,`prixUnit`,`nb_commandes`,`remuneration_cdr`,`createur`) VALUES ('Chebakia ?? la fourchette','Dessert','Vous connaissez s??rement les chebakia, ces d??licieuses p??tisserie du ramadan ?? la fleur d???oranger et au miel. Ce joli biscuit en forme de fleur fait vraiment partie des p??tisseries les plus appr??ci??es lors du ramadan !',11.00,0,2,'jeanmichelaulas@gmail.com');
INSERT INTO `cooking`.`Recette` (`nom_recette`,`type`,`description`,`prixUnit`,`nb_commandes`,`remuneration_cdr`,`createur`) VALUES ('Beignets de crevettes','Ap??ritif','Pour changer des cacahu??tes, des olives et autres g??teaux, cette recette aux crevettes est parfaite pour un ap??ritif. Facile ?? cuisiner, elle ne vous prendra que tr??s peu de temps ?? r??aliser.',14.00,0,2,'laureboulleau@gmail.com');
INSERT INTO `cooking`.`Recette` (`nom_recette`,`type`,`description`,`prixUnit`,`nb_commandes`,`remuneration_cdr`,`createur`) VALUES ('Pizza c??tog??ne viande-fromage','Plat','C???est l???une des recettes keto la plus simple et la plus basique. Cette p??te de pizza si particuli??re est faites de ?? lipides ?? et la combinaison de mozzarella et de poudre d???amandes donne une cro??te ?? pizza tr??s go??teuse.',35.00,0,2,'emmawatson@gmail.com');
INSERT INTO `cooking`.`Recette` (`nom_recette`,`type`,`description`,`prixUnit`,`nb_commandes`,`remuneration_cdr`,`createur`) VALUES ('Margarita','Cocktails','Connu dans le monde entier, le cocktail margarita est originaire du Mexique. Id??ale en ??t??, le cocktail margarita se sert g??n??ralement dans un verre ?? pied et peut se d??corer avec du sucre et des fruits sur le verre.',18.00,0,2,'emmawatson@gmail.com');
--
-- TABLE COMPOSITION (31)
--
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Quattro','Pain ?? kebab',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Quattro','Herbes de Provence',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Quattro','Tomate',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Quattro','Tranche de cheddar',2);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Quattro','Portion de frites',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Quattro','Oignon blanc',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Quattro','Sauce samoura??',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Quattro','Steak hach??',4);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Grec','Pain ?? kebab',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Grec','Salade',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Grec','Tomate',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Grec','Oignon blanc',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Grec','Viande kebab',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Grec','Tranche de cheddar',2);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Grec','Sauce samoura??',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Grec','Yaourt nature',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Chebakia ?? la fourchette','P??te ?? chebakia',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Chebakia ?? la fourchette','Huile',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Beignets de crevettes','Crevettes fraiches',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Beignets de crevettes','Panure',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Beignets de crevettes','Huile',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Beignets de crevettes','Oeuf',2);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Pizza c??tog??ne viande-fromage','P??te ?? pizza',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Pizza c??tog??ne viande-fromage','Oeuf',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Pizza c??tog??ne viande-fromage','Yaourt nature',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Pizza c??tog??ne viande-fromage','Boule de mozzarella',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Pizza c??tog??ne viande-fromage','Poivron jaune',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Pizza c??tog??ne viande-fromage','Sachet gruy??re rap??',1);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Margarita','Tequila',5);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Margarita','Triple sec',3);
INSERT INTO `cooking`.`Composition` (`nomdelarecette`,`produitID`,`quantit??`) VALUES ('Margarita','Jus de citron',2);
--
-- TABLE PRODUITS (23)
--
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Pain ?? kebab','Pain',1,250,187,312,'Davigel');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Herbes de Provence','Garniture',1,100,75,125,'Distram');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Tomate','Garniture',1,500,375,625,'Distram');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Tranche de cheddar','Garniture',1,750,562,937,'Distram');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Oignon blanc','Garniture',1,400,300,500,'Distram');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Sauce samoura??','Sauce',1,100,75,125,'Distram');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Steak hach??','Viande',1,1000,750,1250,'Krill');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Portion de frites','Garniture',1,800,600,1000,'Krill');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Salade','Garniture',1,500,375,625,'Distram');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Viande kebab','Viande',1,600,450,750,'Krill');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Yaourt nature','Garniture',1,600,450,750,'Passionfroid');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('P??te ?? chebakia','P??te',1,300,225,375,'Dune Patisserie');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Huile','Graisse',1,400,300,500,'Epsilon');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Crevettes fraiches','Poisson',1,800,600,1000,'Miamland');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Panure','Farine',1,500,375,625,'Miamland');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Oeuf','Garniture',1,300,225,375,'Miamland');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('P??te ?? pizza','P??te',1,200,150,250,'Miamland');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Boule de mozzarella','Garniture',1,300,225,375,'Davigel');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Poivron jaune','Garniture',1,500,375,625,'Davigel');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Sachet gruy??re rap??','Garniture',1,100,75,125,'Davigel');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Tequila','Alcool',1,250,187,312,'Agidra');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Triple sec','Alcool',1,200,150,250,'Agidra');
INSERT INTO `cooking`.`Produit` (`nom_produit`,`cat??gorie_produit`,`unit??`,`stock`,`stock_min`,`stock_max`,`fournisseur`) VALUES ('Jus de citron','Jus',1,300,225,375,'Agidra');
--
-- TABLE FOURNISSEUR (8)
--
INSERT INTO `cooking`.`Fournisseur` (`nom_F`,`num_F`) VALUES ('Agidra',0139685722);
INSERT INTO `cooking`.`Fournisseur` (`nom_F`,`num_F`) VALUES ('Davigel',0155872136);
INSERT INTO `cooking`.`Fournisseur` (`nom_F`,`num_F`) VALUES ('Krill',0915872176);
INSERT INTO `cooking`.`Fournisseur` (`nom_F`,`num_F`) VALUES ('Miamland',0189878936);
INSERT INTO `cooking`.`Fournisseur` (`nom_F`,`num_F`) VALUES ('Epsilon',0955210936);
INSERT INTO `cooking`.`Fournisseur` (`nom_F`,`num_F`) VALUES ('Dune Patisserie',0155992136);
INSERT INTO `cooking`.`Fournisseur` (`nom_F`,`num_F`) VALUES ('Passionfroid',0905072936);
INSERT INTO `cooking`.`Fournisseur` (`nom_F`,`num_F`) VALUES ('Distram',0167502136);
--
-- TABLE COMMANDE (6)
--
INSERT INTO `cooking`.`Commande` (`date`,`id_client`,`commentaire`) VALUES ('10/05/2020','ahahah98@gmail.com','si possible avoir plus de sauce dans le quattro et beaucoup de frites dans le tacos merci');
INSERT INTO `cooking`.`Commande` (`date`,`id_client`,`commentaire`) VALUES ('10/05/2020','gerarddepardieu@gmail.com','ne vous limitez pas sur la tequila !');
INSERT INTO `cooking`.`Commande` (`date`,`id_client`,`commentaire`) VALUES ('10/05/2020','antoinelimog??@gmail.com','Sonnerie Kombouar?? au batiment 4');
INSERT INTO `cooking`.`Commande` (`date`,`id_client`,`commentaire`) VALUES ('10/05/2020','gerardjugnot@gmail.com',NULL);
INSERT INTO `cooking`.`Commande` (`date`,`id_client`,`commentaire`) VALUES ('10/05/2020','louissaha@gmail.com',NULL);
INSERT INTO `cooking`.`Commande` (`date`,`id_client`,`commentaire`) VALUES ('10/05/2020','moscatoshow@gmail.com','Besoin de pas mal de serviettes svp');
--
-- TABLE COMMANDE DETAILS (10)
--
INSERT INTO `cooking`.`CommandeDetails` (`id_commande`,`quantit??`,`nom_recette`) VALUES (1,1,'Quattro');
INSERT INTO `cooking`.`CommandeDetails` (`id_commande`,`quantit??`,`nom_recette`) VALUES (2,4,'Margarita');
INSERT INTO `cooking`.`CommandeDetails` (`id_commande`,`quantit??`,`nom_recette`) VALUES (3,1,'Beignets de crevettes');
INSERT INTO `cooking`.`CommandeDetails` (`id_commande`,`quantit??`,`nom_recette`) VALUES (3,1,'Pizza c??tog??ne viande-fromage');
INSERT INTO `cooking`.`CommandeDetails` (`id_commande`,`quantit??`,`nom_recette`) VALUES (4,3,'Grec');
INSERT INTO `cooking`.`CommandeDetails` (`id_commande`,`quantit??`,`nom_recette`) VALUES (5,6,'Margarita');
INSERT INTO `cooking`.`CommandeDetails` (`id_commande`,`quantit??`,`nom_recette`) VALUES (6,1,'Quattro');
INSERT INTO `cooking`.`CommandeDetails` (`id_commande`,`quantit??`,`nom_recette`) VALUES (6,1,'Grec');
INSERT INTO `cooking`.`CommandeDetails` (`id_commande`,`quantit??`,`nom_recette`) VALUES (6,1,'Chebakia ?? la fourchette');
INSERT INTO `cooking`.`CommandeDetails` (`id_commande`,`quantit??`,`nom_recette`) VALUES (6,2,'Margarita');
--
-- UPDATE A FAIRE APRES INSERTION !!
--
update Recette set nb_commandes=2 where nom_recette='Quattro';
update Recette set nb_commandes=12 where nom_recette='Margarita';
update Recette set nb_commandes=1 where nom_recette='Pizza c??tog??ne viande-fromage';
update Recette set nb_commandes=4 where nom_recette='Grec';
update Recette set nb_commandes=1 where nom_recette='Chebakia ?? la fourchette';
update Recette set nb_commandes=1 where nom_recette='Beignets de crevettes';
update Recette set prixUnit=20 where nom_recette='Margarita';
update Recette set prixUnit=20 where nom_recette='Margarita';
update Commande set prix=77 where id_commande=6;
update Commande set prix=108 where id_commande=5;
update Commande set prix=30 where id_commande=4;
update Commande set prix=49 where id_commande=3;
update Commande set prix=72 where id_commande=2;
update Commande set prix=16 where id_commande=1;
update Client set cooks=26 where email='emmawatson@gmail.com';
update Client set cooks=2 where email='laureboulleau@gmail.com';
update Client set cooks=2 where email='jeanmichelaulas@gmail.com';
update Client set cooks=8 where email='lefuturzidane@gmail.com';