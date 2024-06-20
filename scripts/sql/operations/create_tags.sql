/** Content specification tags */
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (1, 'type-collection', 'Collection');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (2, 'type-summaries', 'Summaries');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (3, 'content-originals', 'Originals');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (4, 'content-wikipedia', 'Wikipedia');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (5, 'access-free', 'Free');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (6, 'access-premium', 'Premium');

INSERT IGNORE INTO `tag` (id, slug, name) VALUES (20, 'lang-nolang', 'No language');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (21, 'lang-fr', 'French');

/** Theme and subtheme metatag */
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (7, 'theme', 'Theme');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (8, 'subtheme', 'Subtheme');

/** Theme tags **/
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (100, 'theme-history', 'History');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (101, 'theme-myths-and-legends', 'Myths and legends');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (102, 'theme-sciences', 'Sciences');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (103, 'theme-culture', 'Culture');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (104, 'theme-social-sciences', 'Social sciences');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (105, 'theme-beyond', 'Beyond');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (106, 'theme-kids-originals', 'Kids originals');

/** Tag themes with theme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (100, 'tag', 7);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (101, 'tag', 7);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (102, 'tag', 7);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (103, 'tag', 7);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (104, 'tag', 7);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (105, 'tag', 7);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (106, 'tag', 7);

/** History subtheme tags **/
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (200, 'subtheme-france-history', 'Histoire de France');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (201, 'subtheme-ancient-civilisations', 'Ancient civilisations');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (202, 'subtheme-greatest-discoveries', 'Greatest discoveries');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (203, 'subtheme-america', 'America');

/** Tag subthemes with subtheme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (200, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (201, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (202, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (203, 'tag', 8);

/** Tag subthemes with parent theme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (200, 'tag', 100);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (201, 'tag', 100);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (202, 'tag', 100);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (203, 'tag', 100);

/** Myths and legends subtheme tags **/
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (204, 'subtheme-ancient-egypt', 'Ancient Egypt');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (205, 'subtheme-northern-myths', 'Northern myths');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (206, 'subtheme-greek-myths', 'Greek myths');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (207, 'subtheme-myths-kinds', 'Myths kinds');

/** Tag subthemes with subtheme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (204, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (205, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (206, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (207, 'tag', 8);

/** Tag subthemes with parent theme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (204, 'tag', 101);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (205, 'tag', 101);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (206, 'tag', 101);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (207, 'tag', 101);

/** Science subtheme tags **/
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (208, 'subtheme-astronomy', 'Astronomy');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (209, 'subtheme-dinosaures', 'Dinosaures without typo');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (210, 'subtheme-chemestry', 'Chemestry');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (211, 'subtheme-medecine', 'Medecine');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (212, 'subtheme-science-women', 'Science women');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (213, 'subtheme-botanical', 'Botanical');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (214, 'subtheme-nobel-prizes-and-greatest-scientists', 'Nobel prizes and greatest scientists');

/** Tag subthemes with subtheme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (208, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (209, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (210, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (211, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (212, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (213, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (214, 'tag', 8);

/** Tag subthemes with parent theme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (208, 'tag', 102);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (209, 'tag', 102);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (210, 'tag', 102);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (211, 'tag', 102);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (212, 'tag', 102);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (213, 'tag', 102);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (214, 'tag', 102);

/** Social sciences subtheme tags **/
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (215, 'subtheme-over-the-couch', 'Over the couch (sounds dirty to me)');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (216, 'subtheme-psychoanalysis-history', 'Psychoanalysis history');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (217, 'subtheme-sociology-history', 'Sociology history');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (218, 'subtheme-psycology-history', 'Psycology history');

/** Tag subthemes with subtheme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (215, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (216, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (217, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (218, 'tag', 8);

/** Tag subthemes with parent theme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (215, 'tag', 103);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (216, 'tag', 103);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (217, 'tag', 103);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (218, 'tag', 103);

/** Culture subtheme tags **/
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (219, 'subtheme-cinema', 'Cinema');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (220, 'subtheme-monsters', 'Monsters');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (221, 'subtheme-music', 'Music');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (222, 'subtheme-seven-wonders', 'Seven wonders');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (223, 'subtheme-dance', 'Dance');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (224, 'subtheme-artistic-currents', 'Artistic currents');

/** Tag subthemes with subtheme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (219, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (220, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (221, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (222, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (223, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (224, 'tag', 8);

/** Tag subthemes with parent theme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (219, 'tag', 104);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (220, 'tag', 104);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (221, 'tag', 104);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (222, 'tag', 104);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (223, 'tag', 104);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (224, 'tag', 104);

/** Beyond subtheme tags **/
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (225, 'subtheme-politic', 'Politic');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (226, 'subtheme-poetries', 'Poetries');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (227, 'subtheme-philosophy','Philosophy');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (228, 'subtheme-law', 'Law');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (229, 'subtheme-wine', 'Wine');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (230, 'subtheme-tales', 'Tales');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (231, 'subtheme-fables', 'Fables');

/** Tag subthemes with subtheme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (225, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (226, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (227, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (228, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (229, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (230, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (231, 'tag', 8);

/** Tag subthemes with parent theme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (225, 'tag', 105);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (226, 'tag', 105);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (227, 'tag', 105);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (228, 'tag', 105);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (229, 'tag', 105);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (230, 'tag', 105);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (231, 'tag', 105);

/** Kids subtheme tags **/
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (232, 'subtheme-age-0-3', 'Age 0-3');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (233, 'subtheme-age-0-6', 'Age 0-6');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (234, 'subtheme-age-6-8', 'Age 6-8');
INSERT IGNORE INTO `tag` (id, slug, name) VALUES (235, 'subtheme-age-8-plus', 'Age 8+');

/** Tag subthemes with subtheme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (232, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (233, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (234, 'tag', 8);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (235, 'tag', 8);

/** Tag subthemes with parent theme tag **/
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (232, 'tag', 106);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (233, 'tag', 106);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (234, 'tag', 106);
INSERT IGNORE INTO `item_tag` (item_id, item_type, tag_id) VALUES (235, 'tag', 106);