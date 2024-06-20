create table author
(
    id         integer primary key autoincrement,
    name       varchar(255)                       not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime default CURRENT_TIMESTAMP not null
);

create table credit
(
    id          integer primary key autoincrement,
    name        varchar(255)                       not null,
    credit_type varchar(45)                        null,
    provider    varchar(255)                       null,
    created_at  datetime default CURRENT_TIMESTAMP not null,
    updated_at  datetime default CURRENT_TIMESTAMP not null
);

create table item_user_favorite
(
    id         integer primary key autoincrement,
    user_id    integer                    not null,
    item_id    integer                    not null,
    item_type  varchar CHECK (item_type IN ('content', 'collection'))     not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime default CURRENT_TIMESTAMP not null,
    constraint uq_item_id_item_type_user_id_idx
        unique (item_id, item_type, user_id)
);

create table media
(
    id         integer primary key autoincrement,
    mime_type  varchar(45)                        not null,
    path       varchar(1024)                      not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime default CURRENT_TIMESTAMP not null
);

create table collection
(
    id          integer primary key autoincrement,
    slug        varchar(255)                               unique not null,
    name        varchar(255)                               not null,
    description text                                       null,
    mode        varchar CHECK (mode IN ('program', 'snacking'))           not null,
    cover_id    integer                            not null,
    published   tinyint unsigned default '1'               not null,
    created_at  datetime         default CURRENT_TIMESTAMP not null,
    updated_at  datetime         default CURRENT_TIMESTAMP not null,
    constraint uq_slug_idx
        unique (slug),
    constraint fk_collection_cover_id
        foreign key (cover_id) references media (id)
);

create index fk_collection_cover_id_idx
    on collection (cover_id);

create table content
(
    id                integer primary key autoincrement,
    name              varchar(255)                               not null,
    short_description varchar(64)                                not null,
    long_description  text                                       not null,
    duration          int unsigned                               not null,
    cover_id          integer                            not null,
    published         tinyint unsigned default '1'               not null,
    created_at        datetime         default CURRENT_TIMESTAMP not null,
    updated_at        datetime         default CURRENT_TIMESTAMP not null,
    constraint fk_content_cover_id
        foreign key (cover_id) references media (id)
);

create table collection_content
(
    id            integer primary key autoincrement,
    collection_id integer                    not null,
    content_id    integer                    not null,
    `order`       int                                not null,
    created_at    datetime default CURRENT_TIMESTAMP not null,
    updated_at    datetime default CURRENT_TIMESTAMP not null,
    constraint uq_collection_id_content_id_idx
        unique (collection_id, content_id),
    constraint fk_collection_content_collection_id
        foreign key (collection_id) references collection (id),
    constraint fk_collection_content_content_id
        foreign key (content_id) references content (id)
);

create index collection_id_order_idx
    on collection_content (collection_id, `order`);

create index fk_collection_content_content_id_idx
    on collection_content (content_id);

create index fk_content_cover_id_idx
    on content (cover_id);

create table content_author
(
    id         integer primary key autoincrement,
    content_id integer                    not null,
    author_id  integer                    not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime default CURRENT_TIMESTAMP not null,
    constraint uq_content_id_author_id_idx
        unique (content_id, author_id),
    constraint fk_content_author_author_id
        foreign key (author_id) references author (id),
    constraint fk_content_author_content_id
        foreign key (content_id) references content (id)
);

create index fk_content_author_author_id_idx
    on content_author (author_id);

create table content_credit
(
    id         integer primary key autoincrement,
    content_id integer                    not null,
    credit_id  integer                    not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime default CURRENT_TIMESTAMP not null,
    constraint uq_content_id_credit_id_idx
        unique (content_id, credit_id),
    constraint fk_content_credit_content_id
        foreign key (content_id) references content (id),
    constraint fk_content_credit_credit_id
        foreign key (credit_id) references credit (id)
);

create index fk_content_credit_credit_id_idx
    on content_credit (credit_id);

create table content_media
(
    id         integer primary key autoincrement,
    content_id integer                    not null,
    media_id   integer                    not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime default CURRENT_TIMESTAMP not null,
    constraint uq_content_id_media_id_idx
        unique (content_id, media_id),
    constraint fk_content_media_content_id
        foreign key (content_id) references content (id),
    constraint fk_content_media_media_id
        foreign key (media_id) references media (id)
);

