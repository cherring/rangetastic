DROP TABLE IF EXISTS orders;

DROP SEQUENCE IF EXISTS orders_id_seq;

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
    
CREATE TABLE orders (
    id integer NOT NULL default nextval('orders_id_seq'),
    ordered_on timestamp,
    fulfilled_on timestamp,
    shipped_at timestamp,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

