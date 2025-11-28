import dlt
from dlt.sources.sql_database import sql_database
from pathlib import Path

# Constant paths
DATA_PATH = Path(__file__).parent / 'data'
SQLITE_PATH = DATA_PATH / 'sqlite-sakila.db'
DUCKDB_PATH = DATA_PATH / 'sakila.duckdb'

#SQLite source (sakila db)
source =sql_database(credentials=f"sqlite:///{SQLITE_PATH}", schema="main")

# Define pipeline
pipeline = dlt.pipeline(
    pipeline_name="sakila_loader",
    destination=dlt.destinations.duckdb(duckdb_path=DUCKDB_PATH),
    dataset_name="staging"
)

# Load data into DuckDB, run pipeline
load_info = pipeline.run(source, write_disposition="replace")

print(load_info)