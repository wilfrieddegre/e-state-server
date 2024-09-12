-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 12 sep. 2024 à 05:14
-- Version du serveur : 5.7.24
-- Version de PHP : 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e-state`
--

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encryption` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `propertyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `url`, `encryption`, `type`, `size`, `propertyId`) VALUES
(1, 'https://pitchimmo.fr/medias/program/17325/images/dijon-coeur-dilot_thumb_840.jpg', NULL, NULL, NULL, 1),
(2, 'https://pitchimmo.fr/medias/program/17325/images/dijon-coeur-dilot_thumb_840.jpg', NULL, NULL, NULL, 1),
(3, 'https://pitchimmo.fr/medias/program/17325/images/dijon-rooftop_thumb_1920.jpg', NULL, NULL, NULL, 1),
(4, 'https://pitchimmo.fr/medias/program/17325/images/dijon-vue-depuis-le-canal_thumb_1920.jpg', NULL, NULL, NULL, 1),
(5, 'https://pitchimmo.fr/medias/program/17325/images/dijon-vue-depuis-le-canal_thumb_1920.jpg', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `progessstate`
--

CREATE TABLE `progessstate` (
  `id` int(11) NOT NULL,
  `currentStep` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `propertyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `progessstate`
--

INSERT INTO `progessstate` (`id`, `currentStep`, `rate`, `createdAt`, `updatedAt`, `propertyId`) VALUES
(1, 'done', 100, '2024-09-12 03:36:16.720', '2024-09-12 03:35:31.685', 1);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `price` double NOT NULL,
  `surface` double NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commune` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rooms` int(11) NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `price`, `surface`, `type`, `description`, `createdAt`, `updatedAt`, `city`, `commune`, `rooms`, `street`) VALUES
(1, 7000000, 120, 'villa', 'Cette nouvelle réalisation s’implante au bord du canal de Bourgogne, au sein de l’écoquartier de l’Arsenal, actuellement en plein développement, aussi accueillant que pratique. La proximité des commerces et d’équipements scolaires et culturels, dans un rayon de 15 minutes à pied, ainsi que la bonne desserte de transports en commun, avec la ligne 2 de tramway à 4 minutes à pied et des lignes de bus à 12 minutes, en font une adresse particulièrement agréable à vivre.  Arborant une architecture contemporaine, les quatre immeubles de la résidence s’organisent autour d’un mail de verdure soigné. Du studio au 5 pièces, les appartements offrent une belle variété de surfaces et ouvrent sur un balcon, une terrasse ou, pour certains, un rooftop.', '2024-09-11 23:34:31.410', '2024-09-12 01:22:12.245', 'Abidjan', 'Cocody', 5, 'Feh Kesse');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Media_propertyId_fkey` (`propertyId`);

--
-- Index pour la table `progessstate`
--
ALTER TABLE `progessstate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ProgessState_propertyId_key` (`propertyId`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `progessstate`
--
ALTER TABLE `progessstate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `Media_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `progessstate`
--
ALTER TABLE `progessstate`
  ADD CONSTRAINT `ProgessState_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
