CREATE TABLE "medical_histories"(
    "id" INTEGER NOT NULL,
    "admited_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    ADD PRIMARY KEY("id")
);
CREATE TABLE "patients"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL,
    ADD PRIMARY KEY("id")
);

CREATE TABLE "treatments"(
    "id" INTEGER NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "name" DATE NOT NULL,
    ADD PRIMARY KEY("id")
    CONSTRAINT fk_medical_histories FOREIGN KEY(id) REFERENCES medical_histories(id),
);

CREATE TABLE "invoice_items"(
    "id" INTEGER NOT NULL,
    "unit_price" DECIMAL NOT NULL,
    "quantity" INTEGER,
    "total_price" INTEGER,
    "invoice_id" INTEGER,
    "treatment_id" INTEGER,
    CONSTRAINT fk_treatment FOREIGN KEY(treatment_id) REFERENCES treatments(id),
    CONSTRAINT fk_invoices FOREIGN KEY(invoice_id) REFERENCES invoices(id),
    ADD PRIMARY KEY("id")
);
CREATE TABLE "invoices"(
    "id" INTEGER NOT NULL,
    "total_amount" DECIMAL,
    "generated_at" TIMESTAMP,
    "paye_at" TIMESTAMP,
    "medical_history_id" INTEGER,
    CONSTRAINT fk_invoice_items FOREIGN KEY(id) REFERENCES owners(id),
    ADD PRIMARY KEY("id")
);