-- Table: public.subcategory

-- DROP TABLE IF EXISTS public.subcategory;

CREATE TABLE IF NOT EXISTS public.subcategory
(
    subcategoryid integer NOT NULL DEFAULT nextval('subcategory_subcategoryid_seq'::regclass),
    subcategoryname character varying(50) COLLATE pg_catalog."default" NOT NULL,
    categoryid integer NOT NULL,
    CONSTRAINT subcategory_pkey PRIMARY KEY (subcategoryid),
    CONSTRAINT uk_subcategory_name UNIQUE (subcategoryname),
    CONSTRAINT fk_subcategory_category FOREIGN KEY (categoryid)
        REFERENCES public.category (categoryid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.subcategory
    OWNER to postgres;