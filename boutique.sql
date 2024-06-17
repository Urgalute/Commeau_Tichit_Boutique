-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 16 juin 2024 à 21:49
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `boutique`
--

-- --------------------------------------------------------

--
-- Structure de la table `asso_color`
--

DROP TABLE IF EXISTS `asso_color`;
CREATE TABLE IF NOT EXISTS `asso_color` (
  `id_product` int NOT NULL,
  `id_color` int NOT NULL,
  PRIMARY KEY (`id_product`,`id_color`),
  KEY `id_color` (`id_color`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `asso_color`
--

INSERT INTO `asso_color` (`id_product`, `id_color`) VALUES
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(5, 7),
(6, 7),
(7, 7),
(8, 7),
(10, 4),
(10, 5),
(11, 4),
(12, 1),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(13, 6),
(13, 7),
(13, 8),
(14, 2),
(15, 4),
(15, 8),
(16, 2),
(16, 3),
(19, 4),
(19, 5),
(20, 5),
(21, 4),
(22, 3),
(23, 2),
(24, 1),
(25, 6),
(26, 1),
(26, 2),
(26, 3),
(26, 4),
(26, 5),
(26, 6),
(26, 7),
(26, 8),
(27, 5),
(28, 4),
(28, 5),
(28, 6),
(29, 4),
(29, 5),
(30, 1),
(30, 2),
(30, 3),
(30, 4),
(30, 5),
(30, 6),
(30, 7),
(30, 8),
(31, 1),
(31, 2),
(31, 3),
(31, 4),
(31, 5),
(31, 6),
(31, 7),
(31, 8),
(32, 1),
(32, 2),
(32, 3),
(32, 4),
(32, 5),
(32, 6),
(32, 7),
(32, 8),
(33, 1),
(33, 2),
(33, 3),
(33, 4),
(33, 5),
(33, 6),
(33, 7),
(33, 8),
(34, 1),
(34, 2),
(34, 3),
(34, 4),
(34, 5),
(34, 6),
(34, 7),
(34, 8),
(35, 1),
(35, 2),
(35, 3),
(35, 4),
(35, 5),
(35, 6),
(35, 7),
(35, 8),
(36, 1),
(36, 2),
(36, 3),
(36, 4),
(36, 5),
(36, 6),
(36, 7),
(36, 8),
(37, 1),
(37, 2),
(37, 3),
(37, 4),
(37, 5),
(37, 6),
(37, 7),
(37, 8),
(38, 1),
(38, 2),
(38, 3),
(38, 4),
(38, 5),
(38, 6),
(38, 7),
(38, 8),
(39, 2),
(40, 2),
(41, 2),
(42, 2);

-- --------------------------------------------------------

--
-- Structure de la table `asso_size`
--

DROP TABLE IF EXISTS `asso_size`;
CREATE TABLE IF NOT EXISTS `asso_size` (
  `id_product` int NOT NULL,
  `id_size` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_product`,`id_size`),
  KEY `id_size` (`id_size`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `asso_size`
--

INSERT INTO `asso_size` (`id_product`, `id_size`, `price`) VALUES
(1, 1, 16.90),
(1, 2, 24.90),
(1, 3, 29.90),
(2, 1, 14.90),
(2, 2, 22.90),
(2, 3, 28.90),
(3, 1, 15.90),
(3, 2, 23.90),
(3, 3, 32.90),
(4, 1, 12.90),
(4, 2, 16.90),
(4, 3, 24.90),
(5, 1, 18.90),
(5, 2, 24.90),
(5, 3, 32.90),
(6, 1, 18.90),
(6, 2, 24.90),
(6, 3, 36.90),
(7, 1, 18.90),
(7, 2, 24.90),
(7, 3, 32.90),
(8, 1, 18.90),
(8, 2, 26.90),
(8, 3, 34.90),
(9, 1, 9.90),
(9, 2, 16.90),
(9, 3, 24.90),
(10, 1, 19.90),
(10, 2, 24.90),
(10, 3, 32.90),
(11, 1, 18.90),
(11, 2, 23.90),
(11, 3, 31.90),
(12, 1, 16.90),
(12, 2, 24.90),
(12, 3, 32.90),
(13, 1, 8.90),
(13, 2, 12.90),
(13, 3, 16.90),
(14, 1, 24.90),
(14, 2, 36.90),
(14, 3, 49.90),
(15, 1, 19.90),
(15, 2, 26.90),
(15, 3, 29.90),
(16, 1, 13.90),
(16, 2, 27.90),
(16, 3, 32.90),
(17, 1, 18.90),
(17, 2, 29.90),
(17, 3, 36.90),
(18, 1, 18.90),
(18, 2, 26.90),
(18, 3, 34.90),
(19, 1, 16.90),
(19, 2, 24.90),
(19, 3, 32.90),
(20, 1, 18.90),
(20, 2, 26.90),
(20, 3, 34.90),
(21, 1, 24.90),
(21, 2, 36.90),
(21, 3, 42.90),
(22, 1, 24.90),
(22, 2, 36.90),
(22, 3, 42.90),
(23, 1, 24.90),
(23, 2, 36.90),
(23, 3, 42.90),
(24, 1, 24.90),
(24, 2, 36.90),
(24, 3, 42.90),
(25, 1, 24.90),
(25, 2, 36.90),
(25, 3, 42.90),
(26, 1, 24.90),
(26, 2, 36.90),
(26, 3, 42.90),
(27, 1, 24.90),
(27, 2, 36.90),
(27, 3, 42.90),
(28, 1, 18.90),
(28, 2, 26.90),
(28, 3, 32.90),
(29, 1, 18.90),
(29, 2, 26.90),
(29, 3, 32.90),
(30, 1, 24.90),
(30, 2, 32.90),
(30, 3, 39.90),
(31, 1, 18.90),
(31, 2, 24.90),
(31, 3, 32.90),
(32, 1, 12.90),
(32, 2, 19.90),
(32, 3, 24.90),
(33, 1, 12.90),
(33, 2, 19.90),
(33, 3, 24.90),
(34, 1, 16.90),
(34, 2, 22.90),
(34, 3, 27.90),
(35, 1, 12.90),
(35, 2, 19.90),
(35, 3, 24.90),
(36, 1, 9.90),
(36, 2, 14.90),
(36, 3, 19.90),
(37, 1, 10.90),
(37, 2, 16.90),
(37, 3, 21.90),
(38, 1, 11.90),
(38, 2, 17.90),
(38, 3, 22.90),
(39, 2, 14.90),
(40, 2, 4.90),
(41, 2, 6.90),
(42, 2, 19.90);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id_category`, `label`) VALUES
(4, 'Accessoires'),
(1, 'Plante d\'extérieure'),
(2, 'Plante d\'intérieure'),
(3, 'Bouquets');

-- --------------------------------------------------------

--
-- Structure de la table `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE IF NOT EXISTS `color` (
  `id_color` int NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  PRIMARY KEY (`id_color`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `color`
--

INSERT INTO `color` (`id_color`, `label`) VALUES
(1, 'Rouge'),
(2, 'Orange'),
(3, 'Jaune'),
(4, 'Blanc'),
(5, 'Rose'),
(6, 'Violet'),
(8, 'Bleu'),
(7, 'Vert');

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `description` varchar(1800) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `promotional_price` int DEFAULT NULL,
  `promotion` tinyint(1) NOT NULL,
  `currency` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `stock` int NOT NULL,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `id_category` (`id_category`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id_product`, `name`, `description`, `promotional_price`, `promotion`, `currency`, `stock`, `id_category`) VALUES
(2, 'Dracaena', 'Dracaena : L\'Élégance Tropicale à Domicile\r\n\r\n    Élégance durable : Avec ses feuilles longues et arquées aux couleurs vives allant du vert au jaune strié, le Dracaena est un spectacle de beauté tropicale qui apporte élégance et style à tout espace de vie ou de bureau.\r\n    Purificateur d\'air supérieur : Renommé pour sa capacité à améliorer la qualité de l\'air, le Dracaena élimine efficacement les polluants intérieurs tels que le xylène et le trichloréthylène, créant un environnement plus sain pour vous et votre famille.\r\n    Entretien minimal : Idéal pour les jardiniers de tous niveaux, ce résident tropical nécessite peu d\'attention. Il prospère avec un arrosage modéré et dans des conditions de faible luminosité, ce qui en fait une option parfaite pour les coins moins ensoleillés.\r\n    Touche de zen : Ajoutez une touche de sérénité à votre intérieur avec le Dracaena, dont les formes apaisantes et la texture douce sont un véritable antidote au stress quotidien.\r\n    Transformez votre espace avec notre Dracaena, et laissez-vous séduire par son allure exotique et ses bienfaits purificateurs. Un ajout indispensable à toute maison moderne.\r\n    \r\n    - Taille petite\r\n    - Taille moyenne\r\n    - Taille grande', NULL, 0, '€', 10, 2),
(3, 'Monstera', 'Monstera : L\'Icône du Design Végétal\r\n\r\nEsthétique captivante : Avec ses feuilles spectaculaires en forme de cœur et ses découpes uniques, le Monstera, souvent appelé \"plante du fromage suisse\", apporte une touche de design naturel à tout intérieur. Ses feuilles robustes et luxuriantes créent une ambiance tropicale en un instant.\r\n\r\nFacilité de croissance : Le Monstera est l\'une des plantes les plus faciles à entretenir. Il préfère les environnements lumineux sans soleil direct et demande peu d\'arrosage, ce qui en fait le choix idéal pour les jardiniers de tous niveaux.\r\n\r\nPurificateur d\'air : Ce n\'est pas seulement une belle plante ; le Monstera aide aussi à purifier l\'air de votre maison en filtrant les toxines, vous offrant ainsi un environnement plus sain.\r\n\r\nAdaptabilité : Que ce soit dans un petit appartement ou une grande maison, le Monstera s\'adapte et prospère, ce qui en fait un excellent choix pour ajouter de la verdure à tout espace.\r\n\r\nApportez un morceau de la forêt tropicale chez vous avec notre Monstera, parfait pour ceux qui cherchent à combiner style, simplicité et bienfaits naturels.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 2),
(4, 'Calathea', 'Calathea : L\'Art Végétal en Mouvement\r\n\r\nFeuillage dynamique : Connu pour ses feuilles colorées aux motifs complexes, le Calathea est un véritable chef-d\'œuvre de la nature. Ses feuilles s\'ouvrent et se ferment en réponse à la lumière du jour, offrant un spectacle captivant.\r\n\r\nBeauté et bien-être : Au-delà de son apparence exquise, le Calathea purifie l\'air en absorbant les toxines, contribuant à un environnement intérieur plus sain. C\'est la parfaite harmonie entre esthétique et santé.\r\n\r\nEntretien spécifique : Cette plante tropicale aime les environnements humides et nécessite un arrosage régulier pour maintenir son sol légèrement humide. Elle préfère les endroits à lumière indirecte, ce qui la rend idéale pour égayer les coins sombres de votre maison.\r\n\r\nSymbole de bien-être : En choisissant un Calathea, vous ne choisissez pas seulement une plante, mais un style de vie axé sur le bien-être et la relaxation. C\'est un ajout magnifique et bénéfique à tout espace de vie ou de travail.\r\n\r\nDonnez vie à votre espace avec notre Calathea, la plante qui allie beauté visuelle à des bienfaits tangibles pour la santé et le bien-être.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 2),
(5, 'Kentia', 'Kentia : L\'Élégance Tropicale\r\n\r\nCharme élégant : Le Kentia, avec ses longues frondes arquées et son allure gracieuse, apporte une touche de sophistication à tout décor. Ses feuilles d\'un vert profond créent une atmosphère relaxante et élégante, idéale pour les maisons ou les bureaux.\r\n\r\nFacilité d\'entretien : Ce palmier est réputé pour sa robustesse et sa capacité à prospérer dans des conditions de faible luminosité et avec peu d\'entretien. Un arrosage modéré et un emplacement à l\'abri des rayons directs du soleil lui suffisent pour s\'épanouir.\r\n\r\nPurificateur d\'air naturel : Le Kentia n\'est pas seulement décoratif ; il est aussi un excellent purificateur d\'air, capable de filtrer et de rafraîchir l\'environnement intérieur pour un espace de vie plus sain.\r\n\r\nAdaptabilité : Que vous viviez dans un studio ou une grande résidence, le Kentia s\'adapte parfaitement grâce à sa croissance modérée et son port majestueux.\r\n\r\nFaites entrer un morceau de paradis tropical chez vous avec notre Kentia, un ajout luxueux et bénéfique qui élève instantanément tout espace.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 2),
(6, 'Pachira', 'Pachira Aquatica : L\'Arbre à Monnaie de la Prospérité\r\n\r\nSymbole de richesse : Surnommé l\'arbre à monnaie, le Pachira est réputé pour attirer la fortune et la prospérité. Ses feuilles brillantes en forme de main ajoutent non seulement un attrait esthétique mais sont également considérées comme un porte-bonheur dans de nombreuses cultures.\r\n\r\nDécoratif et robuste : Avec son tronc tressé distinctif et son feuillage luxuriant, le Pachira est un véritable point focal dans n\'importe quel espace. Il est robuste et tolère bien les variations de conditions de lumière, ce qui en fait une excellente option pour les intérieurs.\r\n\r\nEntretien facile : Ce bel arbre tropical préfère un arrosage modéré, permettant à la surface de son sol de sécher entre les arrosages. Il est parfait pour ceux qui cherchent une plante nécessitant peu de soins.\r\n\r\nAméliore la qualité de l\'air : Le Pachira purifie l\'air en absorbant les impuretés et en produisant de l\'oxygène, contribuant à un environnement intérieur plus sain et plus frais.\r\n\r\nOffrez-vous un symbole de croissance et de prospérité avec notre Pachira Aquatica. C\'est l\'addition parfaite pour améliorer votre espace de vie tout en apportant une touche de verdure et de chance.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 2),
(7, 'Areca', 'Areca : L\'Élégance Tropicale Dans Votre Salon\r\n\r\nEsthétique raffinée : L\'Areca, avec ses longues palmes douces et arquées, offre une touche de douceur et de verdure tropicale. Son port élancé et son feuillage dense en font un excellent choix pour ajouter de la verticalité et de la fraîcheur à votre décoration intérieure.\r\n\r\nPurificateur d\'air naturel : Au-delà de son allure tropicale séduisante, l\'Areca est un champion de la purification de l\'air. Il filtre les toxines nocives, procurant ainsi un air plus pur et plus frais pour votre maison ou votre bureau.\r\n\r\nFacile à entretenir : L\'Areca est parfait pour ceux qui souhaitent une plante d\'intérieur avec un entretien minimal. Il préfère les endroits lumineux mais tolère la lumière indirecte et nécessite un arrosage modéré, en laissant le sol sécher légèrement entre les sessions.\r\n\r\nClimat intérieur amélioré : Non seulement il purifie l\'air, mais l\'Areca contribue également à augmenter l\'humidité ambiante, ce qui est bénéfique durant les mois d\'hiver ou dans les environnements de climatisation.\r\n\r\nAjoutez une dimension tropicale et purificatrice à votre espace avec notre palmier Areca. Il est l\'addition parfaite pour ceux qui recherchent à combiner beauté naturelle et avantages environnementaux.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 2),
(8, 'Aralia', 'Aralia : Une Touche d\'Exotisme Moderne\r\n\r\nDesign unique : L\'Aralia se distingue par ses feuilles grandes et découpées, offrant une texture riche et un profil dramatique qui peut rehausser n\'importe quel espace. Ses feuilles d\'un vert profond avec parfois des teintes de jaune ou de blanc, selon la variété, ajoutent un contraste visuel saisissant.\r\n\r\nFacile à entretenir : Idéal pour ceux qui débutent dans le monde des plantes ou qui préfèrent les soins simples. L\'Aralia prospère dans des conditions de lumière modérée à faible et nécessite seulement un arrosage occasionnel, le rendant parfait pour les bureaux ou les maisons occupées.\r\n\r\nPurifie l\'air : En plus de son esthétique impressionnante, l\'Aralia aide à purifier l\'air de votre intérieur. Il absorbe les toxines environnementales, contribuant ainsi à un habitat plus sain.\r\n\r\nAdaptabilité : Que ce soit dans un salon spacieux ou un petit coin de bureau, l\'Aralia s\'adapte magnifiquement à divers environnements, apportant avec lui un morceau de nature exotique.\r\n\r\nOptez pour notre Aralia et transformez votre intérieur avec son style exotique et ses bienfaits pour la santé. Un choix élégant pour une ambiance naturellement raffinée.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 2),
(9, 'Cactus', 'Cactus : L\'Essence du Désert Capturée\r\n\r\nRobuste et stylé : Embrassez la beauté brute et épurée du cactus. Connu pour sa résilience, ce champion du désert apporte une touche de caractère audacieux à votre intérieur avec ses formes sculpturales et ses épines fascinantes.\r\n\r\nEntretien minimal : Le cactus est l\'allié parfait pour ceux qui cherchent une plante nécessitant peu d\'attention. Il prospère avec un arrosage très espacé et beaucoup de lumière, ce qui le rend idéal pour les espaces lumineux et les emplois du temps chargés.\r\n\r\nDurable et adaptable : Capable de survivre dans des conditions arides, le cactus est incroyablement durable et s\'adapte à presque tous les environnements. Il peut vivre longtemps, offrant une présence constante et peu exigeante dans votre maison ou bureau.\r\n\r\nDécor versatile : Qu\'il soit placé sur un rebord de fenêtre ensoleillé, une étagère minimaliste ou comme pièce centrale sur une table, le cactus attire l\'œil et ajoute instantanément une dimension intéressante à votre décor.\r\n\r\nIntroduisez une touche de désert dans votre espace avec notre cactus. Un choix parfait pour ajouter de la texture et un point focal naturel à votre décor sans les tracas d\'un entretien régulier.\r\n\r\n   - Taille petite\r\n\r\n   - Taille moyenne\r\n\r\n   - Taille grande', NULL, 0, '€', 10, 2),
(10, 'Phalaénopsis', 'Phalaénopsis : L\'Élégance des Orchidées chez Vous\r\n\r\nBeauté captivante : La Phalaénopsis, souvent appelée \"orchidée papillon\", séduit par ses longues tiges gracieuses et ses fleurs délicates qui semblent flotter dans l\'air. Ses pétales soyeux disponibles dans une palette de couleurs, des blancs purs aux roses vibrants, ajoutent une touche d\'élégance raffinée à tout espace.\r\n\r\nFleuraison prolongée : Chaque tige peut porter des fleurs pendant plusieurs mois à la fois, offrant une beauté durable avec un minimum d\'effort. C\'est la plante parfaite pour ceux qui souhaitent un spectacle floral longue durée sans la complexité des soins intensifs.\r\n\r\nEntretien simple : La Phalaénopsis nécessite peu d\'entretien comparée à d\'autres orchidées. Elle prospère dans un environnement chaud avec une lumière indirecte et un arrosage hebdomadaire, ce qui la rend idéale pour les intérieurs résidentiels ou commerciaux.\r\n\r\nCadeau parfait : Offrir une Phalaénopsis signifie partager un symbole de luxe et de beauté. Elle est parfaite pour les anniversaires, les célébrations ou simplement pour apporter un peu de joie à quelqu\'un de spécial.\r\n\r\nRavivez votre maison ou bureau avec notre Phalaénopsis élégante. Elle n\'apporte pas seulement de la beauté à votre espace mais aussi un air de tranquillité et de sophistication.\r\n\r\n   - Taille petite\r\n\r\n   - Taille moyenne\r\n\r\n   - Taille grande', NULL, 0, '€', 10, 1),
(11, 'Dendrobium', 'Dendrobium : L\'Orchidée aux Mille Visages\r\n\r\nVariété spectaculaire : Le Dendrobium est l\'une des orchidées les plus diversifiées, avec des centaines d\'espèces offrant une variété étonnante de formes et de couleurs. Ses grappes de fleurs, qui peuvent varier du blanc pur aux nuances de violet intense, offrent un spectacle visuel saisissant qui capte l\'attention.\r\n\r\nLongue floraison : Renommé pour sa floraison généreuse et prolongée, le Dendrobium peut décorer votre espace avec ses fleurs exquises pendant plusieurs mois. C\'est un ajout durable et coloré à n\'importe quel intérieur.\r\n\r\nEntretien modéré : Contrairement à d\'autres orchidées plus capricieuses, le Dendrobium demande un entretien relativement simple. Il aime les environnements lumineux et un arrosage régulier mais modéré, avec un séchage complet entre les arrosages.\r\n\r\nPolyvalence décorative : Que ce soit posé sur un bureau, accroché en pot suspendu, ou placé dans une salle d\'exposition, le Dendrobium apporte une touche d\'élégance tropicale. Il s\'adapte bien à de nombreux décors, ajoutant de la couleur et un intérêt visuel partout où il se trouve.\r\n\r\nEmbellissez votre maison ou votre lieu de travail avec notre Dendrobium, l\'orchidée qui combine beauté florale, variété impressionnante et entretien facile.\r\n\r\n   - Taille petite\r\n\r\n   - Taille moyenne\r\n\r\n   - Taille grande', NULL, 0, '€', 10, 1),
(12, 'Anthurium', 'Anthurium : L\'Éclat du Flamant dans Votre Décor\r\n\r\nÉclatante beauté : Reconnu pour ses fleurs brillantes en forme de cœur et son feuillage lustré, l\'Anthurium, souvent appelé « langue de feu » ou « fleur flamant », ajoute une touche de couleur vibrante à tout espace. Ses spathes, qui peuvent être rouges, roses, ou blanches, contrastent magnifiquement avec ses feuilles vert foncé.\r\n\r\nFloraison continue : L\'Anthurium fleurit presque toute l\'année si bien soigné, offrant une présence colorée durable. C\'est l\'idéal pour ceux qui désirent une plante avec un impact visuel constant.\r\n\r\nEntretien simple : Cette plante tropicale aime l\'humidité et la lumière indirecte mais tolère aussi les niveaux de lumière plus bas. Un arrosage régulier, en laissant le sol sécher légèrement entre les arrosages, suffit pour la maintenir en bonne santé.\r\n\r\nParfait pour les intérieurs modernes : Avec son allure chic et moderne, l\'Anthurium est parfait pour les bureaux contemporains ou les maisons minimalistes, ajoutant une touche élégante sans surcharger l\'espace.\r\n\r\nAjoutez une dimension spectaculaire à votre intérieur avec notre Anthurium. Non seulement il embellit l\'espace, mais il le fait avec style et facilité.\r\n\r\n	- Taille petite\r\n\r\n	- Taille moyenne\r\n\r\n	- Taille grande', NULL, 0, '€', 10, 1),
(13, 'Rosier', 'Rosier : Symbole de Romance et de Raffinement\r\n\r\nÉlégance intemporelle : Le rosier, véritable icône du jardin, apporte une touche de classe avec ses fleurs délicates et parfumées. Disponible dans une palette de couleurs allant du blanc pur aux rouges passionnés et aux roses tendres, chaque variété offre son propre charme unique.\r\n\r\nFloraison généreuse : Les rosiers sont réputés pour leur floraison abondante et prolongée, embellissant tout espace extérieur du printemps à l\'automne. Parfaits pour les bordures, les treillis ou comme pièce maîtresse spectaculaire, ils captivent tous les regards.\r\n\r\nSoins adaptés : Bien que nécessitant un peu plus d\'attention pour prospérer, les rosiers récompensent généreusement les soins avec une profusion de fleurs. Un sol bien drainé, beaucoup de soleil et un arrosage régulier aideront vos rosiers à s\'épanouir.\r\n\r\nVersatilité décorative : Que vous les cultiviez en massifs, en pots ou en haies, les rosiers sont extrêmement polyvalents. Ils apportent une structure et une couleur vibrante à tout jardin ou balcon.\r\n\r\nCultivez la beauté et la tradition avec notre collection de rosiers. Chaque fleur raconte une histoire de nature et d\'art, transformant votre jardin en un tableau vivant de fragrances et de couleurs.\r\n\r\n	- Taille petite\r\n\r\n    - Taille moyenne\r\n\r\n    - Taille grande', NULL, 0, '€', 10, 1),
(14, 'Strelitzia', 'Strelitzia : L\'Exotisme Élégant\r\n\r\nSpectacle tropical : Communément appelée « oiseau de paradis », la Strelitzia est célèbre pour ses fleurs spectaculaires qui ressemblent à des créatures exotiques. Avec ses grandes feuilles vertes en forme de lance et ses fleurs éclatantes aux couleurs vives, cette plante apporte une touche de tropiques luxuriants à tout environnement.\r\n\r\nFloraison impressionnante : Lorsqu\'elle fleurit, la Strelitzia présente des fleurs orange et bleu vibrant, un véritable spectacle visuel. Elle fleurit généralement durant les mois les plus froids, ajoutant de la couleur et de l\'intérêt quand beaucoup d\'autres plantes sont en repos.\r\n\r\nFacilité de soin : Robuste et nécessitant peu d\'entretien, la Strelitzia est parfaite pour ceux qui veulent des résultats impressionnants sans trop d\'effort. Elle préfère les endroits ensoleillés avec un arrosage modéré, ce qui en fait une option idéale pour les patios ensoleillés ou les intérieurs lumineux.\r\n\r\nAdaptabilité : Que ce soit en pot dans un bureau ou en pleine terre dans un jardin, la Strelitzia s\'adapte bien et grandit avec élégance. Elle peut atteindre une hauteur impressionnante, offrant un impact visuel fort et une présence majestueuse.\r\n\r\nOffrez-vous un bout de paradis avec notre Strelitzia. Chaque plante est une œuvre d\'art vivante, apportant un air de vacances exotiques directement chez vous.\r\n\r\n   - Taille petite\r\n\r\n   - Taille moyenne\r\n\r\n   - Taille grande', NULL, 0, '€', 10, 1),
(15, 'Hortensia', 'Hortensia : Une Explosion de Couleurs Douces\r\n\r\nRichesse chromatique : Les hortensias sont célèbres pour leurs grandes inflorescences globuleuses qui captivent le regard. Disponibles dans une gamme de couleurs allant du bleu profond, au rose vibrant, au blanc pur et parfois au vert, ils apportent une richesse de nuances à tout jardin ou arrangement floral.\r\n\r\nFloraison luxuriante : Ces plantes robustes offrent une floraison abondante et spectaculaire qui dure de l\'été jusqu\'au début de l\'automne. Les hortensias sont parfaits pour créer un point focal dans un jardin ou comme pièce maîtresse dans des arrangements floraux.\r\n\r\nSoins simples : L\'hortensia préfère les sols riches, humides mais bien drainés, et bénéficie d\'un emplacement à mi-ombre. Il est adapté pour les jardiniers de tous niveaux grâce à sa tolérance et sa facilité d\'entretien.\r\n\r\nVersatilité décorative : Utilisez les hortensias pour border des allées, embellir des bordures, ou même en pots sur des terrasses. Leur capacité à changer de couleur en fonction du pH du sol ajoute un élément de surprise et de personnalisation à votre jardin.\r\n\r\nCultivez l\'éclat avec notre collection d\'hortensias. Que vous cherchiez à ajouter une touche de couleur pastel ou un effet dramatique avec des couleurs vives, l\'hortensia est la plante parfaite pour enrichir votre espace extérieur avec style et élégance.\r\n\r\n	- Taille petite\r\n\r\n	- Taille moyenne\r\n\r\n	- Taille grande', NULL, 0, '€', 10, 1),
(16, 'Hibiscus', 'Hibiscus : Une Touche Tropicale Pleine de Couleurs\r\n\r\nÉclat tropical : L\'hibiscus est célèbre pour ses grandes fleurs éclatantes, qui peuvent être rouges, roses, jaunes, ou oranges. Chaque fleur, en forme de trompette, s\'ouvre pour révéler un cœur souvent contrasté, apportant un spectacle visuel lumineux qui évoque les charmes des îles tropicales.\r\n\r\nFloraison généreuse : Cette plante offre une profusion de fleurs du printemps à l\'automne, chaque fleur durant souvent seulement un jour ou deux, mais étant rapidement remplacée par de nouvelles. L\'hibiscus est idéal pour ceux qui désirent un affichage continu de couleur et de vitalité.\r\n\r\nSoins adaptés : L\'hibiscus prospère avec beaucoup de soleil et un sol bien drainé. Il nécessite un arrosage régulier mais modéré, ce qui en fait une option formidable pour les jardiniers qui peuvent lui fournir un environnement lumineux et chaleureux.\r\n\r\nPolyvalence décorative : Parfait en pot sur un patio ensoleillé, en massif dans un jardin, ou même comme haie vivante, l\'hibiscus est extrêmement adaptable et peut transformer n\'importe quel espace en un coin de paradis tropical.\r\n\r\nRavivez votre espace avec notre Hibiscus, la plante idéale pour ceux qui recherchent un impact visuel fort avec un minimum de soins. Chaque fleur est une promesse de beauté pure et de charme naturel.\r\n\r\n	- Taille petite\r\n\r\n	- Taille moyenne\r\n\r\n	- Taille grande', NULL, 0, '€', 10, 1),
(17, 'Olivier', 'Olivier : Le Symbole de Paix et de Longévité\r\n\r\nHéritage méditerranéen : Avec ses feuilles argentées et ses branches torsadées, l\'olivier est plus qu\'une simple plante ; c\'est un symbole de tradition et de longévité. Originaire de la région méditerranéenne, cet arbre robuste apporte une touche d\'histoire et de culture à votre jardin ou patio.\r\n\r\nFruits précieux : Non seulement l\'olivier est magnifique, mais il produit également des olives qui peuvent être utilisées en cuisine ou transformées en huile. La récolte des olives ajoute une dimension pratique et enrichissante à l\'expérience de jardinage.\r\n\r\nFacilité de soin : L\'olivier est remarquablement résistant à la sécheresse une fois établi, nécessitant peu d\'arrosage. Il préfère un sol bien drainé et beaucoup de soleil, ce qui en fait une option idéale pour les climats plus chauds ou les espaces ensoleillés.\r\n\r\nPolyvalence décorative : Parfait pour les jardins de style méditerranéen, les terrasses ou même en pot comme plante d\'intérieur, l\'olivier est versatile et adaptable. Son allure élégante peut rehausser tout décor, extérieur comme intérieur.\r\n\r\nCultivez la beauté, le patrimoine et la fonctionnalité avec notre Olivier. Chaque arbre est une promesse de paix, offrant non seulement un abri ombragé mais aussi une source de fruits sains.\r\n\r\n	- Taille petite\r\n\r\n	- Taille moyenne\r\n\r\n	- Taille grande', NULL, 0, '€', 10, 1),
(18, 'Erable', 'Érable : Un Spectacle de Couleurs à Chaque Saison\r\n\r\nFeuillage spectaculaire : L\'Érable est renommé pour son feuillage qui change de couleur avec les saisons, offrant un spectacle visuel impressionnant. Au printemps et en été, ses feuilles sont d\'un vert riche et profond, tandis qu\'à l\'automne, elles se transforment en teintes vibrantes de rouge, d\'orange et de jaune.\r\n\r\nCroissance robuste : Cet arbre vigoureux est apprécié pour sa robustesse et sa longévité. Il peut devenir un point focal majestueux dans n\'importe quel jardin, grandissant avec grâce au fil des années.\r\n\r\nAdaptabilité : Les érables s\'adaptent à une variété de sols, bien qu\'ils préfèrent les sols humides et bien drainés. Ils sont résistants à la plupart des maladies et des parasites, ce qui en fait une option durable et à faible entretien pour les jardiniers.\r\n\r\nPolyvalence décorative : Parfait pour créer de l\'ombre ou comme pièce maîtresse d\'un aménagement paysager, l\'Érable est également idéal pour les allées et les avenues. Sa présence imposante et ses couleurs saisonnières en font un excellent choix pour tout espace extérieur.\r\n\r\nPlantez un Érable pour enrichir votre espace avec sa croissance majestueuse et son défilé de couleurs. C\'est un ajout durable qui apporte beauté naturelle et élégance à votre environnement tout au long de l\'année.\r\n\r\n	- Taille petite\r\n\r\n	- Taille moyenne\r\n\r\n	- Taille grande', NULL, 0, '€', 10, 1),
(19, 'Laurier-rose', 'Laurier-rose : Éclat Méditerranéen Tout au Long de l\'Année\r\n\r\nBeauté durable : Le Laurier-rose est une plante à fleurs qui incarne la chaleur et le charme du climat méditerranéen. Ses fleurs délicates, disponibles dans une palette de couleurs allant du blanc pur au rose intense et au rouge vif, éclatent en grappes généreuses qui durent de l\'été jusqu\'à l\'automne.\r\n\r\nFacilité de soin : Ce robuste arbuste est idéal pour ceux qui cherchent une plante nécessitant peu d\'entretien. Il est résistant à la sécheresse une fois établi et préfère les emplacements ensoleillés avec un sol bien drainé.\r\n\r\nVersatilité décorative : Le Laurier-rose peut être utilisé en haie, en pot ou comme pièce centrale dans un jardin de rocaille ou bordure. Sa croissance rapide et sa silhouette dense le rendent parfait pour créer de l\'intimité ou un point focal coloré.\r\n\r\nAttention : Bien que magnifique, le Laurier-rose est toxique lorsqu\'il est ingéré, donc il convient de le placer avec précaution dans les jardins fréquentés par des enfants ou des animaux domestiques.\r\n\r\nAdaptabilité : Que ce soit dans un grand jardin ou un petit balcon, le Laurier-rose s\'adapte à de nombreux environnements et styles de jardinage, apportant avec lui une touche de Méditerranée.\r\n\r\nCultivez la beauté méditerranéenne avec notre Laurier-rose, parfait pour ajouter une explosion de couleur et une ambiance ensoleillée à votre extérieur.\r\n\r\n	- Taille petite\r\n\r\n	- Taille moyenne\r\n\r\n	- Taille grande', NULL, 0, '€', 10, 1),
(20, 'Bougainvillier', 'Bougainvillier : Explosion de Couleurs Vibrantes\r\n\r\nSpectacle coloré : Le Bougainvillier est célèbre pour ses cascades de bractées colorées qui semblent envelopper chaque branche. Disponible dans des teintes éclatantes de rose, violet, rouge, orange et jaune, cet arbuste grimpant transforme n\'importe quel espace en un festival de couleurs vives.\r\n\r\nCroissance vigoureuse : Ce grimpeur robuste peut atteindre de grandes hauteurs et étendues, idéal pour couvrir des pergolas, des treillis, des clôtures ou des murs. Son feuillage dense et ses fleurs colorées offrent une couverture spectaculaire tout au long de l\'année.\r\n\r\nFacilité d\'entretien : Le Bougainvillier est remarquablement résilient et adapté aux environnements chauds et secs. Il préfère un sol bien drainé et beaucoup de soleil pour prospérer, nécessitant peu d\'arrosage une fois établi.\r\n\r\nLongue floraison : Avec des périodes de floraison qui peuvent s\'étendre sur plusieurs mois, le Bougainvillier garantit un affichage continu de beauté, particulièrement pendant les mois les plus chauds de l\'année.\r\n\r\nUsage décoratif : Parfait pour ajouter un impact visuel fort, le Bougainvillier est utilisé pour créer des points focaux dramatiques dans les jardins paysagers ou pour ajouter de la vie et de la couleur à des patios et des terrasses.\r\n\r\nOffrez-vous un spectacle de couleur durable avec notre Bougainvillier. Une plante idéale pour ceux qui cherchent à ajouter une touche de dynamisme et d\'exotisme à leur décor extérieur.\r\n\r\n	- Taille petite\r\n\r\n	- Taille moyenne\r\n\r\n	- Taille grande', NULL, 0, '€', 10, 1),
(21, 'Bouquet blanc', 'Bouquet Pureté Élégante : Un Souffle de Fraîcheur\r\n\r\nSymbole de pureté : Notre bouquet de fleurs blanches est une composition classique qui symbolise la pureté, l\'élégance et la tranquillité. Parfait pour les mariages, les baptêmes, ou comme une manière gracieuse de montrer votre affection ou vos condoléances.\r\n\r\nComposition raffinée : Assemblé avec soin, ce bouquet combine des roses blanches veloutées, des lys majestueux, des gerberas délicats et des fleurs de saison qui ajoutent de la texture et du volume. Chaque fleur est choisie pour sa beauté et sa fraîcheur, garantissant un bouquet impressionnant et durable.\r\n\r\nTouche de verdure : Accompagné de feuillage vert doux, tel que l\'eucalyptus ou le fern, ce bouquet n\'est pas seulement beau à regarder mais aussi agréable à sentir. Les verts rehaussent la blancheur des fleurs et ajoutent une dimension de fraîcheur naturelle.\r\n\r\nCadeau universel : Les fleurs blanches sont idéales pour exprimer l\'amour, le respect, la gratitude ou le soutien. Ce bouquet est un choix versatile, convenant à de nombreuses occasions et capable de transmettre vos sentiments les plus profonds avec sophistication.\r\n\r\nPrésentation soignée : Livré dans un emballage élégant, ce bouquet est prêt à être placé dans un vase à l\'arrivée pour un effet immédiat. Offrez ou recevez ce magnifique bouquet de fleurs blanches, prêt à illuminer n\'importe quel espace avec sa beauté intemporelle.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 3),
(22, 'Bouquet rose', 'Bouquet Douceur Romantique : Un Éclat de Tendresse\r\n\r\nCharme romantique : Exprimez vos sentiments les plus tendres avec notre bouquet de fleurs roses, une célébration de la douceur et de l\'affection. Parfait pour les anniversaires, les déclarations d\'amour ou simplement pour partager un moment de joie.\r\n\r\nVariété envoûtante : Ce bouquet harmonieux mêle des roses délicates, des pivoines voluptueuses, et des tulipes éclatantes, chacune choisie pour sa teinte rose et sa texture unique. Les nuances varient du rose pâle au fuchsia, offrant une symphonie de couleurs qui captivent le regard.\r\n\r\nTouche de fraîcheur : Accompagnées de feuillages légers comme le gypsophile ou le lisianthus, ces fleurs ne sont pas seulement splendides à regarder mais dégagent également un parfum subtil et enchanteur. Le contraste des verts met en valeur la profondeur et la vivacité des roses.\r\n\r\nExpression universelle : Le rose est la couleur de l\'harmonie, parfait pour exprimer gratitude, admiration ou sympathie. Ce bouquet est un moyen élégant et affectueux de communiquer vos sentiments, quel que soit l\'événement.\r\n\r\nPrésentation impeccable : Présenté dans un emballage chic et soigné, chaque bouquet est préparé pour impressionner dès l\'instant où il arrive. Prêt à être disposé dans votre vase préféré pour embellir instantanément tout intérieur.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 3),
(23, 'Bouquet jaune', 'Bouquet Éclat Solaire : Une Onde de Bonheur\r\n\r\nSymbole de joie : Notre bouquet de fleurs jaunes est une explosion de chaleur et de bonheur. Parfait pour illuminer la journée de quelqu\'un, célébrer une réussite ou simplement envoyer un rayon de soleil à un être cher.\r\n\r\nVariété rayonnante : Composé de tournesols lumineux, de gerberas vibrants, et de roses jaunes éclatantes, ce bouquet apporte un mélange joyeux de textures et de formes. Chaque fleur est choisie pour sa couleur vive et son impact visuel, garantissant un bouquet qui capture l\'essence de l\'optimisme.\r\n\r\nTouche de vitalité : Les fleurs jaunes sont accompagnées de verdure fraîche, comme le solidago ou les feuilles de salal, qui mettent en valeur leur éclat naturel et ajoutent une touche de vivacité à l\'ensemble.\r\n\r\nUniversellement positif : Le jaune, couleur de l\'amitié et de la bonne volonté, est idéal pour de nombreuses occasions. Ce bouquet est un choix parfait pour encourager, féliciter ou remercier, transmettant énergie et chaleur humaine.\r\n\r\nPrésentation soignée : Livré dans un emballage élégant, ce bouquet est prêt à égayer n\'importe quel espace dès son arrivée. C\'est un cadeau prêt à partager la joie et à transformer n\'importe quel moment en une occasion spéciale.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 3),
(24, 'Bouquet orange', 'Bouquet Éclat Passionné : Un Feu d\'Artifice Floral\r\n\r\nVibrance ardente : Notre bouquet de fleurs orange capte l\'essence de l\'énergie et de la passion. Parfait pour enflammer les cœurs, célébrer les grandes occasions, ou simplement réchauffer l\'atmosphère d\'un intérieur.\r\n\r\nComposition flamboyante : Assemblé avec soin, ce bouquet combine des dahlias audacieux, des lys flamboyants, et des roses orange vif, chacune choisie pour sa teinte éclatante et sa texture riche. Les nuances d’orange, du pêche doux au rougeâtre intense, créent un spectacle visuel captivant.\r\n\r\nTouche de dynamisme : Accompagnées de touches de verdure comme le ruscus ou l\'eucalyptus, ces fleurs ne sont pas seulement belles à regarder mais dégagent également un parfum subtil et rafraîchissant. Le contraste des verts rehausse l\'intensité des oranges pour un effet encore plus spectaculaire.\r\n\r\nExpression chaleureuse : L\'orange est la couleur de l\'optimisme et de l\'enthousiasme, idéale pour stimuler le moral, célébrer un nouveau départ, ou encourager un ami. Ce bouquet est une manière éclatante de transmettre force et positivité.\r\n\r\nPrésentation impeccable : Présenté dans un emballage raffiné, chaque bouquet est préparé pour faire une impression mémorable dès son arrivée. Prêt à être placé dans un vase à l\'arrivée pour ajouter une touche de chaleur et de passion à tout décor.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 3),
(25, 'Bouquet rouge', 'Bouquet Cœur Ardent : Une Déclaration d\'Amour en Couleurs\r\n\r\nPassion incarnée : Le rouge est la couleur de l\'amour et de la passion. Notre bouquet de fleurs rouges est conçu pour exprimer des sentiments intenses et célébrer les occasions spéciales, comme les anniversaires, les déclarations d\'amour ou la Saint-Valentin.\r\n\r\nSélection riche et opulente : Ce bouquet regorge de roses rouges luxuriantes, de tulipes éclatantes, et de gerberas vibrants. Chaque fleur est choisie pour sa couleur profonde et sa forme parfaitement sculptée, offrant un impact visuel sans pareil.\r\n\r\nÉlégance raffinée : Accompagné de feuillages vert sombre, comme la fougère ou l\'eucalyptus, ce bouquet ne se contente pas d\'être beau à regarder, il est aussi divinement parfumé. Le vert des feuilles accentue la profondeur du rouge, ajoutant une touche de sophistication.\r\n\r\nExpression universelle : Utilisé pour exprimer l\'amour, le respect, ou même le courage, le rouge a une signification puissante et universelle. Offrir ce bouquet est une manière classique mais toujours impressionnante de montrer vos sentiments.\r\n\r\nPrésentation impeccable : Présenté dans un emballage élégant et soigné, chaque bouquet est prêt à faire une impression durable dès son arrivée. Un cadeau spectaculaire qui transforme n\'importe quelle occasion en un moment mémorable.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 3),
(26, 'Bouquet violet', 'Bouquet Mystique Violet : Une Touche de Mystère et d\'Élégance\r\n\r\nÉclat sophistiqué : Le violet, couleur de la royauté et du mystère, est au cœur de notre bouquet envoûtant. Conçu pour captiver et charmer, ce bouquet est parfait pour des occasions spéciales, offrir du réconfort, ou simplement ajouter une note de sophistication à votre intérieur.\r\n\r\nComposition luxuriante : Ce bouquet regorge de fleurs sélectionnées pour leur beauté et leur tonalité profonde, incluant des iris majestueux, des lavandes parfumées et des dahlias opulents. Les différentes nuances de violet, allant du lavande léger au prune intense, créent une harmonie visuelle riche et captivante.\r\n\r\nDétails raffinés : Accompagné de verdure délicate comme le feuillage argenté ou le lisianthus vert, ce bouquet est non seulement magnifique à regarder, mais également agréablement parfumé. Le contraste avec le vert met en valeur la profondeur des violettes pour un effet des plus élégants.\r\n\r\nSymbolisme riche : Le violet est souvent associé à la sagesse, à la dignité, et à l\'indépendance. Ce bouquet est une expression sublime de ces qualités, idéal pour ceux qui cherchent à transmettre un message de respect et d\'admiration.\r\n\r\nPrésentation impeccable : Livré dans un emballage soigné et élégant, chaque bouquet est prêt à impressionner et à évoquer un sentiment de luxe dès son arrivée. C\'est le cadeau parfait pour marquer les esprits et embellir n\'importe quel espace avec distinction.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 3),
(27, 'Bouquet multicolore', 'Bouquet Festif Multicolore : Un Arc-en-Ciel de Joie\r\n\r\nCélébration de couleurs : Notre bouquet multicolore est une explosion de joie et de couleurs vives. Parfait pour illuminer une journée, célébrer un événement heureux ou simplement apporter un sourire, ce bouquet est une véritable fête pour les yeux.\r\n\r\nDiversité florale : Assemblé avec soin, ce bouquet mélange des fleurs de différentes espèces et teintes, incluant des roses, des tulipes, des gerberas et des fleurs de saison, chacune choisie pour sa couleur éclatante et sa fraîcheur. Les nuances vibrantes de rouge, jaune, bleu, orange et violet créent un effet visuel dynamique et captivant.\r\n\r\nTouche de vitalité : Accompagné de verdure fraîche comme le ruscus ou l\'eucalyptus, ce bouquet n\'est pas seulement un plaisir pour les yeux mais aussi pour l\'odorat. Les feuilles vertes enrichissent la palette de couleurs et ajoutent une dimension de richesse à l\'ensemble.\r\n\r\nMessage universel : Les fleurs multicolores sont parfaites pour exprimer la joie, l\'amour, la gratitude ou les félicitations. Ce bouquet est un choix universel, adapté à toutes les occasions et capable de transmettre un éventail d\'émotions joyeuses et positives.\r\n\r\nPrésentation impeccable : Présenté dans un emballage chic et soigné, chaque bouquet est prêt à être placé dans un vase à l\'arrivée pour un effet immédiat. Offrez ou recevez ce magnifique bouquet multicolore, prêt à égayer n\'importe quel espace avec sa beauté vibrante et son énergie contagieuse.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 3),
(28, 'Bouquet de roses', 'Bouquet de roses :\r\n\r\nBouquet Royal de Roses : L\'Élégance Classique\r\n\r\nSymbole d\'amour et de beauté : Notre bouquet de roses exclusivement composé de cette fleur emblématique est une déclaration d\'élégance et de passion. Parfait pour exprimer l\'amour, le respect, ou célébrer des moments spéciaux comme des anniversaires, des mariages, ou la Saint-Valentin.\r\n\r\nSélection raffinée : Chaque rose est soigneusement sélectionnée pour sa forme parfaite, sa couleur riche et son parfum envoûtant. Disponible dans une variété de couleurs allant du rouge profond au blanc pur, du rose tendre au jaune vibrant, ce bouquet permet de personnaliser votre message selon l\'occasion.\r\n\r\nDurabilité et fraîcheur : Cultivées dans les meilleures conditions, nos roses promettent une longévité remarquable et une fraîcheur qui dure. Elles sont préparées pour résister au temps, permettant à celui qui les reçoit de profiter de leur beauté et de leur parfum pendant de nombreux jours.\r\n\r\nPrésentation sophistiquée : Le bouquet est arrangé de manière à mettre en valeur la splendeur naturelle de chaque rose. Entrelacées avec de la verdure délicate, les roses sont mises en scène dans un emballage élégant qui complète leur majesté.\r\n\r\nCadeau universellement apprécié : Les roses sont un classique indémodable. Offrir un bouquet de roses est un geste sûr et apprécié, capable de toucher les cœurs avec sa simplicité et sa grandeur naturelle.\r\n\r\nPrêt à offrir : Livré dans un emballage protecteur et chic, ce bouquet de roses est prêt à captiver dès son déballage, idéal pour un effet surprise garanti.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 3),
(29, 'Bouquet de pivoines', 'Bouquet Sublime de Pivoines : Un Souffle de Douceur\r\n\r\nSymbole de romance et de prospérité : Notre bouquet de pivoines est une ode à la tendresse et à l\'abondance. Ces fleurs somptueuses, souvent utilisées pour célébrer les mariages et les grandes occasions, incarnent la romance et le bien-être, faisant de ce bouquet le cadeau parfait pour exprimer l\'amour et les vœux de bonheur.\r\n\r\nÉclatante beauté : Chaque pivoine est choisie pour sa taille généreuse et ses pétales voluptueux. Disponible dans une palette de couleurs allant du blanc crème au rose profond et au rouge, ce bouquet est un véritable spectacle visuel, riche en textures et nuances subtiles.\r\n\r\nParfum envoûtant : Les pivoines sont réputées pour leur parfum délicat et enivrant, qui se répand doucement pour parfumer délicatement votre espace. Ce bouquet n\'est pas seulement un plaisir pour les yeux, mais aussi une caresse pour l\'odorat.\r\n\r\nDurabilité impressionnante : Bien que les pivoines soient des fleurs de saison, elles offrent une tenue remarquable une fois coupées, permettant de profiter de leur splendeur pendant plusieurs jours, voire plus si elles sont bien entretenues.\r\n\r\nPrésentation élégante : Les pivoines sont arrangées avec soin pour mettre en valeur leur volume et leur forme gracieuse. Elles sont présentées dans un emballage raffiné qui en fait un cadeau prêt à être admiré dès sa réception.\r\n\r\nCadeau de choix pour tout événement spécial : Que ce soit pour un anniversaire, un mariage, une célébration ou simplement pour égayer le quotidien, un bouquet de pivoines est toujours un choix distingué qui montre votre goût exquis.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 3),
(30, 'Bouquet de lys', 'Bouquet Majestueux de Lys : Élégance Pure et Raffinée\r\n\r\nSymbole de pureté et de renouveau : Reconnus pour leur beauté stupéfiante et leur symbolisme riche, les lys sont une expression classique de dignité et de splendeur. Ce bouquet de lys est idéal pour des occasions comme les mariages, les anniversaires ou comme geste de sympathie.\r\n\r\nVariété captivante : Sélectionnés avec soin, les lys de ce bouquet peuvent varier entre les lys asiatiques, qui sont éclatants et colorés, et les lys orientaux, connus pour leurs pétales larges et leur parfum envoûtant. Disponibles dans des teintes de blanc pur, rose doux et jaune vif, ils apportent une touche de grâce et de sophistication à tout environnement.\r\n\r\nParfum envoûtant : Les lys orientaux diffusent un parfum riche et agréablement sucré qui parfume chaque pièce, transformant l\'atmosphère avec une fragrance subtile et mémorable.\r\n\r\nPrésentation impressionnante : Les lys sont arrangés de manière à maximiser leur impact visuel, montrant la beauté naturelle et élégante de chaque fleur. Le bouquet est soigneusement emballé pour assurer sa beauté et sa fraîcheur lors de la livraison.\r\n\r\nCadeau universellement admiré : Offrir un bouquet de lys est un choix élégant pour de nombreuses occasions. C\'est un moyen sûr de transmettre respect, admiration, ou affection, avec une touche de grandeur.\r\n\r\nPrêt à charmer : Livré dans un emballage chic, ce bouquet est prêt à être placé dans un vase dès son arrivée, idéal pour un effet immédiat. Chaque tige est préparée pour assurer une longévité maximale, permettant au destinataire de profiter pleinement de la beauté des fleurs.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 3),
(31, 'Bouquet de saison', 'Bouquet Harmonie Saisonnière : Une Célébration des Couleurs du Moment\r\n\r\nÉclat saisonnier : Embrassez le rythme de la nature avec notre bouquet de saison, soigneusement composé des meilleures fleurs disponibles selon le moment de l\'année. Parfait pour apporter une touche de fraîcheur et de nouveauté à votre intérieur ou pour offrir en cadeau lors de n\'importe quelle occasion.\r\n\r\nVariété naturelle : Ce bouquet tire parti de la diversité florale de chaque saison, incorporant des fleurs comme des tulipes et des jonquilles au printemps, des roses et des pivoines en été, des chrysanthèmes et des asters en automne, ou des amaryllis et des anémones en hiver.\r\n\r\nPalette de couleurs dynamique : Les teintes du bouquet changent avec les saisons, reflétant les couleurs naturelles du monde extérieur. Des couleurs vives et chaudes aux tons doux et apaisants, chaque bouquet est une œuvre d\'art reflétant le meilleur de la période en cours.\r\n\r\nFraîcheur garantie : Chaque fleur est choisie pour sa fraîcheur et sa longévité, assurant que le bouquet reste beau et vibrant longtemps après sa livraison. C\'est l\'engagement parfait pour ceux qui apprécient la qualité et la durabilité.\r\n\r\nCadeau polyvalent : Les bouquets de saison sont des cadeaux idéaux pour des anniversaires, des remerciements, des félicitations ou simplement pour égayer le quotidien. Ils sont aussi un excellent moyen de célébrer les changements de saisons et de renouveler la décoration de votre maison.\r\n\r\nPrésentation soignée : Présenté dans un emballage élégant, chaque bouquet est prêt à captiver et à charmer dès son déballage, faisant de lui un cadeau idéal pour toute occasion.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 3),
(32, 'Bouquet sec', 'Bouquet Éternel : La Beauté Intemporelle des Fleurs Séchées\r\n\r\nCharme durable : Notre bouquet de fleurs séchées capture l\'essence de la beauté éternelle. Parfait pour ceux qui cherchent à décorer leur espace avec une touche de nature qui dure toute l\'année, sans nécessiter d\'entretien.\r\n\r\nVariété captivante : Composé de fleurs soigneusement sélectionnées pour leur capacité à conserver leur couleur et leur forme une fois séchées, ce bouquet inclut des lavandes parfumées, des graminées rustiques, des hortensias délicats et d\'autres fleurs de saison qui offrent une texture et un caractère uniques.\r\n\r\nPalette naturelle : Les tons doux et les textures des fleurs séchées apportent une touche de douceur et un charme vintage à votre intérieur. Des teintes naturelles aux couleurs pastel, chaque bouquet est une œuvre d\'art durable.\r\n\r\nEntretien minimal : Les bouquets de fleurs séchées sont l\'alternative parfaite pour ceux qui apprécient les plantes mais préfèrent éviter l\'entretien quotidien. Ils ne nécessitent ni eau ni lumière spéciale, juste un emplacement à l\'abri de l\'humidité directe et du soleil intense.\r\n\r\nCadeau idéal : Un bouquet de fleurs séchées est un cadeau pensé et durable, parfait pour les anniversaires, les crémaillères ou comme expression de gratitude. C\'est aussi une excellente option pour les mariages, comme souvenir mémorable de la journée spéciale.\r\n\r\nPrésentation élégante : Livré dans un emballage soigné, chaque bouquet est prêt à être placé dans un vase ou affiché tel quel, ajoutant une élégance naturelle et une présence artistique à tout espace.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 3),
(33, 'Vase boule', 'Vase Boule en Verre : Simplicité Élégante et Contemporaine\r\n\r\nDesign minimaliste : Notre vase boule en verre, avec sa forme ronde et épurée, est un exemple parfait de simplicité moderne. Il s\'intègre harmonieusement dans n\'importe quel décor, apportant une touche de légèreté et de transparence.\r\n\r\nPolyvalence décorative : Idéal pour mettre en valeur des fleurs coupées, des bouquets ou même des compositions de plantes aquatiques, ce vase est également magnifique lorsqu\'il est laissé vide, jouant avec la lumière et les reflets pour captiver le regard.\r\n\r\nMatériaux de qualité : Fabriqué en verre de haute qualité, ce vase est durable et résistant. Sa surface lisse et claire met en valeur le contenu, que ce soit des pétales colorés, des pierres décoratives ou des perles d\'eau.\r\n\r\nTaille optimale : Sa dimension est parfaitement conçue pour s\'adapter à une variété de placements, des tables d\'appoint aux étagères, en passant par les centres de table. Il est suffisamment compact pour ne pas encombrer l\'espace, tout en ayant une présence visuelle forte.\r\n\r\nCadeau universel : Ce vase boule en verre est un cadeau élégant pour les amateurs de design d\'intérieur, les horticulteurs en herbe, ou toute personne souhaitant ajouter une touche de sophistication à son environnement.\r\n\r\nEntretien facile : L\'entretien de ce vase est simple, nécessitant seulement un nettoyage occasionnel avec de l\'eau savonneuse pour maintenir sa brillance et sa clarté.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 4),
(34, 'Vase cylindrique', 'Vase Cylindrique en Verre : Élégance Linéaire et Transparente\r\n\r\nDesign contemporain : Avec sa forme cylindrique élancée et son verre transparent, ce vase est un classique revisité qui apporte une touche de modernité à tout intérieur. Son design épuré met en valeur les tiges et les couleurs des fleurs, permettant une présentation spectaculaire de bouquets simples ou élaborés.\r\n\r\nPolyvalence fonctionnelle : Ce vase est idéal pour une grande variété d\'arrangements floraux, des tiges longues et droites aux bouquets volumineux. Il peut également servir à créer des décorations aquatiques ou être rempli de pierres décoratives ou de sable pour un effet plus zen.\r\n\r\nVerre de haute qualité : Fabriqué dans un verre transparent de haute qualité, ce vase résiste aux égratignures et aux chocs, garantissant durabilité et une clarté parfaite au fil du temps. Sa base solide assure une bonne stabilité, même avec des arrangements floraux plus lourds.\r\n\r\nAdaptable à tout décor : Le style minimaliste et la transparence du vase permettent de l\'intégrer facilement dans divers environnements, qu\'ils soient classiques, contemporains, ou rustiques. Il magnifie n\'importe quel espace, du salon à la salle à manger en passant par les bureaux.\r\n\r\nCadeau idéal : Un vase cylindrique en verre est un choix de cadeau sophistiqué pour les mariages, les pendaisons de crémaillère ou tout simplement pour les passionnés de décoration intérieure.\r\n\r\nEntretien simplifié : Ce vase est facile à nettoyer – un rinçage à l\'eau chaude savonneuse suffit pour le maintenir éclatant.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 4);
INSERT INTO `product` (`id_product`, `name`, `description`, `promotional_price`, `promotion`, `currency`, `stock`, `id_category`) VALUES
(35, 'Vase carré', 'Vase Carré en Verre : Modernité et Structure\r\n\r\nDesign géométrique distinctif : Notre vase carré en verre est l\'incarnation de la simplicité structurée. Avec ses lignes nettes et sa forme carrée, ce vase apporte une touche de modernité épurée à tout décor, se démarquant des formes traditionnelles par son audace et sa précision.\r\n\r\nPolyvalence décorative : Idéal pour des compositions florales compactes, comme des roses coupées courtes ou des fleurs à tige robuste, ce vase est également parfait pour des arrangements de plantes succulentes ou des créations de sable coloré. Sa forme ouverte et sa transparence en font une toile de fond idéale pour mettre en valeur vos idées décoratives.\r\n\r\nMatériaux de qualité : Fabriqué à partir de verre épais et durable, ce vase résiste aux chocs du quotidien tout en maintenant une clarté impeccable qui rehausse la beauté des objets qu\'il contient.\r\n\r\nAdaptabilité : Ce vase s\'intègre harmonieusement dans diverses configurations, des intérieurs minimalistes et contemporains aux bureaux plus classiques. Il est également une addition attrayante pour les bars ou les tables de réception, apportant une élégance discrète mais impactante.\r\n\r\nCadeau parfait : Un vase carré en verre est un choix de cadeau sophistiqué et moderne, idéal pour les amateurs de design intérieur ou pour ceux qui cherchent à ajouter un élément décoratif unique à leur espace.\r\n\r\nEntretien facile : Nettoyez simplement ce vase avec de l\'eau chaude savonneuse pour le garder éclatant et prêt à accueillir de nouvelles compositions florales ou décoratives.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 4),
(36, 'Cache pot en terre', 'Cache-pot en Terre Cuite : Naturellement Élégant\r\n\r\nCharme rustique : Embrassez la beauté naturelle et intemporelle du cache-pot en terre cuite. Avec sa couleur chaude et sa texture terreuse, ce cache-pot apporte une touche de simplicité rustique à votre espace de vie ou votre jardin.\r\n\r\nMatériau écologique : Fabriqué à partir de terre cuite naturelle, ce cache-pot est non seulement beau mais également écologique. La terre cuite est connue pour sa capacité à respirer, offrant un environnement sain pour les racines des plantes en régulant l\'humidité du sol.\r\n\r\nDurabilité : Résistant et conçu pour durer, ce cache-pot en terre cuite peut supporter les éléments, que ce soit à l\'intérieur ou à l\'extérieur. Sa robustesse assure une longue durée de vie même sous les climats les plus rudes.\r\n\r\nPolyvalence : Parfait pour accueillir une variété de plantes, des herbes aromatiques ou aux petits arbustes. Sa conception simple mais élégante le rend adaptable à tout style de décoration, du traditionnel au moderne.\r\n\r\nIdéal pour les jardiniers : Ce cache-pot est un choix idéal pour les jardiniers qui apprécient la qualité et la fonctionnalité. Il est particulièrement adapté pour les plantes qui préfèrent les sols bien drainés.\r\n\r\nFacile à entretenir : La terre cuite est facile à nettoyer et à entretenir. Un rinçage occasionnel à l\'eau suffit pour enlever la poussière ou la saleté, maintenant l\'aspect esthétique du pot.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 4),
(37, 'Cache pot en métal', 'Cache-pot en Métal : Style Industriel et Modernité\r\n\r\nÉlégance moderne : Ajoutez une touche de modernité à votre espace avec notre cache-pot en métal. Son design épuré et ses finitions brillantes ou mates, selon le modèle, en font une pièce décorative contemporaine qui s\'intègre parfaitement dans des environnements urbains ou des décors minimalistes.\r\n\r\nRobuste et durable : Construit en métal de haute qualité, ce cache-pot est conçu pour résister à l\'épreuve du temps. Il est parfait pour les espaces intérieurs comme les bureaux ou les maisons, mais également adapté pour les balcons ou les patios grâce à sa résistance aux intempéries.\r\n\r\nPolyvalence décorative : Disponible en plusieurs tailles et couleurs, ce cache-pot peut être utilisé pour une variété de plantes, des petites succulentes aux grands palmiers. Sa forme et sa construction permettent une utilisation flexible, que ce soit sur le sol, une table ou une étagère.\r\n\r\nEntretien minimal : Le métal est un matériau qui nécessite peu d\'entretien. Un simple essuyage avec un chiffon humide suffit pour enlever la poussière ou les traces, gardant votre cache-pot impeccable toute l\'année.\r\n\r\nIdéal pour le design intérieur : Ce cache-pot est un choix populaire pour les designers d\'intérieur cherchant à créer un point focal fort dans leurs projets. Il peut également servir à délimiter des espaces dans les grandes pièces ou sur les terrasses.\r\n\r\nProtection des surfaces : Chaque cache-pot est équipé de patins protecteurs pour éviter les rayures sur les surfaces délicates, garantissant que votre mobilier reste intact.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 4),
(38, 'Cache pot en céramique', 'Pot en Céramique : Élégance Artisanale et Charme Intemporel\r\n\r\nArtisanat raffiné : Ajoutez une touche d\'artisanat à votre espace avec notre pot en céramique. Fabriqué avec soin par des artisans expérimentés, chaque pot est unique, présentant des variations subtiles de couleur et de texture qui ajoutent à son caractère charmant.\r\n\r\nEsthétique intemporelle : La beauté classique de la céramique en fait un choix élégant pour tout décor, du traditionnel au moderne. Son allure intemporelle en fait un accent décoratif qui ne se démodera jamais.\r\n\r\nPolyvalence décorative : Disponible dans une variété de tailles, formes et finitions, ce pot en céramique peut accueillir une large gamme de plantes, des petites herbes aromatiques aux grands arbustes. Sa surface lisse et neutre met en valeur la beauté naturelle des plantes qu\'il contient.\r\n\r\nSolidité et durabilité : Fabriqué à partir de céramique de qualité, ce pot est à la fois solide et durable, résistant aux rayures, aux éclats et à la décoloration. Il est conçu pour durer de nombreuses saisons, à l\'intérieur comme à l\'extérieur.\r\n\r\nEntretien simple : Nettoyer ce pot en céramique est un jeu d\'enfant. Un simple rinçage à l\'eau tiède et un essuyage avec un chiffon doux suffisent pour le garder propre et éclatant.\r\n\r\nIdéal pour offrir : Ce pot en céramique est un cadeau parfait pour les amateurs de jardinage ou les passionnés de décoration intérieure. Son élégance intemporelle en fait un présent apprécié pour toutes les occasions.\r\n\r\n- Taille petite\r\n\r\n- Taille moyenne\r\n\r\n- Taille grande', NULL, 0, '€', 10, 4),
(39, 'Vaporisateur', ' Vaporisateur pour Plantes : Soins Doux et Précis\r\n\r\nArrosez avec style : Notre vaporisateur pour plantes est l\'accessoire parfait pour prendre soin de vos plantes avec précision et élégance. Sa conception élégante et ergonomique en fait un outil pratique et esthétique à la fois.\r\n\r\nBrouillard fin et uniforme : Doté d\'une pompe de haute qualité, ce vaporisateur produit un brouillard fin et uniforme qui permet d\'hydrater délicatement vos plantes sans les mouiller excessivement. Il est idéal pour les plantes d\'intérieur comme les orchidées, les fougères ou les plantes succulentes.\r\n\r\nPolyvalent et pratique : Ce vaporisateur peut être utilisé pour humidifier l\'air autour de vos plantes, nettoyer leurs feuilles et les protéger des parasites et des maladies. Il convient également pour l\'application de fertilisants foliaires ou d\'autres produits de soin.\r\n\r\nMatériaux de qualité : Fabriqué à partir de plastique résistant et durable, ce vaporisateur est conçu pour durer. Sa bouteille transparente vous permet de voir facilement le niveau d\'eau restant, vous évitant ainsi les surprises pendant l\'arrosage.\r\n\r\nFacile à utiliser : La gâchette de pulvérisation ergonomique et facile à presser permet un arrosage précis et confortable, même pendant de longues sessions d\'entretien des plantes. Il suffit de remplir le réservoir avec de l\'eau propre et d\'appuyer sur la gâchette pour vaporiser.\r\n\r\nCompact et portable : Avec sa taille compacte, ce vaporisateur est facile à ranger et à transporter. Que ce soit dans votre jardin, sur votre balcon ou à l\'intérieur de votre maison, vous pouvez l\'emporter partout où vos plantes ont besoin de soins.\r\n\r\n- Taille unique', NULL, 0, '€', 10, 4),
(40, 'Terreau 5L', 'Sac de Terreau Universel 5L : La Base de la Croissance Végétale\r\n\r\nQualité supérieure : Notre sac de terreau universel de 5 litres est la solution idéale pour nourrir vos plantes et favoriser leur croissance. Fabriqué à partir d\'ingrédients de qualité supérieure, ce terreau offre une structure légère et aérée qui permet aux racines de se développer sainement.\r\n\r\nNutrition équilibrée : Enrichi en nutriments essentiels, ce terreau fournit à vos plantes les éléments nécessaires pour un développement vigoureux. Sa composition équilibrée favorise une croissance saine des racines et une floraison abondante.\r\n\r\nPolyvalent et adapté à tous types de plantes : Que ce soit pour vos plantes d\'intérieur, de balcon ou de jardin, ce terreau universel convient à une grande variété de plantes, fleurs, herbes aromatiques et légumes. Sa formulation polyvalente en fait un choix parfait pour tous vos projets de jardinage.\r\n\r\nFacile à utiliser : Le sac de 5 litres est pratique à manipuler et à stocker. Son format compact en fait un choix idéal pour les petits espaces de jardinage ou pour recharger des pots et des jardinières.\r\n\r\nProtection des plantes : Ce terreau est conçu pour assurer une bonne rétention d\'eau tout en permettant un drainage efficace, évitant ainsi les risques de pourrissement des racines. Il crée un environnement propice à la croissance des plantes tout en réduisant le besoin d\'arrosage fréquent.\r\n\r\nÉcologique et respectueux de l\'environnement : Notre terreau est fabriqué à partir de matières premières durables et renouvelables, ce qui en fait un choix respectueux de l\'environnement pour votre jardinage.\r\n\r\n- Taille unique', NULL, 0, '€', 10, 4),
(41, 'Bille d\'argile 2L', 'Sac de Billes d\'Argile 2L : Drainage et Aération Optimaux\r\n\r\nSolution de drainage efficace : Notre sac de billes d\'argile de 2 litres offre une solution idéale pour améliorer le drainage et l\'aération du substrat de vos plantes. Fabriquées à partir d\'argile naturelle de haute qualité, ces billes permettent un écoulement rapide de l\'eau, prévenant ainsi la stagnation et la pourriture des racines.\r\n\r\nAmélioration du sol : En mélangeant ces billes d\'argile à votre terreau, vous améliorez la structure du sol en le rendant plus léger et plus aéré. Cela favorise le développement sain des racines en fournissant un meilleur accès à l\'oxygène, aux nutriments et à l\'eau.\r\n\r\nPolyvalence d\'utilisation : Ces billes d\'argile sont polyvalentes et peuvent être utilisées dans une variété d\'applications de jardinage. Elles sont idéales pour les pots, les jardinières, les terrariums, les arrangements floraux et bien plus encore.\r\n\r\nRéutilisables et durables : Les billes d\'argile sont un matériau durable qui peut être réutilisé plusieurs fois. Après utilisation, il suffit de les rincer à l\'eau pour les nettoyer et les stériliser avant de les réutiliser dans de nouveaux projets de jardinage.\r\n\r\nÉcologique et respectueux de l\'environnement : Fabriquées à partir d\'argile naturelle, ces billes sont respectueuses de l\'environnement et ne contiennent aucun produit chimique nocif. Elles contribuent à créer un environnement de culture sain et durable pour vos plantes.\r\n\r\nFormat pratique : Le sac de 2 litres est facile à manipuler et à stocker. Sa taille compacte le rend parfait pour les petits projets de jardinage ou pour compléter vos fournitures de jardinage existantes.\r\n\r\n- Taille unique', NULL, 0, '€', 10, 4),
(42, 'Jardinière', 'Jardinière Métallique : Élégance Industrielle pour Vos Plantes\r\n\r\nStyle industriel moderne : Ajoutez une touche de caractère et de sophistication à votre espace de vie avec notre jardinière métallique. Son design industriel moderne en fait un accent décoratif saisissant qui se démarque dans n\'importe quel environnement.\r\n\r\nMatériau robuste et durable : Fabriquée en métal de haute qualité, cette jardinière est conçue pour résister aux intempéries et aux éléments extérieurs. Sa construction solide garantit une durabilité à long terme, vous permettant de profiter de votre jardinière pendant de nombreuses saisons à venir.\r\n\r\nPolyvalence fonctionnelle : Cette jardinière métallique peut accueillir une variété de plantes, de fleurs et d\'herbes, ajoutant une touche de verdure à votre balcon, votre terrasse, votre jardin ou même votre intérieur. Sa taille généreuse offre suffisamment d\'espace pour permettre à vos plantes de s\'épanouir pleinement.\r\n\r\nDesign ergonomique : Dotée de lignes épurées et d\'une finition élégante, cette jardinière métallique complète parfaitement tout style de décoration, qu\'il soit moderne, industriel ou rustique. Son design ergonomique facilite également le drainage et l\'entretien de vos plantes.\r\n\r\nFacile à installer : Livrée avec des trous pré-percés pour le drainage, cette jardinière métallique est facile à installer et à utiliser. Il vous suffit de choisir l\'endroit idéal pour l\'exposer, de remplir la jardinière avec de la terre et de planter vos plantes préférées.\r\n\r\nCadeau idéal : Que ce soit pour un passionné de jardinage ou un amateur de décoration, cette jardinière métallique est un cadeau parfait pour toutes les occasions, des anniversaires aux pendaisons de crémaillère.\r\n\r\n- Taille unique', NULL, 0, '€', 10, 4);

-- --------------------------------------------------------

--
-- Structure de la table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`) VALUES
(1, 1, '/images/ficus1.avif'),
(2, 1, '/images/ficus2.avif'),
(3, 1, '/images/ficus3.avif'),
(4, 1, '/images/ficus4.avif'),
(5, 2, '/images/dracaena2.jpg'),
(6, 2, '/images/dracaena3.webp'),
(7, 3, '/images/monstera1.avif'),
(8, 3, '/images/monstera2.avif'),
(9, 3, '/images/monstera3.avif'),
(10, 4, '/images/calathea1.avif'),
(11, 4, '/images/calathea2.avif'),
(12, 4, '/images/calathea3.avif'),
(13, 5, '/images/kentia1.avif'),
(14, 5, '/images/kentia2.avif'),
(15, 5, '/images/kentia3.avif'),
(16, 5, '/images/kentia4.avif'),
(17, 6, '/images/pachira1.avif'),
(18, 6, '/images/pachira2.avif'),
(19, 6, '/images/pachira3.avif'),
(20, 7, '/images/areca1.avif'),
(21, 7, '/images/areca2.avif'),
(22, 7, '/images/areca3.avif'),
(23, 8, '/images/aralia1.avif'),
(24, 8, '/images/aralia2.avif'),
(25, 8, '/images/aralia3.avif'),
(26, 9, '/images/cactus1.avif'),
(27, 9, '/images/cactus2.avif'),
(28, 9, '/images/cactus3.avif'),
(29, 10, '/images/phalaenopsis1.avif'),
(30, 10, '/images/phalaenopsis2.avif'),
(31, 11, '/images/dendrobium1.avif'),
(32, 11, '/images/dendrobium2.avif'),
(33, 12, '/images/anthurium1.avif'),
(34, 12, '/images/anthurium2.avif'),
(35, 12, '/images/anthurium3.avif'),
(36, 13, '/images/rosier1.avif'),
(37, 13, '/images/rosier2.avif'),
(38, 13, '/images/rosier3.avif'),
(39, 13, '/images/rosier4.avif'),
(40, 14, '/images/strelitzia1.avif'),
(41, 14, '/images/strelitzia2.avif'),
(42, 14, '/images/strelitzia3.avif'),
(43, 15, '/images/hortensia1.avif'),
(44, 15, '/images/hortensia2.avif'),
(45, 15, '/images/hortensia3.avif'),
(46, 15, '/images/hortensia4.avif'),
(47, 16, '/images/hibiscus1.avif'),
(48, 16, '/images/hibiscus2.avif'),
(49, 16, '/images/hibiscus3.avif'),
(50, 17, '/images/olivier1.avif'),
(51, 17, '/images/olivier2.avif'),
(52, 17, '/images/olivier3.avif'),
(53, 18, '/images/erable1.avif'),
(54, 18, '/images/erable2.avif'),
(55, 18, '/images/erable3.avif'),
(56, 18, '/images/erable4.avif'),
(57, 19, '/images/laurier1.avif'),
(58, 19, '/images/laurier2.avif'),
(59, 19, '/images/laurier3.avif'),
(60, 19, '/images/laurier4.avif'),
(61, 19, '/images/laurier5.avif'),
(62, 20, '/images/bougainvillier1.avif'),
(63, 20, '/images/bougainvillier2.avif'),
(64, 20, '/images/bougainvillier3.avif'),
(65, 21, '/images/bqtblanc1.avif'),
(66, 21, '/images/bqtblanc2.avif'),
(67, 21, '/images/bqtblanc3.avif'),
(68, 22, '/images/bqtrose1.avif'),
(69, 22, '/images/bqtrose2.avif'),
(70, 23, '/images/bqtjaune1.jpg'),
(71, 23, '/images/bqtjaune2.jpg'),
(72, 23, '/images/bqtjaune3.jpg'),
(73, 24, '/images/bqtorange1.webp'),
(74, 24, '/images/bqtorange2.webp'),
(75, 24, '/images/bqtorange3.webp'),
(76, 25, '/images/bqtrouge1.avif'),
(77, 25, '/images/bqtrouge2.avif'),
(78, 25, '/images/bqtrouge3.avif'),
(79, 26, '/images/bqtviolet1.avif'),
(80, 26, '/images/bqtviolet2.avif'),
(81, 26, '/images/bqtviolet3.avif'),
(82, 26, '/images/bqtviolet4.avif'),
(83, 27, '/images/bqtmulti1.avif'),
(84, 27, '/images/bqtmulti2.avif'),
(85, 27, '/images/bqtmulti3.avif'),
(86, 28, '/images/bqtderoses1.avif'),
(87, 28, '/images/bqtderoses2.avif'),
(88, 28, '/images/bqtderoses3.avif'),
(89, 29, '/images/bqtpivoine1.avif'),
(90, 29, '/images/bqtpivoine2.avif'),
(91, 29, '/images/bqtpivoine3.avif'),
(92, 30, '/images/bqtlys1.avif'),
(93, 30, '/images/bqtlys2.avif'),
(94, 30, '/images/bqtlys3.avif'),
(95, 31, '/images/bqtsaison1.avif'),
(96, 31, '/images/bqtsaison2.avif'),
(97, 31, '/images/bqtsaison3.avif'),
(98, 32, '/images/bqtsec1.webp'),
(99, 32, '/images/bqtsec2.webp'),
(100, 32, '/images/bqtsec3.webp'),
(101, 2, '/images/dracaena1.webp'),
(102, 33, '/images/vaseboule1.jpg'),
(103, 33, '/images/vaseboule2.jpg'),
(104, 33, '/images/vaseboule3.jpg'),
(105, 34, '/images/vasecylindre1.jpg'),
(106, 34, '/images/vasecylindre2.jpg'),
(107, 35, '/images/vasecarre1.webp\r\n'),
(108, 35, '/images/vasecarre2.webp'),
(109, 36, '/images/porterre1.webp'),
(110, 36, '/images/porterre2.webp'),
(111, 37, '/images/potmetal1.jpg'),
(112, 37, '/images/potmetal2.jpg'),
(113, 37, '/images/potmetal3.jpg'),
(114, 38, '/images/potceram1.webp'),
(115, 38, '/images/potceram2.webp'),
(116, 38, '/images/potceram3.webp'),
(117, 39, '/images/vapo1.webp'),
(118, 39, '/images/vapo2.webp'),
(119, 40, '/images/terre1.avif'),
(120, 40, '/images/terre2.avif'),
(121, 40, '/images/terre3.avif'),
(122, 41, '/images/argile1.avif'),
(123, 42, '/images/jardiniere1.jpg'),
(124, 42, '/images/jardiniere2.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `size`
--

DROP TABLE IF EXISTS `size`;
CREATE TABLE IF NOT EXISTS `size` (
  `id_size` int NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  PRIMARY KEY (`id_size`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `size`
--

INSERT INTO `size` (`id_size`, `label`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`) VALUES
(1, 'johan', '$2a$10$yOdWyf3OaHsrt5QKJV93wO.AxVD/Hf.cXL1DI7sYwNphN.JzmCxOq', 'johan.tichit@ynov.com', 'user'),
(2, 'admin', '$2b$10$mFNRKfsIYfxXHdiHRo5bCu2JaBfSCntSfI/b2xYg2c/6YvInOi1/u', 'admin@example.com', 'admin');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
