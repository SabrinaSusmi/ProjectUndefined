-----------------------------------MEMBER
CREATE TABLE public.member
(
    id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(20) COLLATE pg_catalog."default",
    phone character varying(15) COLLATE pg_catalog."default" NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    address character varying(255) COLLATE pg_catalog."default" NOT NULL,
    dob date NOT NULL,
    salary numeric,
    invest_amt numeric,
    withdraw_amt numeric,
    username character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Member_pkey" PRIMARY KEY (id),
    CONSTRAINT mem_info_unique UNIQUE (email, phone)
)

TABLESPACE pg_default;

ALTER TABLE public.member
    OWNER to postgres;


-------------------------------Investment
CREATE TABLE public.investment_records
(
    id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    mem_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    given_amt numeric NOT NULL,
    given_date date NOT NULL,
    CONSTRAINT inv_rec_pkey PRIMARY KEY (id),
    CONSTRAINT inv_mem_fk FOREIGN KEY (mem_id)
        REFERENCES public.member (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.investment_records
    OWNER to postgres;


---------------------------------Withdraw
CREATE TABLE public.withdraw_records
(
    id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    mem_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    amt numeric NOT NULL,
    wtdr_date date NOT NULL,
    CONSTRAINT "Withdraw_records_pkey" PRIMARY KEY (id),
    CONSTRAINT wtdr_mem_fk FOREIGN KEY (mem_id)
        REFERENCES public.member (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.withdraw_records
    OWNER to postgres;


-------------------------------Customer
CREATE TABLE public.customer
(
    id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(20) COLLATE pg_catalog."default",
    phone character varying(15) COLLATE pg_catalog."default" NOT NULL,
    address character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Customer_pkey" PRIMARY KEY (id),
    CONSTRAINT cust_info_unique UNIQUE (email, phone)
)

TABLESPACE pg_default;

ALTER TABLE public.customer
    OWNER to postgres;


--------------------------------Buy
CREATE TABLE public.buy
(
    id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    batch_no character varying(30) COLLATE pg_catalog."default" NOT NULL,
    title character varying(255) COLLATE pg_catalog."default",
    init_qty numeric NOT NULL,
    qty numeric NOT NULL,
    unit_price numeric,
    total_price numeric,
    supplier_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    supplier_phone character varying(15) COLLATE pg_catalog."default" NOT NULL,
    supplier_address character varying(255) COLLATE pg_catalog."default",
    buy_date date NOT NULL,
    CONSTRAINT "Buy_pkey" PRIMARY KEY (id),
    CONSTRAINT batch_unique UNIQUE (batch_no)
)

TABLESPACE pg_default;

ALTER TABLE public.buy
    OWNER to postgres;



--------------------------------------sell
CREATE TABLE public.sell
(
    id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    title character varying(255) COLLATE pg_catalog."default",
    qty numeric NOT NULL,
    unit_price numeric,
    total_price numeric,
    sell_date date NOT NULL,
    cust_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Sell_pkey" PRIMARY KEY (id),
    CONSTRAINT cust_sell_fk FOREIGN KEY (cust_id)
        REFERENCES public.customer (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.sell
    OWNER to postgres;



----------------------------------------buy-sell-junction
CREATE TABLE public.buy_sell
(
    batch_no character varying(30) COLLATE pg_catalog."default" NOT NULL,
    sell_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Buy_sell_pkey" PRIMARY KEY (batch_no, sell_id),
    CONSTRAINT bsjunction_buy_fk FOREIGN KEY (batch_no)
        REFERENCES public.buy (batch_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT bsjunction_sell_fk FOREIGN KEY (sell_id)
        REFERENCES public.sell (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.buy_sell
    OWNER to postgres;


-----------------------------Loan
CREATE TABLE public.loan
(
    id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    title character varying(255) COLLATE pg_catalog."default" NOT NULL,
    amount numeric NOT NULL,
    investor_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    investor_phone character varying(15) COLLATE pg_catalog."default" NOT NULL,
    investor_email character varying(255) COLLATE pg_catalog."default",
    investor_address character varying(255) COLLATE pg_catalog."default",
    issue_date date NOT NULL,
    deadline date,
    remaining numeric,
    CONSTRAINT "Loan_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.loan
    OWNER to postgres;


----------------------------Loan Records
CREATE TABLE public.loan_records
(
    loan_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    given_amt numeric NOT NULL,
    given_date date NOT NULL,
    id numeric NOT NULL,
    CONSTRAINT "Loan_records_pkey" PRIMARY KEY (id),
    CONSTRAINT loan_rec_fk FOREIGN KEY (loan_id)
        REFERENCES public.loan (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.loan_records
    OWNER to postgres;


--------------------------------------Expenses
CREATE TABLE public.expenses
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

ALTER TABLE public.expenses
    OWNER to postgres;

