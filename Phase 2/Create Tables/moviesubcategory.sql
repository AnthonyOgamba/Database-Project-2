-- Table: public.moviesubcategory

-- DROP TABLE IF EXISTS public.moviesubcategory;

CREATE TABLE IF NOT EXISTS public.moviesubcategory
(
    movieid integer NOT NULL,
    subcategoryid integer NOT NULL,
    CONSTRAINT pk_moviesubcategory PRIMARY KEY (movieid, subcategoryid),
    CONSTRAINT fk_moviesubcategory_movie FOREIGN KEY (movieid)
        REFERENCES public.movie (movieid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_moviesubcategory_subcategory FOREIGN KEY (subcategoryid)
        REFERENCES public.subcategory (subcategoryid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.moviesubcategory
    OWNER to postgres;