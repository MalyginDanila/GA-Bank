# Концептуальный уровень проектирования бд

## Выделение сущностей в бд
    - company (компания)
    - external_account (банковские счета компаний в других банках)
    - bank (банки на которые делают переводы)
    - account (внутренние счета)
    - transfer (перевод)

## Выделение связей
    - company 1->* external_account
    - bank 1->* external_account
    - company 1->* account
    - external_account 1->* transfer
    - account 1->* transfer