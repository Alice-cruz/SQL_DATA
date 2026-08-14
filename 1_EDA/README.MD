# Projeto de Analise Exploratoria de Dados  
A base é no modelo Star Schema, com uma fato
`job_posting_fact` e outras três dimensões:
`skills_jobs_dim`, `company_dim`, `skill_dim`
![Estrutura dos Dados](./IMAGES/1_2_Data_Warehouse.png)

# Problema e Contextualização  
Os analistas precisam responder questões como: 

- **Quais as skills mais demandadas** *quais estão sendo mais desejadas para os data engineers?*
- **Mais bem pagas** *quais skills estão sendo mais remuneradas?*

# Tech Stack   
- Query Engine: DuckDB para OLAP-style 
- Language: SQL
- Data Model: Star schema with fact + dimension
- Development: VS Code SQL editing + Terminal for DuckDB CLI
- Version Control: Git/GitHub

