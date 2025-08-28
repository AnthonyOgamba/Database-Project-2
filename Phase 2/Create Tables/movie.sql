-- Table: public.movie

-- DROP TABLE IF EXISTS public.movie;

CREATE TABLE IF NOT EXISTS public.movie
(
    movieid integer NOT NULL DEFAULT nextval('movie_movieid_seq'::regclass),
    title character varying(100) COLLATE pg_catalog."default" NOT NULL,
    duration integer NOT NULL,
    sdrentalprice numeric(6,2) NOT NULL,
    hdrentalprice numeric(6,2) NOT NULL,
    rating character varying(10) COLLATE pg_catalog."default" NOT NULL,
    newrelease integer NOT NULL DEFAULT 0,
    mostpopular integer NOT NULL DEFAULT 0,
    comingsoon integer NOT NULL DEFAULT 0,
    directorid integer NOT NULL,
    CONSTRAINT movie_pkey PRIMARY KEY (movieid),
    CONSTRAINT fk_movie_director FOREIGN KEY (directorid)
        REFERENCES public.director (directorid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT chk_comingsoon CHECK (comingsoon = ANY (ARRAY[0, 1])),
    CONSTRAINT chk_duration CHECK (duration > 0),
    CONSTRAINT chk_mostpopular CHECK (mostpopular = ANY (ARRAY[0, 1])),
    CONSTRAINT chk_newrelease CHECK (newrelease = ANY (ARRAY[0, 1])),
    CONSTRAINT chk_rating CHECK (rating::text = ANY (ARRAY['G'::character varying, 'PG'::character varying, '14A'::character varying, '18A'::character varying, 'R'::character varying]::text[]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.movie
    OWNER to postgres;