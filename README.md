# Fiapeats DB
Repositório do banco de dados utilizado pelo projeto Fiapeats.

## Visão Geral do Projeto

Este projeto tem como objetivo implementar um sistema de autoatendimento para uma lanchonete em expansão. O sistema visa solucionar os problemas de gerenciamento de pedidos, como confusão entre atendentes e cozinha, erros nos pedidos e atrasos na entrega. Um banco de dados robusto é essencial para armazenar e gerenciar as informações relacionadas aos pedidos, produtos, clientes e categorias.

### Contexto do Problema

Com o crescimento da lanchonete, a falta de um sistema de controle de pedidos torna o atendimento caótico e ineficiente. Exemplos de problemas:

- Pedidos complexos mal interpretados ou esquecidos.
- Erros na entrega dos pedidos.
- Dificuldades em gerenciar estoques e garantir agilidade no atendimento.

A solução proposta é um sistema de autoatendimento que permita aos clientes realizarem seus pedidos de forma autônoma e precisa, integrando-se com um banco de dados para gerenciar eficientemente os dados.

---

## Escolha do PostgreSQL

Optamos pelo **PostgreSQL** como o sistema gerenciador de banco de dados para este projeto devido a várias razões que se alinham com os requisitos do sistema:

### 1. **Confiabilidade e Robustez**
O PostgreSQL é conhecido por sua alta confiabilidade, garantindo que os dados sejam armazenados de forma segura e íntegra. Isso é fundamental em um ambiente onde os pedidos dos clientes devem ser gerenciados sem erros.

### 2. **Flexibilidade no Modelagem de Dados**
Com o suporte a diversos tipos de dados e funcionalidades como JSON, o PostgreSQL permite flexibilidade na modelagem de dados. Isso é útil para gerenciar informações complexas sobre produtos e pedidos personalizados.

### 3. **Desempenho e Escalabilidade**
Com capacidade de lidar com um grande volume de dados e conexões simultâneas, o PostgreSQL suporta o crescimento da lanchonete sem comprometer o desempenho.

### 4. **Integridade Referencial**
A gestão de chaves estrangeiras e restrições garante a integridade dos dados, como associar produtos corretamente aos pedidos e clientes às suas respectivas compras.

### 5. **Open Source e Comunidade Ativa**
Sendo um software de código aberto, o PostgreSQL oferece liberdade de uso sem custos de licenciamento, além de contar com uma comunidade ativa que disponibiliza documentação e suporte.

---

## Estrutura do Banco de Dados

### Tabelas Principais

#### 1. **Tabela `produto`**
Armazena os produtos disponíveis no cardápio, como hambúrgueres, bebidas e acompanhamentos.

| Campo          | Tipo       | Descrição                     |
|----------------|------------|---------------------------------|
| `id`           | UUID     | Identificador único do produto |
| `valor`        | NUMERIC    | Preço do produto em reais                |
| `descricao`    | VARCHAR       | Descrição do produto          |
| `nome`    | VARCHAR       | Nome do produto          |
| `imagem_url`    | VARCHAR       | URL da imagem ilustrativa do produto          |
| `categoria_id` | INTEGER    | Referência à tabela `categoria` |

#### 2. **Tabela `categoria`**
Classifica os produtos em categorias, como "Lanches", "Bebidas" e "Acompanhamentos".

| Campo  | Tipo    | Descrição                    |
|--------|---------|--------------------------------|
| `id`   | INTEGER  | Identificador único da categoria |
| `descricao` | VARCHAR | Descrição da categoria             |

#### 3. **Tabela `cliente`**
Registra os clientes que fazem pedidos no sistema.

| Campo       | Tipo       | Descrição                     |
|-------------|------------|---------------------------------|
| `documento`        | VARCHAR     | CPF/CNPJ do cliente |
| `nome`      | VARCHAR    | Nome do cliente               |
| `email`  | VARCHAR    | E-mail do cliente           |

#### 4. **Tabela `pedido`**
Armazena as informações sobre os pedidos realizados.

| Campo         | Tipo       | Descrição                     |
|---------------|------------|---------------------------------|
| `id_pedido`          | UUID     | Identificador único do pedido |
| `cliente_documento`  | VARCHAR    | Referência à tabela `cliente` |
| `data_hora_criacao`   | TIMESTAMP  | Data e hora da criação do pedido         |
| `id_status`      | INTEGER    | Identificador do status do pedido |
| `tempo_espera`      | INTEGER    | Tempo de espera aproximado em minutos da finalização do pedido |
| `valor_total`      | NUMERIC    | Valor total do pedido |

#### 5. **Tabela `pedido_produtos`**
Relaciona os produtos aos pedidos.

| Campo        | Tipo       | Descrição                               |
|--------------|------------|-------------------------------------------|
| `pedido_entity_id_pedido`  | UUID    | Referência à tabela `pedido`            |
| `produtos_id` | UUID    | Referência à tabela `produto`           |

---

## Benefícios do Banco de Dados na Solução do Problema

1. **Organização dos Pedidos**
   - O banco de dados garante que cada pedido seja registrado e associado ao cliente e aos produtos selecionados.
   
2. **Evita Erros e Confusões**
   - Com a integração do sistema com a cozinha, os pedidos são enviados de forma clara e precisa.

3. **Gestão de Estoque**
   - É possível rastrear os produtos mais vendidos e gerenciar os estoques de forma eficiente.

4. **Escalabilidade para Expansão**
   - O sistema suporta o aumento no volume de pedidos e clientes conforme a lanchonete expande.

---

## Como Executar o Banco de Dados

Este repositório tem como objetivo criar somente a infraestrutura do banco de dados na AWS RDS. Para executá-lo localmente, siga os seguintes passos:

1. **Configuração do PostgreSQL**
   - Instale o PostgreSQL em sua máquina.

2. **Criação do Banco de Dados**
   ```sql
   CREATE DATABASE fiapeatsdb;

2. **Execução dos scripts**
    - Execute o script sql 1_schema.sql para criação das tabelas e relacionamentos
    - Execute o script 2_data.sql para popular as tabelas com uma carga inicial de dados