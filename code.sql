INSTALL httpfs; INSTALL iceberg;
LOAD httpfs;  LOAD iceberg;

-- S3/MinIO
CREATE OR REPLACE SECRET minio_s3 (
  TYPE S3,
  KEY_ID  'minioadmin',
  SECRET  'minioadmin',
  ENDPOINT '<minio>:9000',
  URL_STYLE 'path',
  USE_SSL false
);

-- Auth ke REST Catalog (opsional jika katalog Anda butuh token/cred)
CREATE OR REPLACE SECRET iceberg_rest (
  TYPE ICEBERG,
  TOKEN 'dummy'
);

-- WAJIB: beri ENDPOINT (REST Catalog)
ATTACH 'icelake' AS icelake (
  TYPE ICEBERG,
  ENDPOINT 'http://<Lakekeeper_catalog>:8181/catalog/',
  SECRET iceberg_rest
);

CREATE SCHEMA IF NOT EXISTS icelake.datalake;

CREATE TABLE icelake.datalake.customer(
  customer_name STRING, customer_address STRING
);

INSERT INTO icelake.datalake.customer VALUES ('Dwicky Feriansyah Putra','Jakarta');
SELECT * FROM icelake.datalake.customer;