/* # Final document */

/* ## Inserting records */

/* ### Inserting items */

INSERT INTO item (
    serial_no,
    quantity,
    quantity_sold,
    title,
    description,
    category,
    file_type,
    price,
    store_name
) VALUES ('6DLOKO1H', 48, 30, 're-contextualize best-of-breed action-items', 'Hear claim fund only finish goal of official.', 'music', 'docx', 7830, 'Ross PLC');
/* Inserted new item 're-contextualize best-of-breed action-items' with serial number '6DLOKO1H' in store 'Ross PLC' */

/* ### Inserting orders */

/* See CP4 quesiton 7.a */

/* ### Inserting sellers */

INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
VALUES ('robin73@bowman-smith.info', 'Anthony', 'Roy', 1, 9326);
/* Inserted user 'Anthony Roy' with email 'robin73@bowman-smith.info' */
INSERT INTO seller (email)
VALUES ('robin73@bowman-smith.info');
/* Inserted seller 'robin73@bowman-smith.info' */

/* ### Inserting buyers */

INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
VALUES ('astewart@taylor.com', 'Linda', 'Kim', 0, 8780);
/* Inserted user 'Linda Kim' with email 'astewart@taylor.com' */
INSERT INTO buyer (email)
VALUES ('astewart@taylor.com');
/* Inserted buyer 'astewart@taylor.com' */
