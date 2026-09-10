Análise de Carteira e Negociação de Dívidas com SQL

Projeto de análise de uma base fictícia de clientes, contratos, dívidas e negociações, desenvolvido para praticar SQL e análise de dados utilizando MySQL.

-- Objetivo
Criar e analisar uma base de dados fictícia voltada para cobrança e negociação de dívidas, utilizando consultas SQL para gerar indicadores e identificar padrões relacionados à inadimplência, risco, contatos e desempenho operacional.

-- Estrutura da Base
A tabela principal `base_negociacao_BULGARELLI` contém informações sobre:

* Clientes
* Contratos
* Tipos de empréstimo
* Valores de dívida
* Saldo de risco
* Dias de atraso
* Parcelas em atraso
* Tentativas de contato
* Status de negociação
* Canais de atendimento
* Funcionários responsáveis
* Datas de inclusão e atualização
* Indicadores de propensão e risco

Os dados utilizados são fictícios e foram criados exclusivamente para fins de estudo e portfólio.

-- Principais Análises
Foram desenvolvidas consultas para analisar:

* Quantidade total de clientes
* Quantidade de contratos
* Valor total das dívidas
* Valor total em atraso
* Saldo total de risco
* Quantidade de clientes inadimplentes
* Ticket médio das dívidas
* Maior dívida
* Média de dias de atraso
* Quantidade de tentativas de contato
* Inadimplência por tipo de empréstimo
* Distribuição por status de negociação
* Análise por canal de atendimento
* Desempenho por funcionário
* Ranking dos maiores devedores
* Distribuição das faixas de atraso
* Análise de parcelas
* Clientes com alto risco
* Clientes com muitas tentativas de contato e sem negociação

-- Recursos SQL Utilizados
Durante o projeto foram utilizados:

* `SELECT`
* `WHERE`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `CASE`
* `COUNT()`
* `SUM()`
* `AVG()`
* `MAX()`
* `MIN()`
* `ROUND()`
* `RANK()`
* `WITH` / CTE
* `CREATE VIEW`
* Funções de agregação
* Filtros e classificações
* Cálculo de percentuais

-- Indicadores
O projeto possui um painel geral de indicadores com informações sobre:

* Clientes
* Contratos
* Dívidas
* Saldo de risco
* Inadimplência
* Parcelas
* Dias de atraso
* Tentativas de contato

-- Tecnologias
* MySQL
* SQL
* Git
* GitHub

-- Destaques
O projeto utiliza uma base fictícia para simular um cenário de cobrança e negociação, permitindo aplicar SQL em análises semelhantes às encontradas em ambientes corporativos.

Entre os principais recursos estão a classificação de risco utilizando CTE, criação de VIEW para clientes inadimplentes, rankings, indicadores de carteira e análises de desempenho operacional.

-- Observação
Todos os dados utilizados neste projeto são fictícios e foram criados exclusivamente para fins de aprendizado, demonstração técnica e portfólio.
