-- ==============================================================================
-- 05_vector_index_ddl.sql
-- Enterprise Multimodal Vector Search in Google Cloud Spanner
-- ScaNN Vector Index Creation & Metadata Monitoring
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- CREATE VECTOR INDEX: ProductsVectorIndex
-- Creates a ScaNN Approximate Nearest Neighbor (ANN) index on image_embedding.
-- Covering STORING clause includes all queried attributes to enable index-only scans.
-- ------------------------------------------------------------------------------
CREATE VECTOR INDEX ProductsVectorIndex
ON Products(image_embedding)
STORING (name, color, list_price, brand_id, category_id, image_gcs_uri)
WHERE image_embedding IS NOT NULL
OPTIONS (distance_type = 'COSINE');

-- ------------------------------------------------------------------------------
-- MONITORING QUERY: Check Index Backfill State
-- States: PREPARE -> WRITE_ONLY -> READ_WRITE (Ready to serve)
-- ------------------------------------------------------------------------------
SELECT table_name, index_name, index_state, index_type
FROM INFORMATION_SCHEMA.INDEXES
WHERE index_name = 'ProductsVectorIndex';
