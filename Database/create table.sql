create table company(
	company_id UUID primary key,
	inn VARCHAR(12) not null unique,
	kpp VARCHAR(10) NOT NULL UNIQUE,
	company_name VARCHAR(120),
	company_full_name VARCHAR(255) NOT NULL
);

create table bank(
	bank_id UUID primary key,
	bank_name VARCHAR(255) NOT NULL,
	bik VARCHAR(9) NOT null unique,
	bank_number VARCHAR(20) NOT null UNIQUE
);

CREATE TABLE external_account (
    external_id UUID PRIMARY KEY,
    bank_id UUID NOT NULL,
    company_id UUID NOT NULL,
    external_number VARCHAR(20) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL,
    FOREIGN KEY (company_id) REFERENCES company(company_id) ON DELETE cascade,
    FOREIGN KEY (bank_id) REFERENCES bank(bank_id) ON DELETE CASCADE
);

CREATE TABLE account (
    account_id UUID PRIMARY KEY,
    bank_id UUID NOT NULL,
    company_id UUID NOT NULL,
    account_number VARCHAR(20) NOT NULL UNIQUE,
    created_account_at TIMESTAMP NOT NULL,
    FOREIGN KEY (company_id) REFERENCES company(company_id) ON DELETE cascade,
    FOREIGN KEY (bank_id) REFERENCES bank(bank_id) ON DELETE CASCADE
);

create table transfer (
	transfer_id SERIAL primary key,
	is_external boolean not null,
	recipient_account_id UUID,
	sender_account_id UUID,
	amount NUMERIC(12,2) NOT null,
	currency CHAR(3) NOT null,
	vat boolean NOT null,
	transfer_comment VARCHAR(120),
	status int NOT null,
	created_transfered_at TIMESTAMP NOT null,
	transfered_at TIMESTAMP NOT null,
	FOREIGN KEY (recipient_account_id) REFERENCES external_account(external_id) ON DELETE cascade,
    FOREIGN KEY (sender_account_id) REFERENCES account(account_id) ON DELETE CASCADE
);
