-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 06 jan. 2023 à 09:29
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
(68, 9, 'Parties communes');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

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
