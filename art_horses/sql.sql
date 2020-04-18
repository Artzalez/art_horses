SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
SET time_zone = "+00:00";

CREATE TABLE `complementos_caballo` (
  `id` int(11) NOT NULL,
  `steamid` varchar(45) NOT NULL,
  `charid` tinyint(2) NOT NULL,
  `nombre_complemento` varchar(50) NOT NULL,
  `tipo` int(1) NOT NULL,
  `hash` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE `complementos_caballo`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `complementos_caballo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

CREATE TABLE `stables` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `charid` int(11) DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT 'Horse',
  `vehicles` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(11) COLLATE utf8mb4_bin DEFAULT NULL,
  `bondxp` int(11) DEFAULT 0,
  `stabled` tinyint(1) DEFAULT 1,
  `healthy` tinyint(1) DEFAULT 1,
  `default` tinyint(1) DEFAULT 0,
  `saddle` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `blanket` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `mane` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `tail` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `bag` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `bedroll` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `stirups` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

ALTER TABLE `stables`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `stables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;