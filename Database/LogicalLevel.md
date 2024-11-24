# Логический уровень проектирования БД

## Определение атрибутов
    1) Таблица company
        - company_id (ID компании)
        - inn (ИНН)
        - kpp (КПП)
        - company_name (краткое наименование компании)
        - company_full_name (полное наименование компании)
    2) Таблица bank
        - bank_id (ID банка)
        - bank_name (наименование банка)
        - bik (БИК)
        - bank_number (счёт банка)
    3) Таблица external_account
        - external_id (ID сущности)
        - bank_id (ID банка)
        - company_id (ID компании)
        - number (номер счета)
        - created_at (дата создания записи)
    4) Таблица account
        - account_id (ID сущности)
        - bank_id (ID банка)
        - company_id (ID компании)
        - number (номер расчетного счета)
        - created_at (дата создания счета)
    5) Таблица transfer
        - transfer_id (ID сущности)
        - is_external (флаг перевод внешний/внутренний)
        - recipient_account_id (идентификатор счета получателя)
        - sender_account_id (идентификатор счета отправителя)
        - amount (сумма перевода)
        - currency (валюта перевода)
        - vat (НДС)
        - comment (Комментарий к переводу)
        - status (статус перевода)
        - created_at (дата создания записи)
        - transferred_at (дата осуществления трансфера)

## Определение первичных и внешних ключей
    1) Таблица company
        - Primary key: company_id
    2) Таблица bank
        - Primary key: bank_id
    3) Таблица external_account
        - Primary key: external_id
        - Foreign key: bank_id
        - Foreign key: company_id
    4) Таблица account
        - Primary key: account_id
        - Foreign key: bank_id
        - Foreign key: company_id
    5) Таблица transfer
        - Primary key: transfer_id
        - Foreign key: recipient_account_id (=external_id)
        - Foreign key: sender_account_id (=account_id)