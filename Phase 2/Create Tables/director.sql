-- Table: public.director

-- DROP TABLE IF EXISTS public.director;

CREATE TABLE IF NOT EXISTS public.director
(
    directorid integer NOT NULL DEFAULT nextval('director_directorid_seq'::regclass),
    firstname character varying(50) COLLATE pg_catalog."default" NOT NULL,
    lastname character varying(50) COLLATE pg_catalog."default" NOT NULL,
    dateofbirth date NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT director_pkey PRIMARY KEY (directorid),
    CONSTRAINT uk_director_email UNIQUE (email),
    CONSTRAINT chk_director_email CHECK (email::text ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'::text)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.director
    OWNER to postgres;