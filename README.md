# Terrafarming Application

## Visão Geral

Este repositório contém o código para os microserviços e funções Lambda do aplicativo **Terrafarming**, uma solução de agricultura inteligente que utiliza inteligência artificial para fornecer recomendações aos agricultores com base em métricas do solo e condições climáticas. A infraestrutura é provisionada utilizando **Terraform** e os serviços são implementados na **AWS**.

## Estrutura do Repositório

Abaixo está a estrutura principal do repositório:

├── services/
│ ├── lambdas/
│ │ ├── image-analysis/
│ │ ├── weather-recommendation/
│ ├── microservices/
│ │ ├── farmer_service/
│ │ ├── soil-metrics-service/
│ │ ├── crop-health-service/
│ │ ├── equipment-health-service/
│ │ ├── weather-service/
│ │ ├── greenhouse-service/
│ │ ├── s3/
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ ├── modules/
├── scripts/
│ ├── build_and_push.sh
└── README.md


## Microserviços

### Farmer Service

Gerencia informações dos agricultores, incluindo operações CRUD.

- **POST /farmers**: Cria um novo agricultor.
- **GET /farmers/{id}**: Obtém informações de um agricultor.
- **PUT /farmers/{id}**: Atualiza informações de um agricultor.
- **DELETE /farmers/{id}**: Deleta um agricultor.

### Soil Metrics Service

Gerencia as métricas do solo (pH, umidade, temperatura).

- **POST /soil-metrics**: Adiciona métricas do solo.
- **GET /soil-metrics/{id}**: Obtém métricas do solo.
- **PUT /soil-metrics/{id}**: Atualiza métricas do solo.
- **DELETE /soil-metrics/{id}**: Deleta métricas do solo.

### Crop Health Service

Gerencia a saúde das colheitas.

- **POST /crop-health**: Adiciona informações de saúde da colheita.
- **GET /crop-health/{id}**: Obtém informações de saúde da colheita.
- **PUT /crop-health/{id}**: Atualiza informações de saúde da colheita.
- **DELETE /crop-health/{id}**: Deleta informações de saúde da colheita.

### Equipment Health Service

Gerencia a saúde dos equipamentos agrícolas.

- **POST /equipment-health**: Adiciona informações de saúde dos equipamentos.
- **GET /equipment-health/{id}**: Obtém informações de saúde dos equipamentos.
- **PUT /equipment-health/{id}**: Atualiza informações de saúde dos equipamentos.
- **DELETE /equipment-health/{id}**: Deleta informações de saúde dos equipamentos.

### Weather Service

Fornece informações climáticas e previsões.

- **GET /weather/current**: Obtém informações climáticas atuais.
- **GET /weather/forecast**: Obtém previsões climáticas.


### Greenhouse Service

Gerencia informações das estufas.

- **POST /greenhouse**: Adiciona uma nova estufa.
- **GET /greenhouse/{id}**: Obtém informações de uma estufa.
- **PUT /greenhouse/{id}**: Atualiza informações de uma estufa.
- **DELETE /greenhouse/{id}**: Deleta uma estufa.

## Funções Lambda

### Image Analysis

Utiliza o Amazon Rekognition para analisar imagens e fornecer métricas.

### Weather Recommendation

Fornece recomendações com base nas condições climáticas e métricas do solo.

## Infraestrutura

### Diagrama de Rede (High-Level)

- **Subnets Públicas**:
  - NAT Gateway
  - Load Balancer (se aplicável)
- **Subnets Privadas**:
  - Todos os microserviços
  - Funções Lambda
  - Banco de Dados (DynamoDB, RDS)

### Armazenamento de Dados no S3

O S3 é utilizado para armazenar imagens e dados brutos que serão processados pelas funções Lambda e pelos microserviços.

**Estrutura do Bucket**:

terrafarming-metrics-data-storage/
├── farmer_data/
│ ├── {farmer_id}/
│ │ ├── profile/
│ │ ├── soil_metrics/
│ │ ├── crop_health/
│ │ ├── equipment_health/
│ │ ├── greenhouse/
│ │ ├── weather/
├── logs/
│ ├── {service_name}/



## Configuração e Implantação

### Pré-requisitos

- Docker
- AWS CLI configurado
- Terraform instalado

### Instruções de Configuração

1. Clone o repositório:
    ```sh
    git clone https://github.com/vmb24/cloud-solutions-tf-vmb-challenge.git
    cd cloud-solutions-tf-vmb-challenge
    ```

2. Configure suas credenciais AWS e inicialize o Terraform:
    ```sh
    cd terraform
    terraform init
    ```

3. Aplique a configuração do Terraform:
    ```sh
    terraform apply
    ```

4. Construa e envie as imagens Docker para o ECR:
    ```sh
    cd scripts
    ./build_and_push.sh
    ```

## Contribuições

Contribuições são bem-vindas! Por favor, faça um fork do repositório e envie um pull request com suas alterações.

## Licença

Este projeto está sob a licença XYZ. Veja o arquivo LICENSE para mais detalhes.
