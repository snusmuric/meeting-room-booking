# Meeting Room Booking Service

## How to Build and Install 

### Dev
1. To generate Liquibase changeset
 
 - copy liquibase-diff-example.properties to liquibase-diff.properties,
  edit properties to fit your needs and generate changeset with the command
 ```
mvn exec:exec -PliquibaseDiff
```
- rename resulting sql file to XXX - \<meaningful changeset name\>.sql
- add changeset file to liquibase master file: the db.changelog-master.xml