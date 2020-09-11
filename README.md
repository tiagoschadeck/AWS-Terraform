## AWS-Terraform - Autor: Tiago Schadeck

A partir deste repositório você terá acesso à um conjunto de arquivos para o Terraform, combinados com procedimentos que permitirão a criação de uma infraestrutura elástica de dois clusters com Containers executando uma aplicação de exemplo com Node.js, considerando que um cluster fará o papel de frontend e um segundo o de  backend, apenas o backend possui comunicação com o banco de dados que neste exemplo, será um MySQL concebido através do serviço RDS.  

Serviços utilizados nesta solução:
    - VPC  
    - Subnets públicas e privadas
    - Internet Gateway
    - NAT Gateway
    - Rotas e associações
    - Security Groups
    - ECS - Cluster de Containers para Frontend
    - ECS - Cluster de Containers para Backend
    - Elastic Load Balance, ALB para Frontend e NLB para Backend
    - RDS (MySQL)

Configuração da arquitetura:
    - Região: **us-east-1**
    - Zona de disponibilidade 1 e 2: **us-east-1a e us-east-1b**
    - Bloco IP da VPC: **10.0.0.0/16**
    - Subnet para Frontend: **10.0.0.0/23**
    - Subnet para Backend: **10.0.10.0./23**
    - Subnet para DB: **10.0.20.0./23**
    - Image ID: **ami-0e2efdaddecea9838 (Linux AWS)**
    - Banco de dados: **MySQL (RDS)**
    - Serviço dos Containers: **Node.js**
    - Cluster Frontend: **2 Instâncias EC2 com 1 container cada**
    - Cluster Backend: **2 Instâncias EC2 com 1 container cada**
    - Master password do MySQL para usuário admin: **tA909YlVDXOQTfaERTOK**


1.  Instalar e configurar o AWS Command Line
   - Obter o AWS Command Line (awscli), abaixo link para ajuda.
      https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-install.html   
   -  Configurar o AWS Command Line com suas credenciais AWS
      https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-configure.html

2.  Instalar o Terraform, para mais detalhes use os links abaixo :
   -  https://learn.hashicorp.com/terraform/getting-started/install.html

3.  Faça o clone do repositório, aqui você vai precisar do git :
    `$ git clone https://github.com/tiagoschadeck/AWS-Terraform.git`
    * Caso preferir, pode baixar o zip do repositório Git.

4.  Vamos criar o repositório no serviço ECR da AWS para armazenar as imagens criadas com o Docker client:
    `$ cd Containers/Amazon_ECS/
    $ terraform init
    $ terraform validate
    $ terraform plan --out plano.out
    $ terraform apply plano.out`

5.  Inicializar o Terraform no diretório do projeto:
    `$ cd ../../Terraform/
    $ terraform init
    $ terraform validate`

6.  Criar suas chaves ssh no diretório do projeto:
`    $ ssh-keygen -f chave`

7. Copiar o conteúdo da chave e colar na respectiva variável no arquivo **vars.tf**

8. Criar o plano de implementação:
    `$ terraform plan --out plano.out`

9.  Se você não alterou os arquivos .tf, deve receber uma mensagem com  no exemplo abaixo:
    `Plan: 15 to add, 0 to change, 0 to destroy.
    ------------------------------------------------------------------------
    This plan was saved to: plano.out
    To perform exactly these actions, run the following command to apply:
    terraform apply "plano.out"`

10.  Agora é a hora de criar nossa infraestrutura AWS, vamos aplicar o plano com as configurações:
    `$ terraform apply plano.out`

    * Você receberá uma mensagem de erro, isso se deve ao fato do target no load balancer não possuir nenhuma instância criada, as instâncias e containers estão sendo criados automaticamente. Para concluir o processo, repita os comandos:
    `$ terraform plan --out plano.out
    $ terraform apply plano.out`

11.  Precisamos agora consultar os endereços dos serviços de load balancer e banco de dados para que possamos utilizá-los em seguida:
    `$ terraform show | grep "address" | grep mysql`

12. Vamos executar o scritp que criará a tabela:
    `$ cd Database
    $  ./deploy_table.sh "mysql.cp10t6deoe81.us-east-1.rds.amazonaws.com"`
   * Obs: Substitua o endereço do exemplo acima pelo endereço identificado na consulta do passo 9.

13. Exclua o arquivo **security_group.tf** e renomeie o arquivo  **security_group.tf-final** para **security_group.tf** através dos comandos abaixo:
    `$ rm -f security_group.tf
    $  mv -v security_group.tf-final security_group.tf`

    * Repita os comandos para que a alteração seja realizada na AWS:
    `$ terraform plan --out plano.out
    $ terraform apply plano.out`

13. Agora, criaremos nossas imagens que serão utilizadas nos Containers:
   - Consulte o nome do loab balancer interno do Backend:
   `$ terraform show | grep "dns_name" | grep elb-back`

   - Consulte o nome do serviço RDS de banco de dados:
   `$ terraform show | grep "address" | grep mysql`

   - Consulte as credenciais de acesso ao repositório na página do serviço "ECR
Repositories" selecionando o repositório e clicando em "View push commands" para construirmos e enviarmos a imagem.

    - Realize o login no serviço:
    `$ aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 354793276020.dkr.ecr.us-east-1.amazonaws.com`

    - Atualize o endereço do load balancer de Backend na variável BACKEND_HOST no arquivo **.env**:
    `$ vim .env

      SERVICE_PORT = '80'
      BACKEND_HOST = 'elb-back-b12ae7065263994d.elb.us-east-1.amazonaws.com'
      BACKEND_PORT = '80'`

    - Crie a imagem do Frontend e envia-la para o repositório:
     `$ cd ../front/
     $ docker build -t front .
     $ docker tag front:latest 354793276020.dkr.ecr.us-east-1.amazonaws.com/front:latest
     $ docker push 354793276020.dkr.ecr.us-east-1.amazonaws.com/front:latest`

     - Atualize o endereço do load balancer de Backend na variável BACKEND_HOST no arquivo **.env**:
     `$ vim .env

     SERVICE_PORT = '80'
     MYSQL_HOST = 'mysql.cp10t6deoe81.us-east-1.rds.amazonaws.com'
     MYSQL_USER = 'admin'
     MYSQL_PASSWORD = 'tA909YlVDXOQTfaERTOK'
     MYSQL_DB = 'preferences'`

    - Crie a imagem do Backend e envia-la para o repositório:
      `$ cd ../back/
      $ docker build -t back .
      $ docker tag back:latest 354793276020.dkr.ecr.us-east-1.amazonaws.com/back:latest
      $ docker push 354793276020.dkr.ecr.us-east-1.amazonaws.com/back:latest`


14. Finalmente vamos testar nossa infraestrutura, termine as instâncias EC2 manualmente que o Auto Scaling criará instâncias com as configurações da aplicação atualizadas acesse o URL do ALB. Para saber o endereço, consulte com este comando:
   `$ terraform show | grep "dns_name" | grep alb-front`
