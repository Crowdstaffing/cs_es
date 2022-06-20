FROM docker.elastic.co/elasticsearch/elasticsearch:7.15.2
RUN ./bin/elasticsearch-plugin install -b --batch repository-s3
RUN ./bin/elasticsearch-plugin install  --batch ingest-attachment

COPY s3_backup.sh s3_backup.sh ./
COPY create_ingest_pipeline.sh s3_backup.sh ./
RUN chmod +x s3_backup.sh
RUN chmod +x create_ingest_pipeline.sh
#RUN create_ingest_pipeline.sh

