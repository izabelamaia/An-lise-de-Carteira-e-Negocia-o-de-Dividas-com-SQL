

-- 3. INDICADORES GERAIS



-- TOTAL DE CLIENTES

SELECT
    COUNT(DISTINCT ID_cpf) AS Clientes
    FROM base_negociacao_BULGARELLI;



-- TOTAL DE CONTRATOS

SELECT
    COUNT(DISTINCT INDEX_codigo_contrato) AS Contratos
    FROM base_negociacao_BULGARELLI;



-- RISCO TOTAL

SELECT
    SUM(INDEX_saldo_risco) AS Saldo_Risco
    FROM base_negociacao_BULGARELLI;



-- TOTAL DA DÍVIDA

SELECT
    SUM(INDEX_valor_divida) AS Valor_Total
    FROM base_negociacao_BULGARELLI;



-- TOTAL EM ATRASO

SELECT
    SUM(
        CASE
            WHEN INDEX_dias_atraso > 0
            THEN INDEX_valor_divida
            ELSE 0
        END
    ) AS Total_Atraso
FROM base_negociacao_BULGARELLI;



-- CLIENTES INADIMPLENTES

SELECT
    COUNT(DISTINCT ID_cpf) AS Inadiplentes
FROM base_negociacao_BULGARELLI
WHERE INDEX_dias_atraso > 0;



-- TICKET MÉDIO DA DÍVIDA

SELECT
    ROUND(AVG(INDEX_valor_divida), 2) AS Ticket_Medio
    FROM base_negociacao_BULGARELLI;



-- MAIOR DÍVIDA

SELECT
    MAX(INDEX_valor_divida) AS Maior_Divida
    FROM base_negociacao_BULGARELLI;



-- MÉDIA DE DIAS DE ATRASO

SELECT
    ROUND(AVG(INDEX_dias_atraso), 2) AS Dias_Atraso_Media
    FROM base_negociacao_BULGARELLI;



-- TOTAL TENTATIVAS DE CONTATO

SELECT
    SUM(INDEX_tentativas_contato) AS Tentativas_Contato
    FROM base_negociacao_BULGARELLI;





-- 4. ANÁLISE POR TIPO DE EMPRÉSTIMO


SELECT
    DESC_emprestimo,
    COUNT(DISTINCT ID_cpf) AS Clientes,
    COUNT(DISTINCT INDEX_codigo_contrato) AS Contratos,
    SUM(INDEX_valor_divida) AS divida_total,
    ROUND(AVG(INDEX_valor_divida), 2) AS Ticket_Medio,
    ROUND(AVG(INDEX_dias_atraso), 2) AS Media_Dias_Atraso
FROM base_negociacao_BULGARELLI
GROUP BY DESC_emprestimo
ORDER BY divida_total DESC;





-- 5. ANÁLISE DE INADIMPLÊNCIA POR PRODUTO


SELECT
    DESC_emprestimo,

    COUNT(DISTINCT ID_cpf) AS total_clientes,

    COUNT(
        DISTINCT CASE
            WHEN INDEX_dias_atraso > 0
            THEN ID_cpf
        END
    ) AS clientes_inadimplentes,

    ROUND(
        COUNT(
            DISTINCT CASE
                WHEN INDEX_dias_atraso > 0
                THEN ID_cpf
            END
        )
        / COUNT(DISTINCT ID_cpf) * 100,
        2
    ) AS percentual_inadimplencia

FROM base_negociacao_BULGARELLI
GROUP BY DESC_emprestimo
ORDER BY percentual_inadimplencia DESC;





-- 6. ANÁLISE POR STATUS DA NEGOCIAÇÃO


SELECT
    SIST_status_negociacao,
    COUNT(DISTINCT ID_cpf) AS clientes,
    SUM(INDEX_valor_divida) AS valor_divida,
    SUM(INDEX_tentativas_contato) AS tentativas_contato
FROM base_negociacao_BULGARELLI
GROUP BY SIST_status_negociacao
ORDER BY valor_divida DESC;





-- 7. ANÁLISE POR CANAL


SELECT
    SIST_canal,
    COUNT(DISTINCT ID_cpf) AS clientes,
    SUM(INDEX_tentativas_contato) AS tentativas_contato,
    SUM(INDEX_valor_divida) AS valor_divida
FROM base_negociacao_BULGARELLI
GROUP BY SIST_canal
ORDER BY tentativas_contato DESC;





-- 8. CANAL X STATUS


SELECT
    SIST_canal,
    SIST_status_negociacao,
    COUNT(DISTINCT ID_cpf) AS quantidade_clientes,
    SUM(INDEX_valor_divida) AS valor_divida
FROM base_negociacao_BULGARELLI
GROUP BY
    SIST_canal,
    SIST_status_negociacao