create index fk_content_media_media_id_idx
    on content_media (media_id);

create table content_transcript
(
    id         integer primary key autoincrement,
    content_id integer                    not null,
    transcript mediumtext                         not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime default CURRENT_TIMESTAMP not null,
    constraint fk_content_TEXT_content_id
        foreign key (content_id) references content (id)
);

create table content_user_progression
(
    id              integer primary key autoincrement,
    user_id         integer                    not null,
    content_id      integer                    not null,
    elapsed_seconds int                                not null,
    created_at      datetime default CURRENT_TIMESTAMP not null,
    updated_at      datetime default CURRENT_TIMESTAMP not null,
    constraint uq_user_id_content_id_idx
        unique (user_id, content_id),
    constraint fk_content_user_progression_content_id_idx
        foreign key (content_id) references content (id)
);

create index fk_content_user_progression_content_id_idx_idx
    on content_user_progression (content_id);

create table tag
(
    id         integer primary key autoincrement,
    slug       varchar(255)                       unique not null,
    name       varchar(255)                       not null,
    created_at datetime default CURRENT_TIMESTAMP not null,
    updated_at datetime default CURRENT_TIMESTAMP not null,
    constraint uq_slug_idx
        unique (slug)
);

create table item_tag
(
    id         integer primary key autoincrement,
    item_id    integer                                                      not null,
    item_type  varchar CHECK (item_type IN ('tag', 'content', 'collection', 'content_transcript', 'media')) not null,
    tag_id     integer                                                      not null,
    created_at datetime default CURRENT_TIMESTAMP                                   not null,
    updated_at datetime default CURRENT_TIMESTAMP                                   not null,
    constraint uq_item_id_item_type_tag_id_idx
        unique (item_id, item_type, tag_id),
    constraint fk_item_tag_tag_id
        foreign key (tag_id) references tag (id)
);

create index fk_item_tag_tag_id_idx
    on item_tag (tag_id);

