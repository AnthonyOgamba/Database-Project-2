-- Table: public.movieadvisory

-- DROP TABLE IF EXISTS public.movieadvisory;

CREATE TABLE IF NOT EXISTS public.movieadvisory
(
    movieid integer NOT NULL,
    advisoryid integer NOT NULL,
    CONSTRAINT pk_movieadvisory PRIMARY KEY (movieid, advisoryid),
    CONSTRAINT fk_movieadvisory_advisory FOREIGN KEY (advisoryid)
        REFERENCES public.advisory (advisoryid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_movieadvisory_movie FOREIGN KEY (movieid)
        REFERENCES public.movie (movieid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.movieadvisory
    OWNER to postgres;