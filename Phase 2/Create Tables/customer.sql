-- Table: public.customer

-- DROP TABLE IF EXISTS public.customer;

CREATE TABLE IF NOT EXISTS public.customer
(
    customerid integer NOT NULL DEFAULT nextval('customer_customerid_seq'::regclass),
    firstname character varying(50) COLLATE pg_catalog."default" NOT NULL,
    surname character varying(50) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    address character varying(200) COLLATE pg_catalog."default" NOT NULL,
    postalcode character varying(6) COLLATE pg_catalog."default" NOT NULL,
    phonenumber character varying(12) COLLATE pg_catalog."default" NOT NULL,
    defaultcreditcardnum character varying(16) COLLATE pg_catalog."default",
    defaultcreditcardtype character varying(2) COLLATE pg_catalog."default",
    CONSTRAINT customer_pkey PRIMARY KEY (customerid),
    CONSTRAINT uk_customer_email UNIQUE (email),
    CONSTRAINT chk_cc_num CHECK (defaultcreditcardnum IS NULL OR defaultcreditcardnum::text ~ '^[0-9]{16}$'::text),
    CONSTRAINT chk_cc_type CHECK ((defaultcreditcardtype::text = ANY (ARRAY['AX'::character varying, 'MC'::character varying, 'VS'::character varying]::text[])) OR defaultcreditcardtype IS NULL),
    CONSTRAINT chk_email CHECK (email::text ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'::text),
    CONSTRAINT chk_phonenumber CHECK (phonenumber::text ~ '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$'::text),
    CONSTRAINT chk_postalcode CHECK (postalcode::text ~ '^[A-Z][0-9][A-Z][0-9][A-Z][0-9]$'::text)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customer
    OWNER to postgres;