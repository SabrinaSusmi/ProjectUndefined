-----------------------------------MEMBER

CREATE TABLE public."Member"
(
    "ID" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "Name" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "Email" character varying(20) COLLATE pg_catalog."default",
    "Phone" character varying(15) COLLATE pg_catalog."default" NOT NULL,
    "Password" character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "Address" character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "DOB" date NOT NULL,
    "Salary" numeric,
    "Invest_amt" numeric,
    "Withdraw_amt" numeric,
    CONSTRAINT "Member_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT mem_info_unique UNIQUE ("Email", "Phone")
)

TABLESPACE pg_default;

ALTER TABLE public."Member"
    OWNER to postgres;


-------------------------------Investment
CREATE TABLE public."Investment_records"
(
    "ID" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    mem_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    given_amt numeric NOT NULL,
    given_date date NOT NULL,
    CONSTRAINT inv_rec_pkey PRIMARY KEY ("ID"),
    CONSTRAINT inv_mem_fk FOREIGN KEY (mem_id)
        REFERENCES public."Member" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Investment_records"
    OWNER to postgres;


---------------------------------Withdraw
CREATE TABLE public."Withdraw_records"
(
    "ID" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    mem_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    amt numeric NOT NULL,
    wtdr_date date NOT NULL,
    CONSTRAINT "Withdraw_records_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT wtdr_mem_fk FOREIGN KEY (mem_id)
        REFERENCES public."Member" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Withdraw_records"
    OWNER to postgres;


-------------------------------Customer
CREATE TABLE public."Customer"
(
    "ID" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "Name" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "Email" character varying(20) COLLATE pg_catalog."default",
    "Phone" character varying(15) COLLATE pg_catalog."default" NOT NULL,
    "Address" character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Customer_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT cust_info_unique UNIQUE ("Email", "Phone")
)

TABLESPACE pg_default;

ALTER TABLE public."Customer"
    OWNER to postgres;

