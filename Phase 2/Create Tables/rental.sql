-- Table: public.rental

-- DROP TABLE IF EXISTS public.rental;

CREATE TABLE IF NOT EXISTS public.rental
(
    rentalid integer NOT NULL DEFAULT nextval('rental_rentalid_seq'::regclass),
    customerid integer NOT NULL,
    movieid integer NOT NULL,
    rentaldate timestamp without time zone NOT NULL,
    startviewingdate timestamp without time zone NOT NULL,
    expirydate timestamp without time zone NOT NULL,
    customerrating integer,
    rentalamount numeric(6,2) NOT NULL,
    creditcardnum character varying(16) COLLATE pg_catalog."default" NOT NULL,
    creditcardtype character varying(2) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT rental_pkey PRIMARY KEY (rentalid),
    CONSTRAINT fk_rental_customer FOREIGN KEY (customerid)
        REFERENCES public.customer (customerid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT fk_rental_movie FOREIGN KEY (movieid)
        REFERENCES public.movie (movieid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT chk_cc_num CHECK (creditcardnum::text ~ '^[0-9]{16}$'::text),
    CONSTRAINT chk_cc_type CHECK (creditcardtype::text = ANY (ARRAY['AX'::character varying, 'MC'::character varying, 'VS'::character varying]::text[])),
    CONSTRAINT chk_dates CHECK (startviewingdate IS NULL OR startviewingdate >= rentaldate),
    CONSTRAINT chk_expiry_24hrs CHECK (expirydate IS NULL OR expirydate = (startviewingdate + '24:00:00'::interval)),
    CONSTRAINT chk_rating_range CHECK (customerrating IS NULL OR customerrating >= 1 AND customerrating <= 5)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.rental
    OWNER to postgres;