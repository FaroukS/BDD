1) SELECT firstname, lastname, adress FROM booking JOIN reserved USING (id_booking) JOIN member USING (id_member) WHERE name_movie IN ( SELECT name_movie AS name_movie_DVD FROM booking where type = 'DVD') AND type = 'VHS';

V2

SELECT firstname, lastname, adress FROM booking JOIN reserved USING (id_booking) JOIN member USING (id_member) JOIN occupied USING (id_booking) JOIN support USING (id_support) WHERE id_movie IN ( SELECT id_movie FROM booking where type = 'DVD') AND type = 'VHS';


2)SELECT * FROM booking JOIN occupied USING (id_booking) JOIN support USING (id_support) JOIN contents_support USING (id_support) JOIN shop USING (id_shop) WHERE name_shop = (SELECT name_shop AS same_name_shop FROM shop) AND booking.type = 'DVD';


3)SELECT firstname, lastname, adress FROM booking JOIN reserved USING (id_booking) JOIN member USING (id_member) WHERE rental_shop != restitution_shop;



4)SELECT firstname, lastname FROM employee JOIN Works_in USING (id_employee) JOIN shop USING (id_shop) WHERE id_shop != (SELECT id_shop AS id_shop_animation FROM movie JOIN contents_in_sup USING (id_movie) JOIN support USING (id_support) JOIN contents_support USING (id_support) JOIN shop USING (id_shop) WHERE categorie = 'animation') AND employee.type ='Director';

5)SELECT firstname, lastname, adress, COUNT(id_booking) AS id_booking_count FROM booking JOIN reserved USING (id_booking) JOIN member USING (id_member) WHERE DATEDIFF(NOW(), 'start_date_rental') < 30 GROUP BY id_member ORDER BY id_booking_count DESC LIMIT 3;

6)SELECT director_movie_2013.name_shop, director_movie_2013.firstname, director_movie_2013.lastname, movie_2013.id_booking_count FROM (SELECT rental_shop, COUNT(id_booking) AS id_booking_count FROM booking WHERE DATEDIFF(`end_date_rental`, `start_date_rental`) > 3 AND extract(year FROM `end_date_rental`) =2013 GROUP BY rental_shop)movie_2013 JOIN (SELECT lastname, firstname, rental_shop, name_shop FROM booking JOIN occupied USING (id_booking) JOIN support USING (id_support) JOIN contents_support USING (id_support) JOIN shop USING (id_shop) JOIN works_in USING (id_shop) JOIN employee USING (id_employee) WHERE employee.type = 'Director')director_movie_2013 ON movie_2013.rental_shop = director_movie_2013.rental_shop;