/* Inserts */
INSERT INTO author (id, name, created_at, updated_at) VALUES (1, 'Pierre Boulle', '2022-03-11 11:31:11', '2022-03-11 11:31:11');
INSERT INTO author (id, name, created_at, updated_at) VALUES (2, 'Jiro Taniguchi', '2022-03-11 11:31:11', '2022-03-11 11:31:11');
INSERT INTO author (id, name, created_at, updated_at) VALUES (3, 'Oliver Peru', '2022-03-11 11:31:11', '2022-03-11 11:31:11');
INSERT INTO credit (id, name, credit_type, provider, created_at, updated_at) VALUES (1, 'Louis XVI', 'ARTICLE', 'Wikipédia', '2022-03-11 11:31:11', '2022-03-11 11:31:11');
INSERT INTO credit (id, name, credit_type, provider, created_at, updated_at) VALUES (2, 'La Terre', 'ARTICLE', 'Sciences et vie', '2022-03-11 11:31:11', '2022-03-11 11:31:11');
INSERT INTO credit (id, name, credit_type, provider, created_at, updated_at) VALUES (3, 'La Joconde', 'ARTICLE', 'Random', '2022-03-11 11:31:11', '2022-03-11 11:31:11');
INSERT INTO media (id, mime_type, path, created_at, updated_at) VALUES (1, 'image/jpeg', 'cover-1.jpg', '2022-01-26 13:56:16', '2022-01-26 13:56:16');
INSERT INTO media (id, mime_type, path, created_at, updated_at) VALUES (2, 'image/jpeg', 'cover-2.jpg', '2022-01-26 13:56:16', '2022-01-26 13:56:16');
INSERT INTO media (id, mime_type, path, created_at, updated_at) VALUES (3, 'image/jpeg', 'cover-3.jpg', '2022-01-26 13:56:16', '2022-01-26 13:56:16');
INSERT INTO tag (id, slug, name, created_at, updated_at) VALUES (1, 'histoire', 'Histoire', '2022-03-11 11:31:11', '2022-03-11 11:31:11');
INSERT INTO tag (id, slug, name, created_at, updated_at) VALUES (2, 'sciences', 'Sciences', '2022-03-11 11:31:11', '2022-03-11 11:31:11');
INSERT INTO tag (id, slug, name, created_at, updated_at) VALUES (3, 'culture', 'Culture', '2022-03-11 11:31:11', '2022-03-11 11:31:11');
INSERT INTO collection (id, slug, name, description, mode, cover_id, published, created_at, updated_at) VALUES (1, 'renaissance', 'La Renaissance', 'Description', 'program', 1, 1, '2022-01-26 13:52:06', '2022-01-26 13:52:06');
INSERT INTO collection (id, slug, name, description, mode, cover_id, published, created_at, updated_at) VALUES (2, 'creation-univers', 'La création de l''Univers', 'Description', 'program', 1, 1, '2022-01-26 13:52:06', '2022-01-26 13:52:06');
INSERT INTO collection (id, slug, name, description, mode, cover_id, published, created_at, updated_at) VALUES (3, 'peinture-medievale', 'Peinture médievale', 'Description', 'snacking', 1, 1, '2022-01-26 13:52:06', '2022-01-26 13:52:06');
INSERT INTO content (id, name, short_description, long_description, duration, cover_id, published, created_at, updated_at) VALUES (1, 'Repellat sunt voluptate laboriosam eligendi.', 'Odit sequi veniam quo id. Et exercitationem qui omnis quia sint ', 'Quo provident eum commodi quam. Vitae sit qui dolorem non ad. Repudiandae reiciendis repellendus distinctio non. Placeat aut sit et autem quaerat eum sunt. Enim ipsa est minus facilis deleniti.', 1277, 2, 1, '2022-01-26 13:55:10', '2022-01-26 13:55:10');
INSERT INTO content (id, name, short_description, long_description, duration, cover_id, published, created_at, updated_at) VALUES (2, 'Unde ea et magnam veniam et.', 'Nesciunt aperiam dolores et molestiae amet. Eum temporibus porro', 'In nihil voluptatibus iure sit quos maxime sunt. Voluptatem quibusdam quae impedit voluptate dolorem earum. Quo vel iste commodi dolor omnis excepturi. Quibusdam aut repellendus quaerat. Et corrupti deserunt sit in molestiae id. Eligendi qui quae unde. Praesentium cum sint ut qui voluptatibus qui aliquam.', 613, 1, 1, '2022-01-26 13:55:10', '2022-01-26 13:55:10');
INSERT INTO content (id, name, short_description, long_description, duration, cover_id, published, created_at, updated_at) VALUES (3, 'Odit et illum est velit ut reprehenderit.', 'Eveniet sit reprehenderit dolorum quia harum et minima. Iure tot', 'Ad enim expedita consequuntur voluptates eligendi. Tempora voluptates voluptatem assumenda impedit incidunt autem id. Sed magni placeat praesentium doloremque aut consectetur. Vitae atque totam ad adipisci tempore assumenda rem aliquid. Dolores magni maxime ipsa hic dicta accusantium quas quo. Alias delectus quis autem quod. Maiores voluptatem veritatis a corrupti. Vero nisi ut et itaque assumenda ut.', 2025, 1, 1, '2022-01-26 13:55:10', '2022-01-26 13:55:10');
INSERT INTO collection_content (id, collection_id, content_id, `order`, created_at, updated_at) VALUES (1, 1, 1, 1, '2022-01-26 13:54:38', '2022-01-26 13:54:38');
INSERT INTO collection_content (id, collection_id, content_id, `order`, created_at, updated_at) VALUES (2, 1, 2, 2, '2022-01-26 13:54:38', '2022-01-26 13:54:38');
INSERT INTO collection_content (id, collection_id, content_id, `order`, created_at, updated_at) VALUES (3, 2, 3, 3, '2022-01-26 13:54:38', '2022-01-26 13:54:38');
INSERT INTO content_author (id, content_id, author_id, created_at, updated_at) VALUES (1, 1, 1, '2022-01-26 13:55:21', '2022-01-26 13:55:21');
INSERT INTO content_author (id, content_id, author_id, created_at, updated_at) VALUES (2, 2, 2, '2022-01-26 13:55:21', '2022-01-26 13:55:21');
INSERT INTO content_author (id, content_id, author_id, created_at, updated_at) VALUES (3, 3, 3, '2022-01-26 13:55:21', '2022-01-26 13:55:21');
INSERT INTO content_credit (id, content_id, credit_id, created_at, updated_at) VALUES (1, 1, 1, '2022-01-26 13:55:21', '2022-01-26 13:55:21');
INSERT INTO content_credit (id, content_id, credit_id, created_at, updated_at) VALUES (2, 2, 2, '2022-01-26 13:55:21', '2022-01-26 13:55:21');
INSERT INTO content_credit (id, content_id, credit_id, created_at, updated_at) VALUES (3, 3, 3, '2022-01-26 13:55:21', '2022-01-26 13:55:21');
INSERT INTO content_media (id, content_id, media_id, created_at, updated_at) VALUES (1, 1, 1, '2022-01-26 13:55:21', '2022-01-26 13:55:21');
INSERT INTO content_media (id, content_id, media_id, created_at, updated_at) VALUES (2, 2, 2, '2022-01-26 13:55:21', '2022-01-26 13:55:21');
INSERT INTO content_media (id, content_id, media_id, created_at, updated_at) VALUES (3, 3, 3, '2022-01-26 13:55:21', '2022-01-26 13:55:21');
INSERT INTO content_transcript (id, content_id, transcript, created_at, updated_at) VALUES (1, 1, '1 transcript', '2022-01-26 13:55:21', '2022-01-26 13:55:21');
INSERT INTO content_transcript (id, content_id, transcript, created_at, updated_at) VALUES (2, 2, '2 transcript', '2022-01-26 13:55:21', '2022-01-26 13:55:21');
INSERT INTO content_transcript (id, content_id, transcript, created_at, updated_at) VALUES (3, 3, '3 transcript', '2022-01-26 13:55:21', '2022-01-26 13:55:21');
INSERT INTO item_tag (id, item_id, item_type, tag_id, created_at, updated_at) VALUES (1, 1, 'collection', 1, '2022-01-26 14:59:59', '2022-01-26 14:59:59');
INSERT INTO item_tag (id, item_id, item_type, tag_id, created_at, updated_at) VALUES (2, 2, 'collection', 2, '2022-01-26 14:59:59', '2022-01-26 14:59:59');
INSERT INTO item_tag (id, item_id, item_type, tag_id, created_at, updated_at) VALUES (3, 3, 'collection', 3, '2022-01-26 14:59:59', '2022-01-26 14:59:59');
INSERT INTO item_tag (id, item_id, item_type, tag_id, created_at, updated_at) VALUES (4, 1, 'content', 1, '2022-01-26 14:59:59', '2022-01-26 14:59:59');
INSERT INTO item_tag (id, item_id, item_type, tag_id, created_at, updated_at) VALUES (5, 2, 'content', 2, '2022-01-26 14:59:59', '2022-01-26 14:59:59');
INSERT INTO item_tag (id, item_id, item_type, tag_id, created_at, updated_at) VALUES (6, 3, 'content', 3, '2022-01-26 14:59:59', '2022-01-26 14:59:59');
INSERT INTO item_tag (id, item_id, item_type, tag_id, created_at, updated_at) VALUES (7, 1, 'content_transcript', 1, '2022-01-26 14:59:59', '2022-01-26 14:59:59');
INSERT INTO item_tag (id, item_id, item_type, tag_id, created_at, updated_at) VALUES (8, 2, 'content_transcript', 2, '2022-01-26 14:59:59', '2022-01-26 14:59:59');
INSERT INTO item_tag (id, item_id, item_type, tag_id, created_at, updated_at) VALUES (9, 3, 'content_transcript', 3, '2022-01-26 14:59:59', '2022-01-26 14:59:59');
INSERT INTO item_tag (id, item_id, item_type, tag_id, created_at, updated_at) VALUES (10, 1, 'media', 1, '2022-01-26 14:59:59', '2022-01-26 14:59:59');
INSERT INTO item_tag (id, item_id, item_type, tag_id, created_at, updated_at) VALUES (11, 2, 'media', 2, '2022-01-26 14:59:59', '2022-01-26 14:59:59');
INSERT INTO item_tag (id, item_id, item_type, tag_id, created_at, updated_at) VALUES (12, 3, 'media', 3, '2022-01-26 14:59:59', '2022-01-26 14:59:59');

