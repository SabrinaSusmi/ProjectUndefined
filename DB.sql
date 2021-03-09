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


--------------------------------Buy
CREATE TABLE public."Buy"
(
    "ID" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "Batch_no" character varying(30) COLLATE pg_catalog."default" NOT NULL,
    title character varying(255) COLLATE pg_catalog."default",
    init_qty numeric NOT NULL,
    qty numeric NOT NULL,
    unit_price numeric,
    total_price numeric,
    supplier_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    supplier_phone character varying(15) COLLATE pg_catalog."default" NOT NULL,
    supplier_address character varying(255) COLLATE pg_catalog."default",
    buy_date date NOT NULL,
    CONSTRAINT "Buy_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT batch_unique UNIQUE ("Batch_no")
)

TABLESPACE pg_default;

ALTER TABLE public."Buy"
    OWNER to postgres;



--------------------------------------sell
CREATE TABLE public."Sell"
(
    "ID" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    title character varying(255) COLLATE pg_catalog."default",
    qty numeric NOT NULL,
    unit_price numeric,
    total_price numeric,
    sell_date date NOT NULL,
    cust_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Sell_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT cust_sell_fk FOREIGN KEY (cust_id)
        REFERENCES public."Customer" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Sell"
    OWNER to postgres;



----------------------------------------buy-sell-junction
CREATE TABLE public."Buy_sell"
(
    batch_no character varying(30) COLLATE pg_catalog."default" NOT NULL,
    sell_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Buy_sell_pkey" PRIMARY KEY (batch_no, sell_id),
    CONSTRAINT bsjunction_buy_fk FOREIGN KEY (batch_no)
        REFERENCES public."Buy" ("Batch_no") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT bsjunction_sell_fk FOREIGN KEY (sell_id)
        REFERENCES public."Sell" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Buy_sell"
    OWNER to postgres;


-----------------------------Loan
CREATE TABLE public."Loan"
(
    "ID" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    title character varying(255) COLLATE pg_catalog."default" NOT NULL,
    amount numeric NOT NULL,
    investor_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    investor_phone character varying(15) COLLATE pg_catalog."default" NOT NULL,
    investor_email character varying(255) COLLATE pg_catalog."default",
    investor_address character varying(255) COLLATE pg_catalog."default",
    issue_date date NOT NULL,
    deadline date,
    "Remaining" numeric,
    CONSTRAINT "Loan_pkey" PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE public."Loan"
    OWNER to postgres;


----------------------------Loan Records
CREATE TABLE public."Loan_records"
(
    "Loan_id" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    given_amt numeric NOT NULL,
    given_date date NOT NULL,
    "ID" numeric NOT NULL,
    CONSTRAINT "Loan_records_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT loan_rec_fk FOREIGN KEY ("Loan_id")
        REFERENCES public."Loan" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Loan_records"
    OWNER to postgres;


--------------------------------------Expenses
CREATE TABLE public."Expenses"
(
    id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    title character varying(255) COLLATE pg_catalog."default" NOT NULL,
    exp_type character varying(20) COLLATE pg_catalog."default",
    description character varying(255) COLLATE pg_catalog."default",
    amount numeric NOT NULL,
    exp_date date NOT NULL,
    CONSTRAINT "Expenses_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public."Expenses"
    OWNER to postgres;

