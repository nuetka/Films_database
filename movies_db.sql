DROP DATABASE if EXISTS movies_db;

CREATE DATABASE movies_db;
    
    CREATE TABLE person
(
    person_id integer,
    first_name text NOT NULL,
    last_name text NOT NULL,
    CONSTRAINT PK_perosn_person_id PRIMARY KEY (person_id)
);

CREATE TABLE genre
(
    genre_id integer,
    genre_name varchar(20) NOT NULL,
    CONSTRAINT PK_genre_genre_id PRIMARY KEY (genre_id)
);

CREATE TABLE audience
(
    audience_id integer,
    country_name varchar(20) NOT NULL,
    quantity int NOT NULL,
    CONSTRAINT PK_audience_audience_id PRIMARY KEY (audience_id)
);

CREATE TABLE film
(
    film_id integer,
    film_name text NOT NULL,
    release_year int NOT NULL,
    country varchar(30) NOT NULL,
    director_id integer,
    screenplay_id integer,
    producer_id integer,
    cinematograthy_id integer,
    music_id integer,
    designer_id integer,
    editor_id integer,
    
    CONSTRAINT PK_film_film_id PRIMARY KEY (film_id),
    CONSTRAINT FK_film_director_id FOREIGN KEY (director_id) REFERENCES person(person_id),
    CONSTRAINT FK_film_screenplay_id FOREIGN KEY (screenplay_id) REFERENCES person(person_id),
    CONSTRAINT FK_film_producer_id FOREIGN KEY (producer_id) REFERENCES person(person_id),
    CONSTRAINT FK_film_cinematograthy_id FOREIGN KEY (cinematograthy_id) REFERENCES person(person_id),
    CONSTRAINT FK_film_music_id  FOREIGN KEY (music_id) REFERENCES person(person_id),
    CONSTRAINT FK_film_designer_id FOREIGN KEY (designer_id) REFERENCES person(person_id),
    budget int NOT NULL,
    marketing int NOT NULL,
    cash_usa int NOT NULL,
    cash_world int NOT NULL,
    premiere_russia varchar(32) NOT NULL,
    premiere_world varchar(32) NOT NULL,
    release_DVD varchar(32) NOT NULL,
    age_limit int NOT NULL,
    rating_mpaa varchar(8) NOT NULL,
    duration int NOT NULL
);


CREATE TABLE film_genre
(
   film_id integer,
   genre_id integer,
   
   CONSTRAINT FK_film_genre_film_id FOREIGN KEY (film_id) REFERENCES film(film_id),
   CONSTRAINT FK_film_genre_genre_id FOREIGN KEY (genre_id) REFERENCES genre(genre_id),
   CONSTRAINT PK_film_genre PRIMARY KEY (film_id, genre_id) 
);

CREATE TABLE film_audience
(
   film_id integer,
   audience_id integer,
   
   CONSTRAINT FK_film_audience_film_id FOREIGN KEY (film_id) REFERENCES film(film_id),
   CONSTRAINT FK_film_audience_audience_id FOREIGN KEY (audience_id) REFERENCES audience(audience_id),
   CONSTRAINT PK_film_audience PRIMARY KEY (film_id, country_id) 
);

CREATE TABLE starring -- в главных ролях
(
   film_id integer,
   person_id integer,
   
   CONSTRAINT FK_starring_film_id FOREIGN KEY (film_id) REFERENCES film(film_id),
   CONSTRAINT FK_starring_person_id FOREIGN KEY (person_id) REFERENCES person(person_id),
   CONSTRAINT PK_starring PRIMARY KEY (film_id, person_id) 
);


CREATE TABLE dubbing -- дублирование
(
   film_id integer,
   person_id integer,
   
   CONSTRAINT FK_dubbing_film_id FOREIGN KEY (film_id) REFERENCES film(film_id),
   CONSTRAINT FK_dubbing_person_id FOREIGN KEY (person_id) REFERENCES person(person_id),
   CONSTRAINT PK_dubbing PRIMARY KEY (film_id, person_id) 
);