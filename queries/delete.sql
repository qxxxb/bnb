/* ## Deleting records */

/* ### Deleting items */

DELETE FROM item
WHERE serial_no = '13QF5RTP';
/* Deleted item '13QF5RTP' */

/* ### Deleting orders */

DELETE FROM 'order'
WHERE id = 5;
/* Deleted order '5' */

/* ### Deleting sellers */

DELETE FROM seller
WHERE email = 'vgarcia@hodge.com';
/* Deleted seller 'vgarcia@hodge.com' */

/* ### Deleting buyers */

DELETE FROM buyer
WHERE email = 'jenna75@gmail.com';
/* Deleted buyer 'jenna75@gmail.com' */
COMMIT
