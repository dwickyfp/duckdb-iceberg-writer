# DuckDB Iceberg Writer

This repository shows how to use DuckDB 1.4.0 to write data into Apache Iceberg tables.

## Requirements
- Docker 24 or newer
- Docker Compose V2
- Optional: DuckDB CLI 1.4.0 for running the SQL scripts locally

## Getting Started
1. Launch the local Iceberg dependencies:
   ```bash
   docker compose up -d
   ```
2. Populate the Iceberg table by running the sample script:
   ```bash
   duckdb < code.sql
   ```
3. Inspect the table contents or adjust the SQL in `code.sql` to experiment with different datasets.

If you prefer to run with MinIO as the object store, use `docker-compose-minio.yml` instead:
```bash
docker compose -f docker-compose-minio.yml up -d
```

## Project Layout
- `code.sql` – Example DuckDB statements that create and populate an Iceberg table.
- `docker-compose.yml` – Default Docker stack for running Iceberg services locally.
- `docker-compose-minio.yml` – Alternative stack that swaps in MinIO for object storage.
- `duckdb-code/` – Workspace that stores the sample DuckDB database and metadata files.

## Next Steps
- Modify `code.sql` to write additional tables or experiment with Iceberg features such as partition evolution.
- Point DuckDB at your own data files and run the same workflow to materialize Iceberg tables.

## References
- https://duckdb.org/docs/extensions/iceberg
- https://iceberg.apache.org/docs/latest/
