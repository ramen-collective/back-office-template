INSTANCE         =
CATALOG_DATABASE =
BO_DATABASE      =
BUCKET           =

clean-catalog:
	gcloud sql import sql $(INSTANCE) gs://$(BUCKET)/operations/clean_all_tables.sql --database=$(CATALOG_DATABASE)

tags: clean-catalog
	gcloud sql import sql $(INSTANCE) gs://$(BUCKET)/operations/create_tags.sql --database=$(CATALOG_DATABASE)

user:
	gcloud sql import sql $(INSTANCE) gs://$(BUCKET)/operations/create_dummy_user.sql --database=$(BO_DATABASE)