-- Table: public.wishlist

-- DROP TABLE IF EXISTS public.wishlist;

CREATE TABLE IF NOT EXISTS public.wishlist
(
    wishlistid integer NOT NULL DEFAULT nextval('wishlist_wishlistid_seq'::regclass),
    customerid integer NOT NULL,
    movieid integer NOT NULL,
    dateadded timestamp without time zone NOT NULL,
    CONSTRAINT wishlist_pkey PRIMARY KEY (wishlistid),
    CONSTRAINT uk_wishlist_customer_movie UNIQUE (customerid, movieid),
    CONSTRAINT fk_wishlist_customer FOREIGN KEY (customerid)
        REFERENCES public.customer (customerid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_wishlist_movie FOREIGN KEY (movieid)
        REFERENCES public.movie (movieid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.wishlist
    OWNER to postgres;