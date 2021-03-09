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


