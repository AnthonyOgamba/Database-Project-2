-- Table: public.category

-- DROP TABLE IF EXISTS public.category;

CREATE TABLE IF NOT EXISTS public.category
(
    categoryid integer NOT NULL DEFAULT nextval('category_categoryid_seq'::regclass),
    categoryname character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT category_pkey PRIMARY KEY (categoryid),
    CONSTRAINT uk_category_name UNIQUE (categoryname)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.category
    OWNER to postgres;