ORDER BY
    SIST_canal,
    valor_divida DESC;





-- 9. PERFORMANCE POR FUNCIONÁRIO


SELECT
    SIST_id_funcionario,
    COUNT(DISTINCT ID_cpf) AS clientes_atendidos,
    SUM(INDEX_tentativas_contato) AS tentativas_contato,
    SUM(INDEX_valor_divida) AS valor_divida
FROM base_negociacao_BULGARELLI
GROUP BY SIST_id_funcionario
ORDER BY valor_divida DESC;





-- 10. PROMESSAS DE PAGAMENTO POR FUNCIONÁRIO


SELECT
    SIST_id_funcionario,
    COUNT(*) AS quantidade_promessas,
    SUM(INDEX_valor_divida) AS valor_das_dividas
FROM base_negociacao_BULGARELLI
WHERE SIST_status_negociacao = 'Promessa de pagamento'
GROUP BY SIST_id_funcionario
ORDER BY quantidade_promessas DESC;





-- 11. CLIENTES SEM CONTATO


SELECT
    ID_nome,
    ID_cpf,
    ID_contato,
    INDEX_valor_divida,
    INDEX_dias_atraso,
    SIST_canal
FROM base_negociacao_BULGARELLI
WHERE SIST_status_negociacao = 'Sem contato'
ORDER BY INDEX_valor_divida DESC;





-- 12. MAIORES DEVEDORES


SELECT
    ID_nome,
    DESC_emprestimo,
    INDEX_codigo_contrato,
    INDEX_valor_divida,
    INDEX_dias_atraso
FROM base_negociacao_BULGARELLI
ORDER BY INDEX_valor_divida DESC
LIMIT 10;





-- 13. FAIXA DE ATRASO


SELECT
    ID_nome,
    INDEX_dias_atraso,

    CASE
        WHEN INDEX_dias_atraso <= 30 THEN '01-30 dias'
        WHEN INDEX_dias_atraso <= 60 THEN '31-60 dias'
        WHEN INDEX_dias_atraso <= 90 THEN '61-90 dias'
        ELSE 'Mais de 90 dias'
    END AS faixa_atraso

FROM base_negociacao_BULGARELLI
ORDER BY INDEX_dias_atraso DESC;





-- 14. DISTRIBUIÇÃO DA CARTEIRA POR FAIXA DE ATRASO


SELECT

    CASE
        WHEN INDEX_dias_atraso <= 30 THEN '01-30 dias'
        WHEN INDEX_dias_atraso <= 60 THEN '31-60 dias'
        WHEN INDEX_dias_atraso <= 90 THEN '61-90 dias'
        ELSE 'Mais de 90 dias'
    END AS faixa_atraso,

    COUNT(DISTINCT ID_cpf) AS clientes,

    SUM(INDEX_valor_divida) AS valor_divida,

    ROUND(AVG(INDEX_valor_divida), 2) AS ticket_medio

FROM base_negociacao_BULGARELLI
GROUP BY faixa_atraso
ORDER BY
    MIN(INDEX_dias_atraso);





-- 15. RANKING DOS MAIORES DEVEDORES


SELECT
    ID_nome,
    INDEX_valor_divida,

    RANK() OVER (
        ORDER BY INDEX_valor_divida DESC
    ) AS ranking_divida

FROM base_negociacao_BULGARELLI;





-- 16. RANKING DE FUNCIONÁRIOS POR VALOR DA CARTEIRA


SELECT
    SIST_id_funcionario,

    COUNT(DISTINCT ID_cpf) AS clientes,

    SUM(INDEX_valor_divida) AS valor_divida,

    RANK() OVER (
        ORDER BY SUM(INDEX_valor_divida) DESC
    ) AS ranking

FROM base_negociacao_BULGARELLI

GROUP BY SIST_id_funcionario;





-- 17. ANÁLISE DE PARCELAS


SELECT

    SUM(INDEX_parcela_atraso) AS parcelas_em_atraso,

    SUM(INDEX_parcelas_totais) AS parcelas_totais,

    ROUND(
        SUM(INDEX_parcela_atraso)
        / SUM(INDEX_parcelas_totais) * 100,
        2
    ) AS percentual_parcelas_em_atraso,

    ROUND(
        (
            SUM(INDEX_parcelas_totais)
            - SUM(INDEX_parcela_atraso)
        )
        / SUM(INDEX_parcelas_totais) * 100,
        2
    ) AS percentual_parcelas_nao_atrasadas

FROM base_negociacao_BULGARELLI;





-- 18. CLIENTES COM ALTO ATRASO E ALTA DÍVIDA


SELECT
    ID_nome,
    INDEX_valor_divida,
    INDEX_dias_atraso,
    INDEX_tentativas_contato,
    SIST_status_negociacao

FROM base_negociacao_BULGARELLI

