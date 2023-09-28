playground for dbdocs 

1. creating some ddl 
2. transform postgress ddl to dbml 
3. build project 
4. publish project 



prerequisits
install dbdocs  `npm install -g dbdocs`
install dbml    `npm install -g @dbml/cli` 

how to 
create a single file with ddl name it `initial_ddl.sql`
run `sql2dbml initial_ddl.sql --postgres`
if no errros
run `sql2dbml initial_ddl.sql --postgres -o  mydatabase.dbml`

login to dbdocs cloud 
run `dbdocs login` 
copy token and add it to cli 
run `dbdocs build initial_ddl.sql`
choose name for the project 
go to web interface 

