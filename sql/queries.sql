/* =========================================================
    1. VISÃO GERAL DO NEGÓCIO (RECEITA)
   ========================================================= */

-- Receita total
-- Receita total gerada pela plataforma no período analisado
SELECT 
	SUM(valor_pago) AS receita_total
FROM pagamentos;


-- Receita mensal
-- Evolução da receita ao longo do tempo (crescimento e tendência)
SELECT 
    DATE_FORMAT(p.data_pagamento, '%Y-%m') AS mes,
    ROUND(SUM(p.valor_pago), 2) AS receita_total
FROM pagamentos p
GROUP BY DATE_FORMAT(p.data_pagamento, '%Y-%m')
ORDER BY DATE_FORMAT(p.data_pagamento, '%Y-%m');


/* =========================================================
    2. CRESCIMENTO DA BASE DE CLIENTES
   ========================================================= */

-- Base total de clientes ao longo do tempo
-- Permite acompanhar a evolução e tendência de crescimento da plataforma
SELECT 
    DATE_FORMAT(data_cadastro, '%Y-%m') AS mes,
    COUNT(*) AS qtd_clientes
FROM clientes
GROUP BY DATE_FORMAT(data_cadastro, '%Y-%m')
ORDER BY DATE_FORMAT(data_cadastro, '%Y-%m');

-- Base de clientes por tipo de plano
-- Permite analisar preferencias de clientes em relação a duração dos planos
SELECT 
	p.tipo,
    COUNT(a.id) AS qtd_clientes
FROM assinaturas a
JOIN planos p ON a.plano_id = p.id
WHERE a.status = 'ativa'
GROUP BY p.tipo
ORDER BY COUNT(a.id) DESC;


/* =========================================================
    3. ORIGEM DA RECEITA 
   ========================================================= */

-- Receita por plano
-- Receita segmentada por plano para entender qual produto gera mais valor
SELECT 
    pl.id,
    pl.nome AS plano,
    pl.tipo AS tipo_plano,
    SUM(p.valor_pago) AS receita_total_plano
FROM pagamentos p
JOIN assinaturas a ON p.assinatura_id = a.id
JOIN planos pl ON a.plano_id = pl.id
GROUP BY pl.id, pl.nome, pl.tipo
ORDER BY SUM(p.valor_pago) DESC;


/* Receita por estado */
-- Receita por estado para identificar regiões com maior potencial de mercado
SELECT 
    c.uf AS estado,
    COUNT(DISTINCT c.id) AS qtd_clientes,
    SUM(p.valor_pago) AS receita_total_estado
FROM pagamentos p
JOIN assinaturas a ON p.assinatura_id = a.id
JOIN clientes c ON a.cliente_id = c.id
GROUP BY c.uf
ORDER BY SUM(p.valor_pago) DESC;


/* =========================================================
    4. PERFIL DOS CLIENTES
   ========================================================= */

-- Distribuição por faixa etária 
-- Segmentação para direcionar estratégias de marketing e personalização de produto por geração
SELECT 
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) < 25 THEN 'Até 25'
        WHEN TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) < 35 THEN '25-34'
        WHEN TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) < 45 THEN '35-44'
        WHEN TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) < 55 THEN '45-54'
        ELSE '55+'
    END AS faixa_etaria,
    COUNT(*) AS qtd_clientes
FROM clientes
GROUP BY faixa_etaria
ORDER BY COUNT(*) DESC;

-- Distribuição de clientes por canais/origens
-- Permite direcionar foco para os canais que mais trazem novos clientes
SELECT 
    origem,
    COUNT(*) AS qtd_clientes
FROM clientes
GROUP BY origem
ORDER BY qtd_clientes DESC;

/* =========================================================
    5. RETENÇÃO E SATISFAÇÃO
   ========================================================= */

-- Taxa de retenção de clientes
-- Indica a capacidade da plataforma de manter clientes ativos ao longo do tempo
SELECT 
    ROUND(
        SUM(CASE WHEN status = 'ativa' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS taxa_retencao
FROM assinaturas;

-- Renovações por plano
-- Mede retenção (volume) dos planos para saber qual mais retem clientes
SELECT 
    pl.nome AS plano,
    COUNT(r.id) AS qtd_renovacoes
FROM renovacoes r
JOIN assinaturas a ON r.assinatura_id = a.id
JOIN planos pl ON a.plano_id = pl.id
GROUP BY pl.nome
ORDER BY COUNT(r.id) DESC;


-- NPS (Net Promoter Score) 
-- Mede a satisfação dos clientes e permite avaliar melhorias
SELECT 
    SUM(promotor) AS promotores,
    SUM(neutro) AS neutros,
    SUM(detrator) AS detratores,
    ROUND((SUM(promotor) - SUM(detrator)) * 100.0 / COUNT(*), 2) AS nps_score
FROM (
    SELECT 
        CASE WHEN nota >= 9 THEN 1 ELSE 0 END AS promotor,
        CASE WHEN nota BETWEEN 7 AND 8 THEN 1 ELSE 0 END AS neutro,
        CASE WHEN nota <= 6 THEN 1 ELSE 0 END AS detrator
    FROM recomendacoes
) classificacao;


/* =========================================================
    6. CHURN (PERDA DE CLIENTES)
   ========================================================= */
   
-- Receita perdida com cancelamentos 
-- Impacto financeiro do churn com base em valores de contrato (churn de MRR)
SELECT 
    SUM(a.valor) AS receita_total_perdida
FROM cancelamentos c
JOIN assinaturas a ON c.assinatura_id = a.id;


-- Planos mais cancelados 
-- Identifica planos com maior churn
SELECT 
	pl.nome,
    COUNT(c.id) qtd_cancelamentos
FROM cancelamentos c
JOIN assinaturas a ON c.assinatura_id = a.id
JOIN planos pl ON a.plano_id = pl.id
GROUP BY pl.nome
ORDER BY qtd_cancelamentos DESC;


-- Motivos de cancelamento 
-- Principais causas do churn
SELECT 
	motivo,
    COUNT(*) AS qtd_cancelamentos
FROM cancelamentos
GROUP BY motivo
ORDER BY qtd_cancelamentos DESC;

