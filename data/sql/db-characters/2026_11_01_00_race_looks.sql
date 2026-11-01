-- mod-custom-races: the looks of CoA Custom's x64 client (CoA Custom 1.9.3 and newer): the Retail customization, the
-- second form of a Worgen or Dracthyr (Two Forms) and the body sliders, one row per character. Safe to run more than once.
CREATE TABLE IF NOT EXISTS `character_body_shape` (`guid` int unsigned NOT NULL, `data` binary(49) NOT NULL, PRIMARY KEY (`guid`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS `character_retail_look` (`guid` int unsigned NOT NULL, `data` binary(132) NOT NULL, PRIMARY KEY (`guid`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS `character_form_look` (`guid` int unsigned NOT NULL, `data` binary(132) NOT NULL, PRIMARY KEY (`guid`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Dracthyr: Chosen Identity is gone (Visage switches between the two saved forms); Worgen: Two Forms (110690)
DELETE FROM `character_spell` WHERE `spell` = 110687;
INSERT IGNORE INTO `character_spell` (`guid`, `spell`, `specMask`) SELECT `guid`, 110690, 255 FROM `characters` WHERE `race` = 13;
