# Meeting Room Booking Service

### Development

#### Database
1. To generate Liquibase changeset
 
 - copy liquibase-diff-example.properties to liquibase-diff.properties,
  edit properties to fit your needs and generate changeset with the command
 ```
mvn exec:exec -PliquibaseDiff
```
- rename resulting sql file to XXX - \<meaningful changeset name\>.sql
- add changeset file to the liquibase master file: db.changelog-master.xml