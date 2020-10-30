/* (4.a) List stores with an average rating above 2 */

SELECT store.name, AVG(rating)
FROM store, store_review
WHERE store.name = store_review.store_name
GROUP BY store.name
HAVING AVG(rating) > 2

/* (4.b) List items and prices of a user\'s wishlist */

SELECT item.title, item.price
FROM user, wishlist, item
WHERE
    user.email = ? AND
    user.email = wishlist.email AND
    wishlist.serial_no = item.serial_no;

/* (4.c) Get the sum of item prices on all wishlists, ordered by price */

SELECT user.email, SUM(item.price)
FROM user, wishlist, item
WHERE
    user.email = wishlist.email AND
    wishlist.serial_no = item.serial_no
GROUP BY user.email
ORDER BY SUM(item.price) ASC
