-- Table: public.advisory

-- DROP TABLE IF EXISTS public.advisory;

CREATE TABLE IF NOT EXISTS public.advisory
(
    advisoryid integer NOT NULL DEFAULT nextval('advisory_advisoryid_seq'::regclass),
    shortdescription character varying(50) COLLATE pg_catalog."default" NOT NULL,
    fulldescription character varying(500) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT advisory_pkey PRIMARY KEY (advisoryid),
    CONSTRAINT uk_advisory_shortdesc UNIQUE (shortdescription)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.advisory
    OWNER to postgres;