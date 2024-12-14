INSERT INTO CLIENTE (documento, email, nome)
VALUES ('87548309876', 'fulano@hotmail.com', 'Fulado da silva junior');
INSERT INTO CLIENTE (documento, email, nome)
VALUES ('98765467862', 'ciclano@gamail.com', 'Ciclano cavalcante dias');

INSERT INTO CATEGORIA(id, descricao)
VALUES (1, 'Lanche');
INSERT INTO CATEGORIA(id, descricao)
VALUES (2, 'Acompanhamento');
INSERT INTO CATEGORIA(id, descricao)
VALUES (3, 'Bebida');
INSERT INTO CATEGORIA(id, descricao)
VALUES (4, 'Sobremesa');

INSERT INTO STATUS_PAGAMENTO(id, descricao)
VALUES (1, 'Pendente');
INSERT INTO STATUS_PAGAMENTO(id, descricao)
VALUES (2, 'Aprovado');
INSERT INTO STATUS_PAGAMENTO(id, descricao)
VALUES (3, 'Recusado');
INSERT INTO STATUS_PAGAMENTO(id, descricao)
VALUES (4, 'Em Análise');
INSERT INTO STATUS_PAGAMENTO(id, descricao)
VALUES (5, 'Estornado');
INSERT INTO STATUS_PAGAMENTO(id, descricao)
VALUES (6, 'Cancelado');
INSERT INTO STATUS_PAGAMENTO(id, descricao)
VALUES (0, 'Desconhecido');

INSERT INTO STATUS_PEDIDO(id, descricao)
VALUES (1, 'Pendente');
INSERT INTO STATUS_PEDIDO(id, descricao)
VALUES (2, 'Recebido');
INSERT INTO STATUS_PEDIDO(id, descricao)
VALUES (3, 'Em Preparação');
INSERT INTO STATUS_PEDIDO(id, descricao)
VALUES (4, 'Pronto');
INSERT INTO STATUS_PEDIDO(id, descricao)
VALUES (5, 'Finalizado');
INSERT INTO STATUS_PEDIDO(id, descricao)
VALUES (6, 'Cancelado');
INSERT INTO STATUS_PEDIDO(id, descricao)
VALUES (0, 'Desconhecido');

INSERT INTO PRODUTO(valor, categoria_id, id, descricao, nome, imagem_url)
VALUES (9.90, 1, 'fc7c7f37-32ea-465c-ac4b-490685e5a55f', 'pao, salsicha, molho e ketchup', 'Cachorro quente', 'https://s2-receitas.glbimg.com/nhTnuFJn8-LKjqVgIn0tRvfyI3Y=/0x0:620x500/984x0/smart/filters:strip_icc()/s.glbimg.com/po/rc/media/2012/11/16/08_37_34_881_Cachorro_Quente_com_Leite_em_P_M_rcia_Cadore_Borin_620.jpg');
INSERT INTO PRODUTO(valor, categoria_id, id, descricao, nome, imagem_url)
VALUES (6, 3, 'fa0f9dde-b305-407b-869c-71045853dea8', 'Refrigerante 600ml de garrafa', 'Pepsi 600ml', 'https://io.convertiez.com.br/m/trimais/shop/products/images/846/medium/refrigerante-pepsi-600-ml_842.jpg');

INSERT INTO PEDIDO(tempo_espera, valor_total, data_hora_criacao, status_pedido_id, id_pedido, cliente_documento, status_pagamento_id)
VALUES (10, 99.80, NOW(), 1, 'd212192c-8155-440a-9eda-3d77732458bb', null, 1);
INSERT INTO PEDIDO(tempo_espera, valor_total, data_hora_criacao, status_pedido_id, id_pedido, cliente_documento, status_pagamento_id)
VALUES (10, 275.01, NOW(), 2, '6d597e32-62b5-4b1e-9696-eb794bbae188', '98765467862', 2);
INSERT INTO PEDIDO(tempo_espera, valor_total, data_hora_criacao, status_pedido_id, id_pedido, cliente_documento, status_pagamento_id)
VALUES (5, 60.00, NOW(), 3, '48e66cec-8437-461b-934e-407061894aed', null, 2);
INSERT INTO PEDIDO(tempo_espera, valor_total, data_hora_criacao, status_pedido_id, id_pedido, cliente_documento, status_pagamento_id)
VALUES (10, 98.50, NOW(), 4, 'cb2614b9-171c-4792-83d3-9fcdeef4e9ee', '98765467862', 2);

INSERT INTO PEDIDO_PRODUTOS(pedido_entity_id_pedido, produtos_id)
VALUES ('d212192c-8155-440a-9eda-3d77732458bb', 'fc7c7f37-32ea-465c-ac4b-490685e5a55f');
INSERT INTO PEDIDO_PRODUTOS(pedido_entity_id_pedido, produtos_id)
VALUES ('d212192c-8155-440a-9eda-3d77732458bb', 'fa0f9dde-b305-407b-869c-71045853dea8');
INSERT INTO PEDIDO_PRODUTOS(pedido_entity_id_pedido, produtos_id)
VALUES ('6d597e32-62b5-4b1e-9696-eb794bbae188', 'fa0f9dde-b305-407b-869c-71045853dea8');
INSERT INTO PEDIDO_PRODUTOS(pedido_entity_id_pedido, produtos_id)
VALUES ('48e66cec-8437-461b-934e-407061894aed', 'fa0f9dde-b305-407b-869c-71045853dea8');
INSERT INTO PEDIDO_PRODUTOS(pedido_entity_id_pedido, produtos_id)
VALUES ('cb2614b9-171c-4792-83d3-9fcdeef4e9ee', 'fc7c7f37-32ea-465c-ac4b-490685e5a55f');