WHERE INDEX_dias_atraso > 60
  AND INDEX_valor_divida > 5000

ORDER BY INDEX_valor_divida DESC;





-- 19. CLIENTES COM MUITAS TENTATIVAS E SEM NEGOCIAÇÃO


SELECT
    ID_nome,
    INDEX_tentativas_contato,
    INDEX_valor_divida,
    INDEX_dias_atraso,
    SIST_status_negociacao

FROM base_negociacao_BULGARELLI

WHERE INDEX_tentativas_contato >= 7
  AND SIST_status_negociacao IN ('Sem contato', 'Em atraso')

ORDER BY INDEX_tentativas_contato DESC;




-- 20. CTE — CLASSIFICAÇÃO DE RISCO


WITH classificacao AS (

    SELECT

        ID_nome,
        INDEX_valor_divida,
        INDEX_dias_atraso,

        CASE
            WHEN INDEX_dias_atraso <= 30 THEN 'Baixo'
            WHEN INDEX_dias_atraso <= 60 THEN 'Médio'
            WHEN INDEX_dias_atraso <= 90 THEN 'Alto'
            ELSE 'Crítico'
        END AS nivel_risco

    FROM base_negociacao_BULGARELLI
)

SELECT

    nivel_risco,

    COUNT(*) AS quantidade_clientes,

    SUM(INDEX_valor_divida) AS valor_divida,

    ROUND(
        AVG(INDEX_valor_divida),
        2
    ) AS ticket_medio

FROM classificacao

GROUP BY nivel_risco

ORDER BY
    CASE nivel_risco
        WHEN 'Baixo' THEN 1
        WHEN 'Médio' THEN 2
        WHEN 'Alto' THEN 3
        WHEN 'Crítico' THEN 4
    END;





-- 21. CTE — MAIORES DÍVIDAS ACIMA DA MÉDIA


WITH media_divida AS (

    SELECT
        AVG(INDEX_valor_divida) AS media
    FROM base_negociacao_BULGARELLI
)

SELECT
    ID_nome,
    INDEX_valor_divida

FROM base_negociacao_BULGARELLI

WHERE INDEX_valor_divida >
      (SELECT media FROM media_divida)

ORDER BY INDEX_valor_divida DESC;





-- 22. VIEW — CLIENTES INADIMPLENTES


DROP VIEW IF EXISTS vw_clientes_inadimplentes;

CREATE VIEW vw_clientes_inadimplentes AS

SELECT

    ID_nome,
    ID_cpf,
    DESC_emprestimo,
    INDEX_codigo_contrato,
    INDEX_valor_divida,
    INDEX_dias_atraso,
    INDEX_tentativas_contato,
    SIST_status_negociacao,
    SIST_canal,

    CASE
        WHEN INDEX_dias_atraso <= 30 THEN '01-30 dias'
        WHEN INDEX_dias_atraso <= 60 THEN '31-60 dias'
        WHEN INDEX_dias_atraso <= 90 THEN '61-90 dias'
        ELSE 'Mais de 90 dias'
    END AS faixa_atraso

FROM base_negociacao_BULGARELLI

WHERE INDEX_dias_atraso > 0;


-- CONSULTA DA VIEW

SELECT *
FROM vw_clientes_inadimplentes;





-- 23. PAINEL GERAL DE INDICADORES


SELECT

    COUNT(DISTINCT ID_cpf)
        AS total_clientes,

    COUNT(DISTINCT INDEX_codigo_contrato)
        AS total_contratos,

    SUM(INDEX_saldo_risco)
        AS saldo_risco_total,

    SUM(INDEX_valor_divida)
        AS valor_total_divida,

    SUM(
        CASE
            WHEN INDEX_dias_atraso > 0
            THEN INDEX_valor_divida
            ELSE 0
        END
    )
        AS valor_total_em_atraso,

    COUNT(
        DISTINCT CASE
            WHEN INDEX_dias_atraso > 0
            THEN ID_cpf
        END
    )
        AS clientes_inadimplentes,

    ROUND(
        AVG(INDEX_valor_divida),
        2
    )
        AS ticket_medio_divida,

    MAX(INDEX_valor_divida)
        AS maior_divida,

    ROUND(
        AVG(INDEX_dias_atraso),
        2
    )
        AS media_dias_atraso,

    SUM(INDEX_parcela_atraso)
        AS parcelas_em_atraso,

    SUM(INDEX_parcelas_totais)
        AS parcelas_totais,

    ROUND(
        SUM(INDEX_parcela_atraso)
        / SUM(INDEX_parcelas_totais) * 100,
        2
    )
        AS percentual_parcelas_em_atraso,

    SUM(INDEX_tentativas_contato)
        AS total_tentativas_contato

FROM base_negociacao_BULGARELLI;
