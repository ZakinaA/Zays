-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 09 jan. 2023 à 14:29
-- Version du serveur : 8.0.25
-- Version de PHP : 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ZAYS`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartement`
--

CREATE TABLE `appartement` (
  `id` int NOT NULL,
  `immeuble_id` int DEFAULT NULL,
  `porte` int DEFAULT NULL,
  `surface` double DEFAULT NULL,
  `surface_sol` double DEFAULT NULL,
  `situation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `equipements` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `travaux` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ventilation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `appartement`
--

INSERT INTO `appartement` (`id`, `immeuble_id`, `porte`, `surface`, `surface_sol`, `situation`, `equipements`, `travaux`, `ventilation`) VALUES
(57, 1, 1, 15.11, 15.11, 'Rez de chaussée', 'cuisine équipée, plaque vitrocéramique 2 feux', 'Rénovation totale de l’appartement d’un motant total ed 9000€ : isolation murs et plafonds, murs, electricité, peinture pafonds et murs, plomberie, installation cuisine équipée', NULL),
(58, 1, 2, NULL, NULL, 'Rez de chaussée', 'cuisine équipée, plaque vitrocéramique 2 feux', NULL, NULL),
(59, 1, 3, 21, 21, 'cour extérieure', 'cuisine équipée, plaque vitrocéramique 2 feux', 'Rénovation  de l’appartement  au 15 aout 2021 : toiture, étanchéité, isolation plafond,  rénovation des murs et du plafond, peintures plafonds et murs, pose d’un ventilation mécanique par insufflation.', 'A droite de la porte d’entrée, boitier de Ventilation Mécanique par Insufflation, livrée avec une télécommande. Cet appareil doit rester en fonctionnement permanent. '),
(60, 1, 4, NULL, NULL, 'cour extérieure', 'cuisine équipée, plaque vitrocéramique 2 feux', NULL, NULL),
(61, 1, 5, 18.86, 18.86, '1er étage', 'cuisine équipée, plaque vitrocéramique 2 feux', 'Rénovation  de l’appartement en novembre 2019 : isolation plafond, rénovation des murs et du plafond, peintures plafonds et murs.', NULL),
(62, 1, 6, 25, 25, '1er étage', 'cuisine équipée (réfrigérateur, plaque 2 feux)', 'Rénovation totale de l’appartement pour un montant de 9000 € au 30 juin 2019: isolation, électricité, peintures, plomberie, installation cuisine équipée, réfection salle de bain, installation d’une douche, vasque, meuble,WC et détecteur de fumée.', NULL),
(63, 1, 7, 14.31, 23, '2ème étage', 'cuisine équipée (réfrigérateur, plaque 2 feux)', 'Rénovation  de l’appartement en octobre 2019 : toiture, étanchéité, isolation plafond,  rénovation des murs et du plafond, peintures plafonds et murs.', NULL),
(64, 1, 8, 16, 28, '2ème étage', 'cuisine équipée (un casserolier, un meuble évier, un meuble 1 porte, plaque 2 feux)', 'Rénovation totale en septembre 2019 pour un montant de 8500 € : toiture, étanchéité, isolation, électricité, peinture, plomberie, installation cuisine équipée, réfection salle de bain avec installation d’une douche, vasque, meuble,WC et alarme incendie.', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `associe`
--

CREATE TABLE `associe` (
  `id` int NOT NULL,
  `societe_id` int DEFAULT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_rue` int DEFAULT NULL,
  `rue` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copos` int DEFAULT NULL,
  `ville` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tel` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_part` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fonction` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `associe`
--

INSERT INTO `associe` (`id`, `societe_id`, `nom`, `prenom`, `num_rue`, `rue`, `copos`, `ville`, `num_tel`, `mail`, `nb_part`, `fonction`) VALUES
(1, 1, 'CAUVIN', 'Sébastien', 4, 'Rue Guillaume de la Tremblaye', 14000, 'Caen', NULL, NULL, '25', 'Gérant'),
(2, 1, 'JOSEPH', 'Aurore', 11, 'Avenue de Normandie', 14150, 'Ouistreham', NULL, NULL, '25', 'co-gérant'),
(3, 1, 'ANNOUCHE', 'Zakina', 6, 'Rue du bac', 78300, 'Poissy', NULL, NULL, '25', 'associé'),
(4, 1, 'BUIRON', 'Yann', 11, 'Avenue de Normandie', 14150, 'Ouistreham', NULL, NULL, '25', 'associé');

-- --------------------------------------------------------

--
-- Structure de la table `bail`
--

CREATE TABLE `bail` (
  `id` int NOT NULL,
  `appartement_id` int DEFAULT NULL,
  `associe_id` int DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `montant_hc` double DEFAULT NULL,
  `montant_charges` double DEFAULT NULL,
  `montant_caution` double DEFAULT NULL,
  `nom_caution1` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_caution2` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `duree_bail` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bail_signe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat_lieu_entree` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat_lieu_sortie` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attestation_assurance` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `montant_prem_echeance` double DEFAULT NULL,
  `montant_der_echeance` double DEFAULT NULL,
  `archive` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bail`
--

INSERT INTO `bail` (`id`, `appartement_id`, `associe_id`, `date_debut`, `montant_hc`, `montant_charges`, `montant_caution`, `nom_caution1`, `nom_caution2`, `date_fin`, `duree_bail`, `bail_signe`, `etat_lieu_entree`, `etat_lieu_sortie`, `attestation_assurance`, `montant_prem_echeance`, `montant_der_echeance`, `archive`) VALUES
(1, 57, NULL, '2022-08-01', 290, 30, 290, 'M. Antony Carpentier, père de Zoé Carpentier', 'Mme Séverien Carpentier, mère de Zoé Carpentier', NULL, '6 ans', NULL, NULL, NULL, NULL, 320, NULL, NULL),
(2, 58, NULL, '2020-09-01', 390, 30, 390, 'néant', NULL, NULL, '6 ans', NULL, NULL, NULL, NULL, 390, NULL, NULL),
(3, 59, 3, '2021-09-01', 380, 30, 380, 'Cautionnement VISALE', NULL, NULL, '6 ans', NULL, NULL, NULL, NULL, 103, NULL, NULL),
(4, 61, NULL, '2022-05-01', 340, 30, 340, 'Cautionnement VISALE n°V10441890010', NULL, NULL, '6 ans', NULL, NULL, NULL, NULL, 370, NULL, NULL),
(5, 62, NULL, '2019-07-01', 370, 30, 370, 'néant', NULL, NULL, '6 ans', NULL, NULL, NULL, NULL, 400, NULL, NULL),
(6, 63, NULL, '2022-05-01', 360, 30, 360, 'Cautionnement VISALE n°V10442841554', NULL, NULL, '', NULL, NULL, NULL, NULL, 122, NULL, NULL),
(7, 64, NULL, '2021-08-13', 380, 30, 380, 'Cautionnement VISALE', NULL, NULL, '6 ans', NULL, NULL, NULL, NULL, 292, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `bail_locataire`
--

CREATE TABLE `bail_locataire` (
  `bail_id` int NOT NULL,
  `locataire_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bail_locataire`
--

INSERT INTO `bail_locataire` (`bail_id`, `locataire_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int NOT NULL,
  `libelle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `libelle`) VALUES
(1, 'Loyer'),
(2, 'Caution'),
(3, 'Emprunt'),
(4, 'Assurance'),
(5, 'Impôt'),
(6, 'Divers'),
(7, 'Entretien'),
(8, 'Charges'),
(9, 'Travaux');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230104091417', '2023-01-04 09:28:52', 32170),
('DoctrineMigrations\\Version20230105091755', '2023-01-05 09:18:30', 2787),
('DoctrineMigrations\\Version20230106075429', '2023-01-06 07:54:56', 4824),
('DoctrineMigrations\\Version20230106092240', '2023-01-06 09:22:51', 2966);

-- --------------------------------------------------------

--
-- Structure de la table `immeuble`
--

CREATE TABLE `immeuble` (
  `id` int NOT NULL,
  `societe_id` int DEFAULT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_rue` int DEFAULT NULL,
  `rue` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copos` int DEFAULT NULL,
  `ville` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `immeuble`
--

INSERT INTO `immeuble` (`id`, `societe_id`, `nom`, `num_rue`, `rue`, `copos`, `ville`) VALUES
(1, 1, NULL, 97, 'Rue de Falaise', 14000, 'Caen');

-- --------------------------------------------------------

--
-- Structure de la table `locataire`
--

CREATE TABLE `locataire` (
  `id` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `lieu_naissance` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `montant_caf` double DEFAULT NULL,
  `archive` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `locataire`
--

INSERT INTO `locataire` (`id`, `nom`, `prenom`, `date_naissance`, `lieu_naissance`, `montant_caf`, `archive`) VALUES
(1, 'CARPENTIER', 'Zoé', '2004-01-16', 'Lisieux', NULL, NULL),
(2, 'LECUYER', 'Christine', '1957-06-22', 'Caen', 22, NULL),
(3, 'KHASMI', 'Mehdi', '1993-08-06', 'Montivillers', 277, NULL),
(4, 'JOACHIM', 'Romane', '2003-09-02', 'Caen', NULL, NULL),
(5, 'LESSU FALIO', 'Elsa', '1993-10-23', 'Douala (Cameroun)', NULL, NULL),
(6, 'LAURENT', 'Charlotte', '2004-03-25', 'Coutances', 268, NULL),
(7, 'JOUVIN', 'Théo', '2001-12-19', NULL, 118, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mois_annee`
--

CREATE TABLE `mois_annee` (
  `id` int NOT NULL,
  `date_mois_annee` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mois_annee`
--

INSERT INTO `mois_annee` (`id`, `date_mois_annee`) VALUES
(1, '2022-01-01'),
(2, '2022-02-01'),
(3, '2022-03-01'),
(4, '2022-04-01'),
(5, '2022-05-01'),
(6, '2022-06-01'),
(7, '2022-07-01'),
(8, '2022-08-01'),
(9, '2022-09-01'),
(10, '2022-10-01'),
(11, '2022-11-01'),
(12, '2022-12-01'),
(13, '2023-01-01'),
(14, '2023-02-01'),
(15, '2023-03-01'),
(16, '2023-04-01'),
(17, '2023-05-01'),
(18, '2023-06-01'),
(19, '2023-07-01'),
(20, '2023-08-01');

-- --------------------------------------------------------

--
-- Structure de la table `mouvement`
--

CREATE TABLE `mouvement` (
  `id` int NOT NULL,
  `sous_categorie_id` int DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit` double DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `date_m` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mouvement`
--

INSERT INTO `mouvement` (`id`, `sous_categorie_id`, `libelle`, `debit`, `credit`, `date_m`) VALUES
(1, 59, 'PRELEVEMENT ELECTRICITE DE FRANCE', 55.47, 0, '2022-12-19'),
(2, 55, 'REMBOURSEMENT DE PRET 10001119643 ECHEANCE 10/12/22  ', 598.13, 0, '2022-12-10'),
(3, 55, 'REMBOURSEMENT DE PRET 10000255789 ECHEANCE 10/12/22 ', 579.49, 0, '2022-12-10'),
(4, 55, 'REMBOURSEMENT DE PRET   \n10000255790 ECHEANCE    10/12/22 ', 59.33, 0, '2022-12-10'),
(5, 8, 'VIREMENT EN VOTRE FAVEUR\nM JOUVIN TEO VU23411ES07RL001 VIR DE M JOUVIN TEO    ', 0, 292, '2022-12-07'),
(6, 3, 'VIREMENT EN VOTRE FAVEUR\nM KASMI MEHDI VIREMENT VERS SCI VIREMENT DE M KASMI MEHDI ', 0, 103, '2022-12-07'),
(7, 6, 'VIREMENT EN VOTRE FAVEUR\nML LESSU FALIO ELSA VIREMENT VER VIREMENT DE ML LESSU FALIO ELSA         ', 0, 400, '2022-12-06'),
(8, 5, 'VIREMENT EN VOTRE FAVEUR\nMLLE ROMANE JOACHIM VIREMENT VER VIREMENT DE MLLE ROMANE JOACHIM         ', 0, 370, '2022-12-06'),
(9, 1, 'VIREMENT EN VOTRE FAVEUR\nDE MLE      CARPENTIER ZOE                        ', 0, 320, '2022-12-06'),
(10, 2, 'VIREMENT EN VOTRE FAVEUR\nMME LECUYER CHRISTINE LOYER LOYER', 0, 380, '2022-12-06'),
(11, 58, 'PRELEVEMENT             \nVEOLIA EAU - COMPAGNIE GENERALE RUM:XX131306450SEPA                           -', 31.52, 0, '2022-12-05'),
(12, 11, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 17135565V16 0752816HKASMI     ', 0, 277, '2022-12-05'),
(13, 15, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 17135992V16 0774612JLAURENT  ', 0, 268, '2022-12-05'),
(14, 7, 'VIREMENT EN VOTRE FAVEUR\nMLLE LAURENT CHARLOTTE VIREMENT VIREMENT DE MLLE LAURENT CHARLOTTE ', 0, 122, '2022-12-05'),
(15, 16, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 17135469V16 0749382TJOUVIN     ', 0, 118, '2022-12-05'),
(16, 10, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 17131193V16 0416158DLECUYER     ', 0, 22, '2022-12-05'),
(17, 50, 'REGLEMENT               \nASSU. CNP PRET HABITAT 12/22  ', 31.96, 0, '2022-12-02'),
(18, 50, 'REGLEMENT               \nASSU. CAAE PRET HABITAT 12/22  ', 27.18, 0, '2022-12-02'),
(19, 53, 'PRELEVEMENT             \nDIRECTION GENERALE DES FINANCES 140664663470050246 111                      MENM314019483831066  IMPOT ', 178, 0, '2022-11-15'),
(20, 55, 'PRELEVEMENT CARTE       \nDEPENSES CARTE X5009 AU 31/10/22  ', 2.5, 0, '2022-11-14'),
(21, 55, 'REMBOURSEMENT DE PRET   \n10001119643 ECHEANCE    10/11/22  ', 598.13, 0, '2022-11-10'),
(22, 55, 'REMBOURSEMENT DE PRET   \n10000255789 ECHEANCE    10/11/22  ', 579.49, 0, '2022-11-10'),
(23, 55, 'REMBOURSEMENT DE PRET   \n10000255790 ECHEANCE    10/11/22  ', 59.33, 0, '2022-11-10'),
(24, 68, 'PRELEVEMENT             \nFACTURE 10/2022 N?2230400143192  \n', 52.5, 0, '2022-11-07'),
(25, 8, 'VIREMENT EN VOTRE FAVEUR\nM JOUVIN TEO VU23101R87PE8P01 VIR DE M JOUVIN TEO ', 0, 292, '2022-11-07'),
(26, 58, 'PRELEVEMENT             \nVEOLIA EAU - COMPAGNIE GENERALE RUM:XX131306450SEPA  ', 31.52, 0, '2022-11-07'),
(27, 6, 'VIREMENT EN VOTRE FAVEUR\nML LESSU FALIO ELSA VIREMENT VER VIREMENT DE ML LESSU FALIO ELSA ', 0, 400, '2022-11-07'),
(28, 5, 'VIREMENT EN VOTRE FAVEUR\nMLLE ROMANE JOACHIM VIREMENT VER VIREMENT DE MLLE ROMANE JOACHIM      ', 0, 370, '2022-11-07'),
(29, 7, 'VIREMENT EN VOTRE FAVEUR\nMLLE LAURENT CHARLOTTE VIREMENT VIREMENT DE MLLE LAURENT CHARLOTTE ', 0, 122, '2022-11-07'),
(30, 3, 'VIREMENT EN VOTRE FAVEUR\nM KASMI MEHDI VIREMENT VERS SCI VIREMENT DE M KASMI MEHDI ', 0, 103, '2022-11-07'),
(31, 1, 'VIREMENT EN VOTRE FAVEUR\nDE MLE      CARPENTIER ZOE                ', 0, 320, '2022-11-07'),
(32, 2, 'VIREMENT EN VOTRE FAVEUR\nMME LECUYER CHRISTINE LOYER LOYER ', 0, 380, '2022-11-07'),
(33, 11, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16854055V16 0752816HKASMI ', 0, 277, '2022-11-04'),
(34, 15, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16854486V16 0774612JLAURENT     102022ME ', 0, 268, '2022-11-04'),
(35, 16, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16853960V16 0749382TJOUVIN                     ', 0, 118, '2022-11-04'),
(36, 10, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16849664V16 0416158DLECUYER ', 0, 22, '2022-11-04'),
(37, 50, 'REGLEMENT               \nASSU. CNP PRET HABITAT 11/22  ', 31.96, 0, '2022-11-03'),
(38, 50, 'REGLEMENT               \nASSU. CAAE PRET HABITAT 11/22  ', 27.18, 0, '2022-11-03'),
(39, 54, 'EFFETS DOMICILIES       \nDOMICILIES  ', 36.06, 0, '2022-10-31'),
(40, 68, 'CHEQUE EMIS             \n1849367  ', 3793.53, 0, '2022-10-31'),
(41, 59, 'PRELEVEMENT             \nELECTRICITE DE FRANCE Numero de client : 6012189567 - Numero de', 41.94, 0, '2022-10-19'),
(42, 53, 'PRELEVEMENT             \nDIRECTION GENERALE DES FINANCES 140664663470050246 111                      MENM314019483831066  IMPOT TF \nNNFR46ZZZ005002M314019483831       \nFR46ZZZ005002                      \n1E087000014066M314019483831        ', 294, 0, '2022-10-17'),
(43, 68, 'CHEQUE EMIS             \n6013608/0000000/000000000 ', 6014.9, 0, '2022-10-11'),
(44, 55, 'REMBOURSEMENT DE PRET   \n10001119643 ECHEANCE    10/10/22 ', 598.13, 0, '2022-10-10'),
(45, 55, 'REMBOURSEMENT DE PRET   \n10000255789 ECHEANCE    10/10/22 ', 579.49, 0, '2022-10-10'),
(46, 55, 'REMBOURSEMENT DE PRET   \n10000255790 ECHEANCE    10/10/22 ', 59.33, 0, '2022-10-10'),
(47, 3, 'VIREMENT EN VOTRE FAVEUR\nVIR INST de M KASMI MEHDI VIREMENT DE M KASMI MEHDI \nVIREMENT VERS SCI ZAYS             ', 0, 103, '2022-10-07'),
(48, 5, 'VIREMENT EN VOTRE FAVEUR\nMLE ROMANE JOACHIM C18D22279N004 LOYER JOACHIM \nC18D22279N00412                    ', 0, 370, '2022-10-07'),
(49, 6, 'VIREMENT EN VOTRE FAVEUR\nML LESSU FALIO ELSA VIREMENT VER VIREMENT DE ML LESSU FALIO ELSA \nVIREMENT VERS SCI ZAYS             ', 0, 400, '2022-10-06'),
(50, 8, 'VIREMENT EN VOTRE FAVEUR\nM JOUVIN TEO VU22782XAJUSBX01 VIR DE M JOUVIN TEO \nVU22782XAJUSBX01                   ', 0, 292, '2022-10-06'),
(51, 1, 'VIREMENT EN VOTRE FAVEUR\nDE MLE      CARPENTIER ZOE \nLoyer                              ', 0, 320, '2022-10-06'),
(52, 2, 'VIREMENT EN VOTRE FAVEUR\nMME LECUYER CHRISTINE LOYER LOYER ', 0, 380, '2022-10-06'),
(53, 58, 'PRELEVEMENT             \nVEOLIA EAU - COMPAGNIE GENERALE RUM:XX131306450SEPA                    /ICS:FR68ZZZ437614                      -084830010193010422002         1 \nXX131306450SEPA                    \nFR68ZZZ437614                      \na2bee2e6be2f4', 31.52, 0, '2022-10-05'),
(54, 11, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16716996V16 0752816HKASMI       092022ME \n16716996V16                        ', 0, 277, '2022-10-05'),
(55, 15, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16717439V16 0774612JLAURENT     092022ME \n16717439V16                        ', 0, 268, '2022-10-05'),
(56, 16, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16716902V16 0749382TJOUVIN      092022ME \n16716902V16                        ', 0, 118, '2022-10-05'),
(57, 10, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16712499V16 0416158DLECUYER     092022ME \n16712499V16                        ', 0, 25, '2022-10-05'),
(58, 50, 'REGLEMENT               \nASSU. CNP PRET HABITAT 10/22 ', 31.96, 0, '2022-10-04'),
(59, 50, 'REGLEMENT               \nASSU. CAAE PRET HABITAT 10/22 ', 27.18, 0, '2022-10-04'),
(60, 7, 'VIREMENT EN VOTRE FAVEUR\nMLLE LAURENT CHARLOTTE VIREMENT VIREMENT DE MLLE LAURENT CHARLOTTE \nVIREMENT VERS SEBAS                ', 0, 122, '2022-10-03'),
(61, 53, 'PRELEVEMENT             \nDIRECTION GENERALE DES FINANCES 140664663470050246 111                      MENM314019483831066  IMPOT TF \nNNFR46ZZZ005002M314019483831       \nFR46ZZZ005002                      \n1E087000014066M314019483831        ', 294, 0, '2022-09-15'),
(62, 55, 'REMBOURSEMENT DE PRET   \n10001119643 ECHEANCE    10/09/22 ', 598.13, 0, '2022-09-10'),
(63, 55, 'REMBOURSEMENT DE PRET   \n10000255789 ECHEANCE    10/09/22 ', 579.49, 0, '2022-09-10'),
(64, 55, 'REMBOURSEMENT DE PRET   \n10000255790 ECHEANCE    10/09/22 ', 59.33, 0, '2022-09-10'),
(65, 6, 'VIREMENT EN VOTRE FAVEUR\nML LESSU FALIO ELSA VIREMENT VER VIREMENT DE ML LESSU FALIO ELSA \nVIREMENT VERS SCI ZAYS             ', 0, 400, '2022-09-06'),
(66, 1, 'VIREMENT EN VOTRE FAVEUR\nDE MLE      CARPENTIER ZOE \nLoyer                              ', 0, 320, '2022-09-06'),
(67, 2, 'VIREMENT EN VOTRE FAVEUR\nMME LECUYER CHRISTINE LOYER LOYER ', 0, 380, '2022-09-06'),
(68, 5, 'VIREMENT EN VOTRE FAVEUR\nMle JOACHIM ROMANE VK224815MVNPM VIR DE MLE JOACHIM ROMANE \nVK224815MVNPMW01                   ', 0, 370, '2022-09-05'),
(69, 8, 'VIREMENT EN VOTRE FAVEUR\nM JOUVIN TEO VU224818DSGLNR01 VIR DE M JOUVIN TEO \nVU224818DSGLNR01                   ', 0, 248, '2022-09-05'),
(70, 7, 'VIREMENT EN VOTRE FAVEUR\nMLLE LAURENT CHARLOTTE VIREMENT VIREMENT DE MLLE LAURENT CHARLOTTE \nVIREMENT VERS SEBAS                ', 0, 109, '2022-09-05'),
(71, 58, 'PRELEVEMENT             \nVEOLIA EAU - COMPAGNIE GENERALE RUM:XX131306450SEPA                    /ICS:FR68ZZZ437614                      -084830010193010422001         1 \nXX131306450SEPA                    \nFR68ZZZ437614                      \nad2d970cd0f34', 31.52, 0, '2022-09-05'),
(72, 3, 'VIREMENT EN VOTRE FAVEUR\nVIR INST de M KASMI MEHDI VIREMENT DE M KASMI MEHDI \nVIREMENT VERS SCI ZAYS             ', 0, 177, '2022-09-05'),
(73, 15, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16515685V16 0774612JLAURENT     082022ME \n16515685V16                        ', 0, 281, '2022-09-05'),
(74, 11, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16515251V16 0752816HKASMI       082022ME \n16515251V16                        ', 0, 203, '2022-09-05'),
(75, 16, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16515159V16 0749382TJOUVIN      082022ME \n16515159V16                        ', 0, 162, '2022-09-05'),
(76, 10, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16510761V16 0416158DLECUYER     082022ME \n16510761V16                        ', 0, 25, '2022-09-05'),
(77, 50, 'REGLEMENT               \nASSU. CNP PRET HABITAT 09/22 ', 31.96, 0, '2022-09-02'),
(78, 50, 'REGLEMENT               \nASSU. CAAE PRET HABITAT 09/22 ', 27.18, 0, '2022-09-02'),
(79, 59, 'PRELEVEMENT             \nELECTRICITE DE FRANCE Numero de client : 6012189567 - Numero de compte : xxx 004021382958 \nMM9760121895670001                 \nFR47EDF001007                      \nZ020018852940 11403 1   SIMM    114', 41.59, 0, '2022-08-19'),
(80, 16, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16431422V16 0749382TJOUVIN      180822JO \n16431422V16                        ', 0, 21, '2022-08-18'),
(81, 11, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16431492V16 0752816HKASMI       180822JO \n16431492V16                        ', 0, 16, '2022-08-18'),
(82, 10, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16427571V16 0416158DLECUYER     180822JO \n16427571V16                        ', 0, 15, '2022-08-18'),
(83, 15, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16431842V16 0774612JLAURENT     180822JO \n16431842V16                        ', 0, 9, '2022-08-18'),
(84, 53, 'PRELEVEMENT             \nDIRECTION GENERALE DES FINANCES 140664663470050246 111                      MENM314019483831066  IMPOT TF \nNNFR46ZZZ005002M314019483831       \nFR46ZZZ005002                      \n1E087000014066M314019483831        ', 294, 0, '2022-08-16'),
(85, 55, 'REMBOURSEMENT DE PRET   \n10001119643 ECHEANCE    10/08/22 ', 598.13, 0, '2022-08-10'),
(86, 55, 'REMBOURSEMENT DE PRET   \n10000255789 ECHEANCE    10/08/22 ', 579.49, 0, '2022-08-10'),
(87, 55, 'REMBOURSEMENT DE PRET   \n10000255790 ECHEANCE    10/08/22 ', 59.33, 0, '2022-08-10'),
(88, 6, 'VIREMENT EN VOTRE FAVEUR\nML LESSU FALIO ELSA VIREMENT VER VIREMENT DE ML LESSU FALIO ELSA \nVIREMENT VERS SCI ZAYS             ', 0, 400, '2022-08-08'),
(89, 8, 'VIREMENT EN VOTRE FAVEUR\nM JOUVIN TEO VU22172XDQ1EES01 VIR DE M JOUVIN TEO \nVU22172XDQ1EES01                   ', 0, 210, '2022-08-08'),
(90, 2, 'VIREMENT EN VOTRE FAVEUR\nMME LECUYER CHRISTINE LOYER LOYER ', 0, 380, '2022-08-08'),
(91, 7, 'VIREMENT EN VOTRE FAVEUR\nMLLE LAURENT CHARLOTTE VIREMENT VIREMENT DE MLLE LAURENT CHARLOTTE \nVIREMENT VERS SEBAS                ', 0, 118, '2022-08-05'),
(92, 15, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16280100V16 0774612JLAURENT     072022ME \n16280100V16                        ', 0, 272, '2022-08-05'),
(93, 16, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16279613V16 0749382TJOUVIN      072022ME \n16279613V16                        ', 0, 199, '2022-08-05'),
(94, 11, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16279700V16 0752816HKASMI       072022ME \n16279700V16                        ', 0, 187, '2022-08-05'),
(95, 58, 'VIREMENT EN VOTRE FAVEUR\nVEOLIA EAU - COMPAGNIE GENERALE 084830010193010422510         1 \nI0000228257006                     ', 0, 12.58, '2022-08-05'),
(96, 10, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16275170V16 0416158DLECUYER     072022ME \n16275170V16                        ', 0, 10, '2022-08-05'),
(97, 3, 'VIREMENT EN VOTRE FAVEUR\nVIR INST de M KASMI MEHDI VIREMENT DE M KASMI MEHDI \nVIREMENT VERS SCI ZAYS             ', 0, 193, '2022-08-03'),
(98, 5, 'VIREMENT EN VOTRE FAVEUR\nMle JOACHIM ROMANE VK22151SZE272 VIR DE MLE JOACHIM ROMANE \nVK22151SZE272F01                   ', 0, 370, '2022-08-03'),
(99, 50, 'REGLEMENT               \nASSU. CNP PRET HABITAT 08/22 ', 31.96, 0, '2022-08-02'),
(100, 50, 'REGLEMENT               \nASSU. CAAE PRET HABITAT 08/22 ', 27.18, 0, '2022-08-02'),
(101, 1, 'VIREMENT EN VOTRE FAVEUR\nCaution + 1er loyer CARPENTIER Z \nVirement depuis Ma Banque          ', 0, 610, '2022-07-29'),
(102, 44, 'CHEQUE EMIS             \n6013607 ', 280, 0, '2022-07-29'),
(103, 53, 'PRELEVEMENT             \nDIRECTION GENERALE DES FINANCES 140664663470050246 111                      MENM314019483831066  IMPOT TF \nNNFR46ZZZ005002M314019483831       \nFR46ZZZ005002                      \n1E087000014066M314019483831        ', 294, 0, '2022-07-15'),
(104, 56, 'PRELEVEMENT CARTE       \nDEPENSES CARTE AU 30/06/2022 ', 59.8, 0, '2022-07-12'),
(105, 55, 'REMBOURSEMENT DE PRET   \n10001119643 ECHEANCE    10/07/22 ', 598.13, 0, '2022-07-10'),
(106, 55, 'REMBOURSEMENT DE PRET   \n10000255789 ECHEANCE    10/07/22 ', 579.49, 0, '2022-07-10'),
(107, 55, 'REMBOURSEMENT DE PRET   \n10000255790 ECHEANCE    10/07/22 ', 59.33, 0, '2022-07-10'),
(108, 6, 'VIREMENT EN VOTRE FAVEUR\nML LESSU FALIO ELSA VIREMENT VER VIREMENT DE ML LESSU FALIO ELSA \nVIREMENT VERS SCI ZAYS             ', 0, 400, '2022-07-06'),
(109, 2, 'VIREMENT EN VOTRE FAVEUR\nMME LECUYER CHRISTINE LOYER LOYER ', 0, 380, '2022-07-06'),
(110, 8, 'VIREMENT EN VOTRE FAVEUR\nM JOUVIN TEO VU21861JK6G9L801 VIR DE M JOUVIN TEO \nVU21861JK6G9L801                   ', 0, 210, '2022-07-05'),
(111, 58, 'PRELEVEMENT             \nVEOLIA EAU - COMPAGNIE GENERALE RUM:XX131306450SEPA                    /ICS:FR68ZZZ437614                      -084830010193010422005         1 \nXX131306450SEPA                    \nFR68ZZZ437614                      \n831073a8a3d54', 34.07, 0, '2022-07-05'),
(112, 7, 'VIREMENT EN VOTRE FAVEUR\nMLLE LAURENT CHARLOTTE VIREMENT VIREMENT DE MLLE LAURENT CHARLOTTE \nVIREMENT VERS SEBAS                ', 0, 118, '2022-07-05'),
(113, 5, 'VIREMENT EN VOTRE FAVEUR\nMle JOACHIM ROMANE VK21852JY275N VIR DE MLE JOACHIM ROMANE \nVK21852JY275NW01                   ', 0, 370, '2022-07-05'),
(114, 15, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16146260V16 0774612JLAURENT     062022ME \n16146260V16                        ', 0, 272, '2022-07-05'),
(115, 16, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16145730V16 0749382TJOUVIN      062022ME \n16145730V16                        ', 0, 199, '2022-07-05'),
(116, 11, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16145852V16 0752816HKASMI       062022ME \n16145852V16                        ', 0, 187, '2022-07-05'),
(117, 4, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16145259V16 0728325LVERNUSSE    062022ME \n16145259V16                        ', 0, 175, '2022-07-05'),
(118, 10, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16141126V16 0416158DLECUYER     062022ME \n16141126V16                        ', 0, 10, '2022-07-05'),
(119, 50, 'REGLEMENT               \nASSU. CNP PRET HABITAT 07/22 ', 31.96, 0, '2022-07-04'),
(120, 50, 'REGLEMENT               \nASSU. CAAE PRET HABITAT 07/22 ', 27.18, 0, '2022-07-04'),
(121, 3, 'VIREMENT EN VOTRE FAVEUR\nM KASMI MEHDI VIREMENT VERS SCI VIREMENT DE M KASMI MEHDI \nVIREMENT VERS SCI ZAYS             ', 0, 193, '2022-07-04'),
(122, 4, 'VIREMENT EN VOTRE FAVEUR\nMme VERNUSSE YUNA Loyer ', 0, 40, '2022-07-04'),
(123, 59, 'PRELEVEMENT             \nELECTRICITE DE FRANCE Numero de client : 6012189567 - Numero de compte : xxx 004021382958 \nMM9760121895670001                 \nFR47EDF001007                      \nZ021684113852 11403 1   SIMM    114', 41.71, 0, '2022-06-21'),
(124, 53, 'PRELEVEMENT             \nDIRECTION GENERALE DES FINANCES 140664663470050246 111                      MENM314019483831066  IMPOT TF \nNNFR46ZZZ005002M314019483831       \nFR46ZZZ005002                      \n1E087000014066M314019483831        ', 294, 0, '2022-06-15'),
(125, 55, 'REMBOURSEMENT DE PRET   \n10001119643 ECHEANCE    10/06/22 ', 598.13, 0, '2022-06-10'),
(126, 55, 'REMBOURSEMENT DE PRET   \n10000255789 ECHEANCE    10/06/22 ', 579.49, 0, '2022-06-10'),
(127, 55, 'REMBOURSEMENT DE PRET   \n10000255790 ECHEANCE    10/06/22 ', 59.33, 0, '2022-06-10'),
(128, 58, 'PRELEVEMENT             \nVEOLIA EAU - COMPAGNIE GENERALE RUM:XX131306450SEPA                    /ICS:FR68ZZZ437614                      -084830010193010422004         1 \nXX131306450SEPA                    \nFR68ZZZ437614                      \nf4f2712191444', 34.03, 0, '2022-06-07'),
(129, 55, 'VIREMENT EN VOTRE FAVEUR\nMR BUIRON YANN COMMANDE YANN ', 0, 1664, '2022-06-07'),
(130, 6, 'VIREMENT EN VOTRE FAVEUR\nML LESSU FALIO ELSA VIREMENT VER VIREMENT DE ML LESSU FALIO ELSA \nVIREMENT VERS SCI ZAYS             ', 0, 400, '2022-06-07'),
(131, 8, 'VIREMENT EN VOTRE FAVEUR\nM JOUVIN TEO VU215632M9WAW001 VIR DE M JOUVIN TEO \nVU215632M9WAW001                   ', 0, 183, '2022-06-07'),
(132, 2, 'VIREMENT EN VOTRE FAVEUR\nMME LECUYER CHRISTINE LOYER LOYER ', 0, 380, '2022-06-07'),
(133, 7, 'VIREMENT EN VOTRE FAVEUR\nMLLE LAURENT CHARLOTTE VIREMENT VIREMENT DE MLLE LAURENT CHARLOTTE \nVIREMENT VERS SEBAS                ', 0, 390, '2022-06-03'),
(134, 16, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16122840V16 XXXREFERENCE  016122840      ME    0749382TJOUVIN      052022ME \n16122840V16                        ', 0, 227, '2022-06-03'),
(135, 4, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16122343V16 XXXREFERENCE  016122343      ME    0728325LVERNUSSE    052022ME \n16122343V16                        ', 0, 175, '2022-06-03'),
(136, 11, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16122963V16 XXXREFERENCE  016122963      ME    0752816HKASMI       052022ME \n16122963V16                        ', 0, 134, '2022-06-03'),
(137, 10, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 16118187V16 XXXREFERENCE  016118187      ME    0416158DLECUYER     052022ME \n16118187V16                        ', 0, 10, '2022-06-03'),
(138, 50, 'REGLEMENT               \nASSU. CNP PRET HABITAT 06/22 ', 31.96, 0, '2022-06-02'),
(139, 50, 'REGLEMENT               \nASSU. CAAE PRET HABITAT 06/22 ', 27.18, 0, '2022-06-02'),
(140, 5, 'VIREMENT EN VOTRE FAVEUR\nMle JOACHIM ROMANE VK21531QTJ5RY VIR DE MLE JOACHIM ROMANE \nVK21531QTJ5RYJ01                   ', 0, 370, '2022-06-02'),
(141, 3, 'VIREMENT EN VOTRE FAVEUR\nVIR INST de M KASMI MEHDI VIREMENT DE M KASMI MEHDI \nVIREMENT VERS SCI ZAYS             ', 0, 246, '2022-06-02'),
(142, 55, 'EFFETS DOMICILIES       \nDOMICILIES ', 1663.98, 0, '2022-05-31'),
(143, 4, 'VIREMENT EN VOTRE FAVEUR\nMme VERNUSSE YUNA Loyer ', 0, 135, '2022-05-31'),
(144, 72, 'CHEQUE EMIS             \n1849366/0000000/000000000 ', 345, 0, '2022-05-25'),
(145, 53, 'PRELEVEMENT             \nDIRECTION GENERALE DES FINANCES 140664663470050246 111                      MENM314019483831066  IMPOT TF \nNNFR46ZZZ005002M314019483831       \nFR46ZZZ005002                      \n1E087000014066M314019483831        ', 294, 0, '2022-05-16'),
(146, 55, 'REMBOURSEMENT DE PRET   \n10001119643 ECHEANCE    10/05/22 ', 598.13, 0, '2022-05-10'),
(147, 55, 'REMBOURSEMENT DE PRET   \n10000255789 ECHEANCE    10/05/22 ', 579.49, 0, '2022-05-10'),
(148, 55, 'REMBOURSEMENT DE PRET   \n10000255790 ECHEANCE    10/05/22 ', 59.33, 0, '2022-05-10'),
(149, 8, 'VIREMENT EN VOTRE FAVEUR\nM JOUVIN TEO VU21253Q27ZDUS01 VIR DE M JOUVIN TEO \nVU21253Q27ZDUS01                   ', 0, 44, '2022-05-06'),
(150, 7, 'VIREMENT EN VOTRE FAVEUR\nMLLE LAURENT CHARLOTTE VIREMENT VIREMENT DE MLLE LAURENT CHARLOTTE \nVIREMENT VERS SEBAS                ', 0, 750, '2022-05-06'),
(151, 6, 'VIREMENT EN VOTRE FAVEUR\nML LESSU FALIO ELSA VIREMENT VER VIREMENT DE ML LESSU FALIO ELSA \nVIREMENT VERS SCI ZAYS             ', 0, 400, '2022-05-06'),
(152, 2, 'VIREMENT EN VOTRE FAVEUR\nMME LECUYER CHRISTINE LOYER LOYER ', 0, 380, '2022-05-06'),
(153, 58, 'PRELEVEMENT             \nVEOLIA EAU - COMPAGNIE GENERALE RUM:XX131306450SEPA                    /ICS:FR68ZZZ437614                      -084830010193010422003         1 \nXX131306450SEPA                    \nFR68ZZZ437614                      \nd623127831904', 34.03, 0, '2022-05-05'),
(154, 16, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015875586V16 XXXREFERENCE  015875586      ME    0749382TJOUVIN      042022ME \n015875586V16                       ', 0, 227, '2022-05-05'),
(155, 4, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015875086V16 XXXREFERENCE  015875086      ME    0728325LVERNUSSE    042022ME \n015875086V16                       ', 0, 175, '2022-05-05'),
(156, 11, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015875717V16 XXXREFERENCE  015875717      ME    0752816HKASMI       042022ME \n015875717V16                       ', 0, 134, '2022-05-05'),
(157, 10, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015870899V16 XXXREFERENCE  015870899      ME    0416158DLECUYER     042022ME \n015870899V16                       ', 0, 10, '2022-05-05'),
(158, 71, 'CHEQUE EMIS             \n1849365 ', 320, 0, '2022-05-04'),
(159, 5, 'VIREMENT EN VOTRE FAVEUR\nMle JOACHIM ROMANE VK21232W3Q7US VIR DE MLE JOACHIM ROMANE \nVK21232W3Q7USC01                   ', 0, 710, '2022-05-04'),
(160, 50, 'REGLEMENT               \nASSU. CNP PRET HABITAT 05/22 ', 31.96, 0, '2022-05-03'),
(161, 50, 'REGLEMENT               \nASSU. CAAE PRET HABITAT 05/22 ', 27.18, 0, '2022-05-03'),
(162, 3, 'VIREMENT EN VOTRE FAVEUR\nVIR INST de M KASMI MEHDI VIREMENT DE M KASMI MEHDI \nVIREMENT VERS SCI ZAYS             ', 0, 224, '2022-05-03'),
(163, 4, 'VIREMENT EN VOTRE FAVEUR\nMme VERNUSSE YUNA Loyer ', 0, 135, '2022-05-03'),
(164, 2, 'VIREMENT EN VOTRE FAVEUR\nMME LECUYER CHRISTINE rappel loy rappel loyer ', 0, 51, '2022-04-30'),
(165, 53, 'PRELEVEMENT             \nDIRECTION GENERALE DES FINANCES 140664663470050246 111                      MENM314019483831066  IMPOT TF \nNNFR46ZZZ005002M314019483831       \nFR46ZZZ005002                      \n1E087000014066M314019483831        ', 294, 0, '2022-04-19'),
(166, 59, 'PRELEVEMENT             \nELECTRICITE DE FRANCE Numero de client : 6012189567 - Numero de compte : xxx 004021382958 \nMM9760121895670001                 \nFR47EDF001007                      \nZ128250175387 11403 1   SIMM    114', 41.37, 0, '2022-04-19'),
(167, 2, 'RETRAIT AU DISTRIBUTEUR \nCAEN             12/04 11H58 ', 70, 0, '2022-04-13'),
(168, 70, 'VIREMENT EN VOTRE FAVEUR\nMME MALIKA DASROT VIREMENT VERS DASROT MALIKA LOYER AVRIL \nVIREMENT VERS SCI ZAYS             ', 0, 350, '2022-04-11'),
(169, 70, 'VIREMENT EN VOTRE FAVEUR\nMME MALIKA DASROT VIREMENT VERS DASROT MALIKA COMPLEMENT LOYER MARS \nVIREMENT VERS SCI ZAYS             ', 0, 240, '2022-04-11'),
(170, 55, 'REMBOURSEMENT DE PRET   \n10001119643 ECHEANCE    10/04/22 ', 598.13, 0, '2022-04-10'),
(171, 55, 'REMBOURSEMENT DE PRET   \n10000255789 ECHEANCE    10/04/22 ', 579.49, 0, '2022-04-10'),
(172, 55, 'REMBOURSEMENT DE PRET   \n10000255790 ECHEANCE    10/04/22 ', 59.33, 0, '2022-04-10'),
(173, 6, 'VIREMENT EN VOTRE FAVEUR\nML LESSU FALIO ELSA VIREMENT VER VIREMENT DE ML LESSU FALIO ELSA \nVIREMENT VERS SCI ZAYS             ', 0, 400, '2022-04-06'),
(174, 2, 'VIREMENT EN VOTRE FAVEUR\nMME LECUYER CHRISTINE LOYER LOYER ', 0, 329, '2022-04-06'),
(175, 52, 'PRELEVEMENT             \nMACIF Loir Bretagne Production-M -PRELEV 1305042022  01554969126 \nMA3630638380                       \nFR66ZZZ110663                      \nI0000412667517015549691042         ', 161.14, 0, '2022-04-05'),
(176, 58, 'PRELEVEMENT             \nVEOLIA EAU - COMPAGNIE GENERALE RUM:XX131306450SEPA                    /ICS:FR68ZZZ437614                      -084830010193010422002         1 \nXX131306450SEPA                    \nFR68ZZZ437614                      \nb1c48d1e86d04', 34.03, 0, '2022-04-05'),
(177, 16, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015741143V16 XXXREFERENCE  015741143      ME    0749382TJOUVIN      032022ME \n015741143V16                       ', 0, 227, '2022-04-05'),
(178, 4, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015740631V16 XXXREFERENCE  015740631      ME    0728325LVERNUSSE    032022ME \n015740631V16                       ', 0, 175, '2022-04-05'),
(179, 4, 'VIREMENT EN VOTRE FAVEUR\nMme VERNUSSE YUNA Loyer ', 0, 135, '2022-04-05'),
(180, 11, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015741274V16 XXXREFERENCE  015741274      ME    0752816HKASMI       032022ME \n015741274V16                       ', 0, 134, '2022-04-05'),
(181, 10, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015736433V16 XXXREFERENCE  015736433      ME    0416158DLECUYER     032022ME \n015736433V16                       ', 0, 90, '2022-04-05'),
(182, 69, 'VIREMENT EN VOTRE FAVEUR\nBEULET ALLAN ', 0, 375, '2022-04-05'),
(183, 50, 'REGLEMENT               \nASSU. CNP PRET HABITAT 04/22 ', 31.96, 0, '2022-04-04'),
(184, 50, 'REGLEMENT               \nASSU. CAAE PRET HABITAT 04/22 ', 27.18, 0, '2022-04-04'),
(185, 3, 'VIREMENT EN VOTRE FAVEUR\nVIR INST de M KASMI MEHDI VIREMENT DE M KASMI MEHDI \nVIREMENT VERS SCI ZAYS             ', 0, 246, '2022-04-04'),
(186, 53, 'PRELEVEMENT             \nDIRECTION GENERALE DES FINANCES 140664663470050246 111                      MENM314019483831066  IMPOT TF \nNNFR46ZZZ005002M314019483831       \nFR46ZZZ005002                      \n1E087000014066M314019483831        ', 294, 0, '2022-03-15'),
(187, 56, 'PRELEVEMENT CARTE       \nDEPENSES CARTE AU 28/02/2022 ', 17.9, 0, '2022-03-14'),
(188, 55, 'REMBOURSEMENT DE PRET   \n10001119643 ECHEANCE    10/03/22 ', 598.13, 0, '2022-03-10'),
(189, 55, 'REMBOURSEMENT DE PRET   \n10000255789 ECHEANCE    10/03/22 ', 579.49, 0, '2022-03-10'),
(190, 55, 'REMBOURSEMENT DE PRET   \n10000255790 ECHEANCE    10/03/22 ', 59.33, 0, '2022-03-10'),
(191, 70, 'VIREMENT EN VOTRE FAVEUR\nVIR INST de MME MALIKA DASROT DASROT MALIKA LOYER MARS \nVIREMENT VERS SCI ZAYS             ', 0, 110, '2022-03-07'),
(192, 58, 'PRELEVEMENT             \nVEOLIA EAU - COMPAGNIE GENERALE RUM:XX131306450SEPA                    /ICS:FR68ZZZ437614                      -084830010193010422001         1 \nXX131306450SEPA                    \nFR68ZZZ437614                      \n02c8fbd499584', 34.03, 0, '2022-03-07'),
(193, 6, 'VIREMENT EN VOTRE FAVEUR\nML LESSU FALIO ELSA VIREMENT VER VIREMENT DE ML LESSU FALIO ELSA \nVIREMENT VERS SCI ZAYS             ', 0, 400, '2022-03-07'),
(194, 2, 'VIREMENT EN VOTRE FAVEUR\nMME LECUYER CHRISTINE LOYER LOYER ', 0, 329, '2022-03-07'),
(195, 69, 'VIREMENT EN VOTRE FAVEUR\nBEULET ALLAN ', 0, 375, '2022-03-07'),
(196, 3, 'VIREMENT EN VOTRE FAVEUR\nM KASMI MEHDI VIREMENT VERS SCI VIREMENT DE M KASMI MEHDI \nVIREMENT VERS SCI ZAYS             ', 0, 268, '2022-03-04'),
(197, 70, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015604097V16 XXXREFERENCE  015604097      ME    0619400YDASROT      022022ME \n015604097V16                       ', 0, 240, '2022-03-04'),
(198, 16, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015606386V16 XXXREFERENCE  015606386      ME    0749382TJOUVIN      022022ME \n015606386V16                       ', 0, 230, '2022-03-04'),
(199, 4, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015605875V16 XXXREFERENCE  015605875      ME    0728325LVERNUSSE    022022ME \n015605875V16                       ', 0, 175, '2022-03-04'),
(200, 11, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015606519V16 XXXREFERENCE  015606519      ME    0752816HKASMI       022022ME \n015606519V16                       ', 0, 112, '2022-03-04'),
(201, 10, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015601661V16 XXXREFERENCE  015601661      ME    0416158DLECUYER     022022ME \n015601661V16                       ', 0, 90, '2022-03-04'),
(202, 4, 'VIREMENT EN VOTRE FAVEUR\nMme VERNUSSE YUNA loyer ', 0, 135, '2022-03-03'),
(203, 50, 'REGLEMENT               \nASSU. CNP PRET HABITAT 03/22 ', 31.96, 0, '2022-03-02'),
(204, 50, 'REGLEMENT               \nASSU. CAAE PRET HABITAT 03/22 ', 27.18, 0, '2022-03-02'),
(205, 59, 'PRELEVEMENT             \nELECTRICITE DE FRANCE Numero de client : 6012189567 - Numero de compte : xxx 004021382958 \nMM9760121895670001                 \nFR47EDF001007                      \nZ029816422255 11403 1   SIMM    114', 39.98, 0, '2022-02-21'),
(206, 53, 'PRELEVEMENT             \nDIRECTION GENERALE DES FINANCES 140664663470050246 111                      MENM314019483831066  IMPOT TF \nNNFR46ZZZ005002M314019483831       \nFR46ZZZ005002                      \n1E087000014066M314019483831        ', 294, 0, '2022-02-15'),
(207, 55, 'REMBOURSEMENT DE PRET   \n10001119643 ECHEANCE    10/02/22 ', 598.13, 0, '2022-02-10'),
(208, 55, 'REMBOURSEMENT DE PRET   \n10000255789 ECHEANCE    10/02/22 ', 579.49, 0, '2022-02-10'),
(209, 55, 'REMBOURSEMENT DE PRET   \n10000255790 ECHEANCE    10/02/22 ', 59.33, 0, '2022-02-10'),
(210, 6, 'VIREMENT EN VOTRE FAVEUR\nML LESSU FALIO ELSA VIREMENT VER VIREMENT DE ML LESSU FALIO ELSA \nVIREMENT VERS SCI ZAYS             ', 0, 400, '2022-02-07'),
(211, 3, 'VIREMENT EN VOTRE FAVEUR\nM KASMI MEHDI VIREMENT VERS SCI VIREMENT DE M KASMI MEHDI \nVIREMENT VERS SCI ZAYS             ', 0, 268, '2022-02-07'),
(212, 70, 'VIREMENT EN VOTRE FAVEUR\nMME MALIKA DASROT VIREMENT VERS DASROT MALIKA LOYER FVRIER \nVIREMENT VERS SCI ZAYS             ', 0, 110, '2022-02-07'),
(213, 2, 'VIREMENT EN VOTRE FAVEUR\nMME LECUYER CHRISTINE LOYER LOYER ', 0, 329, '2022-02-07'),
(214, 69, 'VIREMENT EN VOTRE FAVEUR\nBEULET ALLAN ', 0, 375, '2022-02-07'),
(215, 16, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015469376V16 XXXREFERENCE  015469376      ME    0749382TJOUVIN      012022ME \n015469376V16                       ', 0, 285, '2022-02-04'),
(216, 70, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015467110V16 XXXREFERENCE  015467110      ME    0619400YDASROT      012022ME \n015467110V16                       ', 0, 240, '2022-02-04'),
(217, 4, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015468848V16 XXXREFERENCE  015468848      ME    0728325LVERNUSSE    012022ME \n015468848V16                       ', 0, 175, '2022-02-04'),
(218, 11, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015469513V16 XXXREFERENCE  015469513      ME    0752816HKASMI       012022ME \n015469513V16                       ', 0, 112, '2022-02-04'),
(219, 10, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015464730V16 XXXREFERENCE  015464730      ME    0416158DLECUYER     012022ME \n015464730V16                       ', 0, 90, '2022-02-04'),
(220, 50, 'REGLEMENT               \nASSU. CNP PRET HABITAT 02/22 ', 31.96, 0, '2022-02-02'),
(221, 50, 'REGLEMENT               \nASSU. CAAE PRET HABITAT 02/22 ', 27.18, 0, '2022-02-02'),
(222, 4, 'VIREMENT EN VOTRE FAVEUR\nMme VERNUSSE YUNA Loyer ', 0, 135, '2022-02-02'),
(223, 58, 'VIREMENT EN VOTRE FAVEUR\nVEOLIA EAU - COMPAGNIE GENERALE 084830010193010422400         1 \nI0000208509317                     ', 0, 21.58, '2022-02-02'),
(224, 70, 'VIREMENT EN VOTRE FAVEUR\nMME MALIKA DASROT VIREMENT VERS DASROT MALIKA LOYER DECEMBRE COMPLEMENT \nVIREMENT VERS SCI ZAYS             ', 0, 23, '2022-01-28'),
(225, 70, 'VIREMENT EN VOTRE FAVEUR\nMME MALIKA DASROT VIREMENT VERS DASROT MALIKA LOYER JANVIER COMPLEMENT \nVIREMENT VERS SCI ZAYS             ', 0, 10, '2022-01-28'),
(226, 53, 'PRELEVEMENT             \nDIRECTION GENERALE DES FINANCES 140664663470050246 111                      MENM314019483831066  IMPOT TF \nNNFR46ZZZ005002M314019483831       \nFR46ZZZ005002                      \n1E087000014066M314019483831        ', 294, 0, '2022-01-17'),
(227, 55, 'REMBOURSEMENT DE PRET   \n10001119643 ECHEANCE    10/01/22 ', 598.13, 0, '2022-01-10'),
(228, 55, 'REMBOURSEMENT DE PRET   \n10000255789 ECHEANCE    10/01/22 ', 579.49, 0, '2022-01-10'),
(229, 55, 'REMBOURSEMENT DE PRET   \n10000255790 ECHEANCE    10/01/22 ', 59.33, 0, '2022-01-10'),
(230, 6, 'VIREMENT EN VOTRE FAVEUR\nML LESSU FALIO ELSA VIREMENT VER VIREMENT DE ML LESSU FALIO ELSA \nVIREMENT VERS SCI ZAYS             ', 0, 400, '2022-01-06'),
(231, 3, 'VIREMENT EN VOTRE FAVEUR\nM KASMI MEHDI VIREMENT VERS SCI VIREMENT DE M KASMI MEHDI \nVIREMENT VERS SCI ZAYS             ', 0, 186, '2022-01-06'),
(232, 4, 'VIREMENT EN VOTRE FAVEUR\nMme VERNUSSE YUNA loyer ', 0, 135, '2022-01-06'),
(233, 2, 'VIREMENT EN VOTRE FAVEUR\nMME LECUYER CHRISTINE LOYER LOYER ', 0, 329, '2022-01-06'),
(234, 58, 'PRELEVEMENT             \nVEOLIA EAU - COMPAGNIE GENERALE RUM:XX131306450SEPA                    /ICS:FR68ZZZ437614                      -084830010193010422005         1 \nXX131306450SEPA                    \nFR68ZZZ437614                      \n741149b2410d4', 38.37, 0, '2022-01-05'),
(235, 16, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015421550V16 XXXREFERENCE  015421550      ME    0749382TJOUVIN      122021ME \n015421550V16                       ', 0, 281, '2022-01-05'),
(236, 70, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015418958V16 XXXREFERENCE  015418958      ME    0619400YDASROT      122021ME \n015418958V16                       ', 0, 250, '2022-01-05'),
(237, 4, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015420946V16 XXXREFERENCE  015420946      ME    0728325LVERNUSSE    122021ME \n015420946V16                       ', 0, 175, '2022-01-05'),
(238, 10, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015416340V16 XXXREFERENCE  015416340      ME    0416158DLECUYER     122021ME \n015416340V16                       ', 0, 56, '2022-01-05'),
(239, 11, 'VIREMENT EN VOTRE FAVEUR\nCAF DU CALVADOS DIE 015421691V16 XXXREFERENCE  015421691      ME    0752816HKASMI       122021ME \n015421691V16                       ', 0, 47, '2022-01-05'),
(240, 69, 'VIREMENT EN VOTRE FAVEUR\nBEULET ALLAN ', 0, 375, '2022-01-05'),
(241, 50, 'REGLEMENT               \nASSU. CNP PRET HABITAT 01/22 ', 31.96, 0, '2022-01-04'),
(242, 50, 'REGLEMENT               \nASSU. CAAE PRET HABITAT 01/22 ', 27.18, 0, '2022-01-04'),
(243, 70, 'VIREMENT EN VOTRE FAVEUR\nMME MALIKA DASROT VIREMENT VERS DASROT MALIKA LOYER JANVIER \nVIREMENT VERS SCI ZAYS             ', 0, 100, '2022-01-04');

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id` int NOT NULL,
  `bail_id` int DEFAULT NULL,
  `mois_annee_id` int DEFAULT NULL,
  `date_p` date DEFAULT NULL,
  `montant` double DEFAULT NULL,
  `source` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `piece_jointe`
--

CREATE TABLE `piece_jointe` (
  `id` int NOT NULL,
  `type_piece_jointe_id` int DEFAULT NULL,
  `locataire_id` int DEFAULT NULL,
  `libelle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_fichier` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

CREATE TABLE `societe` (
  `id` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_rue` int DEFAULT NULL,
  `rue` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tel` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copos` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `societe`
--

INSERT INTO `societe` (`id`, `nom`, `num_rue`, `rue`, `ville`, `num_tel`, `mail`, `copos`) VALUES
(1, 'ZAYS', 97, 'Rue de Falaise', 'Caen', '0600000000', 'zays@mail.com', 14000);

-- --------------------------------------------------------

--
-- Structure de la table `sous_categorie`
--

CREATE TABLE `sous_categorie` (
  `id` int NOT NULL,
  `categorie_id` int DEFAULT NULL,
  `libelle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sous_categorie`
--

INSERT INTO `sous_categorie` (`id`, `categorie_id`, `libelle`) VALUES
(1, 1, 'Appartement 1-Carpentier'),
(2, 1, 'Appartement 2-Lecuyer'),
(3, 1, 'Appartement 3-Khasmi'),
(4, 1, 'Appartement 4'),
(5, 1, 'Appartement 5-Joachim'),
(6, 1, 'Appartement 6-Lessu Falio'),
(7, 1, 'Appartement 7-Laurent'),
(8, 1, 'Appartement 8-Jouvin'),
(9, 1, 'Appartement 1-Carpentier-caf'),
(10, 1, 'Appartement 2-Lecuyer-caf'),
(11, 1, 'Appartement 3-Khasmi-caf'),
(12, 1, 'Appartement 4--caf'),
(13, 1, 'Appartement 5-Joachim-caf'),
(14, 1, 'Appartement 6-Lessu Fialo-caf'),
(15, 1, 'Appartement 7-Laurent-caf'),
(16, 1, 'Appartement 8-Jouvin-caf'),
(17, 2, 'Versement appartement 1-Carpentier'),
(18, 2, 'Versement appartement 2-Lecuyer'),
(19, 2, 'Versement appartement 3-Khasmi'),
(20, 2, 'Versement appartement 4'),
(21, 2, 'Versement appartement 5-Joachim'),
(22, 2, 'Versement appartement 6-Lessu Fialo'),
(23, 2, 'Versement appartement 7-Laurent'),
(24, 2, 'Versement appartement 8-Jouvin'),
(41, 2, 'Restitution appartement 1-Carpentier'),
(42, 2, 'Restitution appartement 2-Lecuyer'),
(43, 2, 'Restitution appartement 3-Khasmi'),
(44, 2, 'Restitution appartement 4'),
(45, 2, 'Restitution appartement 5-Joachim'),
(46, 2, 'Restitution appartement 6-Lessu Fialo'),
(47, 2, 'Restitution appartement 7-Laurent'),
(48, 2, 'Restitution appartement 8-Jouvin'),
(49, 3, 'Remboursement emprunt'),
(50, 3, 'Assurance emprunt '),
(51, 4, 'Assurance emprunteur'),
(52, 4, 'Habitation'),
(53, 5, 'Taxe foncière'),
(54, 6, 'Frais bancaires'),
(55, 6, 'Autres'),
(56, 7, 'Achat matériel, produit'),
(57, 7, 'Réparation'),
(58, 8, 'Eau'),
(59, 8, 'Electricité'),
(60, 9, 'Appartement 1'),
(61, 9, 'Appartement 2'),
(62, 9, 'Appartement 3'),
(63, 9, 'Appartement 4'),
(64, 9, 'Appartement 5'),
(65, 9, 'Appartement 6'),
(66, 9, 'Appartement 7'),
(67, 9, 'Appartement 8'),
(68, 9, 'Parties communes'),
(69, 1, 'Ancien locataire-Beullet'),
(70, 1, 'Ancien locataire-Dasrot'),
(71, 2, 'Restitution caution-Dasrot'),
(72, 2, 'Restitution caution-Beullet');

-- --------------------------------------------------------

--
-- Structure de la table `type_piece_jointe`
--

CREATE TABLE `type_piece_jointe` (
  `id` int NOT NULL,
  `libelle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_piece_jointe`
--

INSERT INTO `type_piece_jointe` (`id`, `libelle`) VALUES
(1, 'Carte nationale d\'identité'),
(2, 'Passeport'),
(3, 'Bulletin de paye'),
(4, 'Garantie visale'),
(5, 'Facture'),
(6, 'Quittance'),
(7, 'Certificat de scolarité');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appartement`
--
ALTER TABLE `appartement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_71A6BD8D63768E3F` (`immeuble_id`);

--
-- Index pour la table `associe`
--
ALTER TABLE `associe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_235AAA4AFCF77503` (`societe_id`);

--
-- Index pour la table `bail`
--
ALTER TABLE `bail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_945BC1EE1729BBA` (`appartement_id`),
  ADD KEY `IDX_945BC1EC41A218C` (`associe_id`);

--
-- Index pour la table `bail_locataire`
--
ALTER TABLE `bail_locataire`
  ADD PRIMARY KEY (`bail_id`,`locataire_id`),
  ADD KEY `IDX_EA325C7E3E3F1FE8` (`bail_id`),
  ADD KEY `IDX_EA325C7ED8A38199` (`locataire_id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `immeuble`
--
ALTER TABLE `immeuble`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_467D53F9FCF77503` (`societe_id`);

--
-- Index pour la table `locataire`
--
ALTER TABLE `locataire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `mois_annee`
--
ALTER TABLE `mois_annee`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mouvement`
--
ALTER TABLE `mouvement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5B51FC3E365BF48` (`sous_categorie_id`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B1DC7A1E3E3F1FE8` (`bail_id`),
  ADD KEY `IDX_B1DC7A1EB67D0DC3` (`mois_annee_id`);

--
-- Index pour la table `piece_jointe`
--
ALTER TABLE `piece_jointe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AB5111D454408E71` (`type_piece_jointe_id`),
  ADD KEY `IDX_AB5111D4D8A38199` (`locataire_id`);

--
-- Index pour la table `societe`
--
ALTER TABLE `societe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_52743D7BBCF5E72D` (`categorie_id`);

--
-- Index pour la table `type_piece_jointe`
--
ALTER TABLE `type_piece_jointe`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `appartement`
--
ALTER TABLE `appartement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT pour la table `associe`
--
ALTER TABLE `associe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `bail`
--
ALTER TABLE `bail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `immeuble`
--
ALTER TABLE `immeuble`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `locataire`
--
ALTER TABLE `locataire`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mois_annee`
--
ALTER TABLE `mois_annee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `mouvement`
--
ALTER TABLE `mouvement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `piece_jointe`
--
ALTER TABLE `piece_jointe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `societe`
--
ALTER TABLE `societe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT pour la table `type_piece_jointe`
--
ALTER TABLE `type_piece_jointe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartement`
--
ALTER TABLE `appartement`
  ADD CONSTRAINT `FK_71A6BD8D63768E3F` FOREIGN KEY (`immeuble_id`) REFERENCES `immeuble` (`id`);

--
-- Contraintes pour la table `associe`
--
ALTER TABLE `associe`
  ADD CONSTRAINT `FK_235AAA4AFCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`);

--
-- Contraintes pour la table `bail`
--
ALTER TABLE `bail`
  ADD CONSTRAINT `FK_945BC1EC41A218C` FOREIGN KEY (`associe_id`) REFERENCES `associe` (`id`),
  ADD CONSTRAINT `FK_945BC1EE1729BBA` FOREIGN KEY (`appartement_id`) REFERENCES `appartement` (`id`);

--
-- Contraintes pour la table `bail_locataire`
--
ALTER TABLE `bail_locataire`
  ADD CONSTRAINT `FK_EA325C7E3E3F1FE8` FOREIGN KEY (`bail_id`) REFERENCES `bail` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_EA325C7ED8A38199` FOREIGN KEY (`locataire_id`) REFERENCES `locataire` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `immeuble`
--
ALTER TABLE `immeuble`
  ADD CONSTRAINT `FK_467D53F9FCF77503` FOREIGN KEY (`societe_id`) REFERENCES `societe` (`id`);

--
-- Contraintes pour la table `mouvement`
--
ALTER TABLE `mouvement`
  ADD CONSTRAINT `FK_5B51FC3E365BF48` FOREIGN KEY (`sous_categorie_id`) REFERENCES `sous_categorie` (`id`);

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `FK_B1DC7A1E3E3F1FE8` FOREIGN KEY (`bail_id`) REFERENCES `bail` (`id`),
  ADD CONSTRAINT `FK_B1DC7A1EB67D0DC3` FOREIGN KEY (`mois_annee_id`) REFERENCES `mois_annee` (`id`);

--
-- Contraintes pour la table `piece_jointe`
--
ALTER TABLE `piece_jointe`
  ADD CONSTRAINT `FK_AB5111D454408E71` FOREIGN KEY (`type_piece_jointe_id`) REFERENCES `type_piece_jointe` (`id`),
  ADD CONSTRAINT `FK_AB5111D4D8A38199` FOREIGN KEY (`locataire_id`) REFERENCES `locataire` (`id`);

--
-- Contraintes pour la table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  ADD CONSTRAINT `FK_52743D7BBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
