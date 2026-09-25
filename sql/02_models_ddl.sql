-- ==============================================================================
-- 02_models_ddl.sql
-- Enterprise Multimodal Vector Search in Google Cloud Spanner
-- Vertex AI Model Registration: ImageEmbeddings and TextMultimodalEmbeddings
-- Model: multimodalembedding@001 (1408 dimensions)
-- Note: Replace ${PROJECT_ID} and ${REGION} with your actual GCP Project ID and Region.
-- ==============================================================================

CREATE OR REPLACE MODEL ImageEmbeddings
INPUT (
  image STRUCT<gcsUri STRING(MAX)>
)
OUTPUT (
  imageEmbedding ARRAY<FLOAT64>
)
REMOTE OPTIONS (
  endpoint = '//aiplatform.googleapis.com/projects/${PROJECT_ID}/locations/${REGION}/publishers/google/models/multimodalembedding@001',
  default_batch_size = 1
);

CREATE OR REPLACE MODEL TextMultimodalEmbeddings
INPUT (
  text STRING(MAX)
)
OUTPUT (
  textEmbedding ARRAY<FLOAT64>
)
REMOTE OPTIONS (
  endpoint = '//aiplatform.googleapis.com/projects/${PROJECT_ID}/locations/${REGION}/publishers/google/models/multimodalembedding@001',
  default_batch_size = 1
);
