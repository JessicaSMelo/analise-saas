# Análise de Dados SaaS - Projeto Completo

## Sobre o Projeto

Este projeto tem como objetivo analisar o comportamento de clientes de uma empresa SaaS, focando em métricas essenciais como **receita, churn, retenção, satisfação e crescimento**.

A análise foi desenvolvida utilizando:

* **SQL** para criação, exploração e transformação dos dados
* **Power BI** para visualização e geração de insights de negócio

Este projeto foi desenvolvido com dados simulados, representando um cenário realista de análise de dados em empresas SaaS, com foco na geração de insights para tomada de decisão.

A organização visual e a identidade do projeto foram estruturadas com apoio do Canva, com foco em uma apresentação clara e profissional dos resultados.

---

## Objetivo de Negócio

O projeto busca responder perguntas estratégicas como:

* Como está a evolução da receita ao longo do tempo?
* Quais canais trazem mais clientes?
* Quais planos possuem maior adesão?
* Como está o crescimento da base de usuários?
* Qual é a taxa de churn da empresa?
* Como está a retenção e satisfação dos clientes?

---

## Estrutura do Banco de Dados

O banco foi modelado do zero com foco em um sistema SaaS, incluindo:

* Criação das tabelas
* Definição de relacionamentos
* Geração de dados simulados

Isso permitiu uma análise completa e controlada do cenário.

### Principais tabelas:

* clientes
* planos
* assinaturas
* pagamentos
* cancelamentos
* acessos
* recomendacoes
* renovacoes

---

## Tecnologias Utilizadas

* SQL (MySQL)
* Power BI
* Modelagem de Dados
* Análise de Métricas SaaS

---

## Análises Exploratórias (SQL)

Foram desenvolvidas consultas SQL para explorar os dados e gerar métricas essenciais:

### Receita

* Receita total
* Evolução da receita ao longo do tempo
* Distribuição da receita por plano
* Distribuição da receita por estado

### Crescimento

* Evolução da base de clientes ao longo do tempo
* Composição da base de clientes por tipo de plano

### Perfil dos Clientes

* Análise de idade dos clientes
* Origem dos clientes (canais de aquisição)
* Distribuição geográfica dos clientes

### Retenção e Satisfação

* Taxa de retenção de clientes
* Análise de renovações por plano
* NPS (Net Promoter Score)

### Churn

* Receita perdida com cancelamentos
* Análise de cancelamentos por plano
* Motivos de cancelamento

Essas análises foram fundamentais para **entendimento dos dados e construção da base analítica utilizada no dashboard**.

---

## Dashboard (Power BI)

O dashboard foi desenvolvido com foco em **análise estratégica do negócio**, permitindo acompanhar as principais métricas de forma visual e intuitiva.

As visualizações foram organizadas para responder diretamente às perguntas de negócio, com foco em:

* Evolução da receita ao longo do tempo
* Origem e perfil dos clientes
* Crescimento da base de usuários
* Performance dos planos
* Comportamento do churn e retenção de clientes

As análises foram estruturadas para facilitar a identificação de padrões, tendências e oportunidades de melhoria.

O objetivo não foi replicar todas as análises exploratórias realizadas em SQL, mas sim **destacar as informações mais relevantes para tomada de decisão**.

---

## Exemplos do Dashboard

Resumo Executivo
<img width="1477" height="824" alt="image" src="https://github.com/user-attachments/assets/b93b331c-ad87-4741-8d45-26dd8a4ea17e" />

Faturamento
<img width="1483" height="822" alt="image" src="https://github.com/user-attachments/assets/d74c843a-3340-4209-a353-bed3dc5e2f27" />

Performace de Planos
<img width="1487" height="830" alt="image" src="https://github.com/user-attachments/assets/96e04104-72c3-4b4b-a197-c1f07dc749bf" />

Churn
<img width="1485" height="825" alt="image" src="https://github.com/user-attachments/assets/5c660f2f-3daf-46c3-a271-edf25ba94b9a" />

Renovações
<img width="1482" height="824" alt="image" src="https://github.com/user-attachments/assets/01b049c8-f6b5-4f81-adb1-57ab2dd86627" />


---

## Principais Insights

* O faturamento apresenta crescimento consistente ao longo dos meses, com aceleração no segundo semestre, indicando expansão da base de clientes e possível aumento na retenção

* Clientes adquiridos por indicação apresentam menor volume total, mas maior presença em planos superiores, indicando maior valor agregado e potencial de retenção

* O canal Google Ads apresenta maior volume de aquisição e geração de receita, enquanto clientes de origem orgânica possuem maior taxa de cancelamento, sugerindo diferenças no perfil e engajamento dos usuários adquiridos por canal

* O uso predominante ocorre via dispositivos mobile, sugerindo a importância de otimização da experiência mobile para retenção

* O volume de cancelamentos acompanha a distribuição de clientes por estado, indicando que o churn está mais relacionado ao crescimento da base do que a fatores regionais específicos

* A maior parte dos clientes está concentrada no modelo mensal, indicando menor compromisso de longo prazo e maior risco de churn

* O principal motivo de cancelamento é a falta de uso da plataforma, indicando baixo engajamento dos clientes e necessidade de estratégias de ativação e retenção

---

## Diferenciais do Projeto

* Modelagem de dados completa (do zero)
* Geração de dados simulados para cenário realista
* Separação entre análise exploratória (SQL) e análise estratégica (BI)
* Foco em tomada de decisão
* Organização visual e apresentação do projeto com apoio do Canva

---

## Como visualizar o projeto

Este projeto foi desenvolvido com foco em análise e apresentação de dados.

* As consultas SQL estão disponíveis na pasta `sql/`
* As visualizações foram construídas no Power BI

Para facilitar a análise, foram disponibilizados:

* Imagens do dashboard com os principais indicadores
* Vídeo demonstrando a navegação e interpretação dos dados

O foco deste projeto está na geração de insights para tomada de decisão.

---

## Conclusão

O projeto demonstra a aplicação prática de análise de dados em um cenário SaaS, abrangendo:

* Modelagem de dados
* Exploração com SQL
* Construção de métricas
* Visualização estratégica no Power BI

Com foco em **gerar insights acionáveis para tomada de decisão**.

---

## Contato

Desenvolvido por: Jéssica Sales

LinkedIn: https://www.linkedin.com/in/jessica-sales1910/

Sinta-se à vontade para entrar em contato para feedbacks ou troca de ideias!


