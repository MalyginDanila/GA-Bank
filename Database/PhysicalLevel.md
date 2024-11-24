# Физический уровень проектирования бд

## Определение типов данных, обязательность и уникальность, значения по умолчанию для атрибутов
    1) Таблица company
        - company_id: UUID
        - inn: VARCHAR(12)/NOT NULL/UNIQUE
        - kpp: VARCHAR(10)/NOT NULL/UNIQUE
        - company_name: VARCHAR(120)
        - company_full_name: VARCHAR(255)/NOT NULL
    2) Таблица bank
        - bank_id: UUID
        - bank_name: VARCHAR(255)/NOT NULL
        - bik: VARCHAR(9)/NOT NULL/UNIQUE
        - bank_number: VARCHAR(20)/NOT NULL/UNIQUE
    3) Таблица external_account
        - external_id: UUID
        - bank_id: UUID
        - company_id: UUID
        - external_number: VARCHAR(20)/NOT NULL/UNIQUE
        - created_at: timestamp/NOT NULL
    4) Таблица account
        - account_id: UUID
        - bank_id: UUID
        - company_id: UUID
        - account_number: VARCHAR(20)/NOT NULL/UNIQUE
        - created_account_at: timestamp/NOT NULL
    5) Таблица transfer
        - transfer_id: serial
        - is_external: boolean/NOT NULL
        - recipient_account_id: UUID
        - sender_account_id: UUID
        - amount: NUMERIC(12,2)/NOT NULL
        - currency: CHAR(3)/NOT NULL
        - vat: boolean/NOT NULL
        - transfer_comment: VARCHAR(120)
        - status: int/NOT NULL
        - created_transfered_at: TIMESTAMP/NOT NULL
        - transfered_at: TIMESTAMP/NOT NULL
