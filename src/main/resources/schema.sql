CREATE TABLE IF NOT EXISTS mpa_rating
(
    mpa_rating_id
    int
    GENERATED
    BY
    DEFAULT AS
    IDENTITY
    PRIMARY
    KEY,
    name
    varchar
(
    50
) UNIQUE NOT NULL
    );

CREATE TABLE IF NOT EXISTS films
(
    film_id
    int
    GENERATED
    BY
    DEFAULT AS
    IDENTITY
    PRIMARY
    KEY,
    name
    varchar
(
    100
) NOT NULL,
    description varchar
(
    500
),
    release_date date,
    duration int,
    mpa_rating_id int REFERENCES mpa_rating
(
    mpa_rating_id
)
    );

CREATE TABLE IF NOT EXISTS genre
(
    genre_id
    int
    GENERATED
    BY
    DEFAULT AS
    IDENTITY
    PRIMARY
    KEY,
    name
    varchar
(
    50
) UNIQUE NOT NULL
    );

CREATE TABLE IF NOT EXISTS film_genre
(
    film_id int NOT NULL REFERENCES films
(
    film_id
) ON DELETE CASCADE,
    genre_id int NOT NULL REFERENCES genre
(
    genre_id
)
  ON DELETE CASCADE,
    PRIMARY KEY
(
    film_id,
    genre_id
)
    );

CREATE TABLE IF NOT EXISTS users
(
    user_id
    int
    GENERATED
    BY
    DEFAULT AS
    IDENTITY
    PRIMARY
    KEY,
    email
    varchar
(
    320
) UNIQUE,
    login varchar
(
    50
) NOT NULL UNIQUE,
    name varchar
(
    50
),
    birthday date
    );

CREATE TABLE IF NOT EXISTS friends
(
    user_id1 int NOT NULL REFERENCES users
(
    user_id
) ON DELETE CASCADE,
    user_id2 int NOT NULL REFERENCES users
(
    user_id
)
  ON DELETE CASCADE,
    status boolean,
    PRIMARY KEY
(
    user_id1,
    user_id2
)
    );

CREATE TABLE IF NOT EXISTS film_likes
(
    film_id int NOT NULL REFERENCES films
(
    film_id
) ON DELETE CASCADE,
    user_id int NOT NULL REFERENCES users
(
    user_id
)
  ON DELETE CASCADE,
    PRIMARY KEY
(
    film_id,
    user_id
)
    );