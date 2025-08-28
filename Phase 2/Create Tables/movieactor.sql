-- Table: public.movieactor

-- DROP TABLE IF EXISTS public.movieactor;

CREATE TABLE IF NOT EXISTS public.movieactor
(
    movieid integer NOT NULL,
    actorid integer NOT NULL,
    rolename character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_movieactor PRIMARY KEY (movieid, actorid),
    CONSTRAINT fk_movieactor_actor FOREIGN KEY (actorid)
        REFERENCES public.actor (actorid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_movieactor_movie FOREIGN KEY (movieid)
        REFERENCES public.movie (movieid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.movieactor
    OWNER to postgres;