1) SELECT firstname, lastname, adress FROM booking JOIN reserved USING (id_booking) JOIN member USING (id_member) WHERE name_movie IN ( SELECT name_movie AS name_movie_DVD FROM booking where type = 'DVD') AND type = 'VHS';


2)


3)SELECT firstname, lastname, adress FROM booking JOIN reserved USING (id_booking) JOIN member USING (id_member) WHERE rental_shop != restitution_shop;