-- Table: public.actor

-- DROP TABLE IF EXISTS public.actor;

CREATE TABLE IF NOT EXISTS public.actor
(
    actorid integer NOT NULL DEFAULT nextval('actor_actorid_seq'::regclass),
    firstname character varying(50) COLLATE pg_catalog."default" NOT NULL,
    lastname character varying(50) COLLATE pg_catalog."default" NOT NULL,
    dateofbirth date NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT actor_pkey PRIMARY KEY (actorid),
    CONSTRAINT uk_actor_email UNIQUE (email),
    CONSTRAINT chk_actor_email CHECK (email::text ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'::text)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.actor
    OWNER to postgres;