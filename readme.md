# Backend Market in AWS

Este repositorio contiene la configuración de Terraform para desplegar una API REST de Go en una instancia EC2 de AWS para un mercado en línea.

## Requisitos

- [Terraform](https://www.terraform.io/downloads.html) (versión compatible)
- [Go](https://golang.org/dl/) (si se desea ejecutar la API localmente)
- [AWS CLI](https://aws.amazon.com/cli/) (configurado con las credenciales de tu cuenta de AWS)

## Configuración

1. Clona este repositorio en tu máquina local:

```bash
git clone https://github.com/jnates/backend-market-in-aws.git
cd backend-market-in-aws
```


Edita el archivo variables.tf según tus necesidades. Puedes cambiar las variables como la región de AWS, el tipo de instancia y el AMI, entre otros.
Si deseas ejecutar la API localmente, navega al directorio cmd/api y ejecuta el siguiente comando:

```golang
    go run main.go
```
## Despliegue
Desde la raíz del repositorio, ejecuta los siguientes comandos para inicializar Terraform y aplicar la configuración:
```terraform
    terraform init
    terraform apply
```
Confirma la creación de los recursos en AWS siguiendo las instrucciones en la terminal.
Una vez que la instancia EC2 esté en ejecución, podrás probar la API utilizando herramientas como Postman o cURL.

## Limpieza
Para eliminar todos los recursos creados por Terraform, ejecuta el siguiente comando en la raíz del repositorio:

```terraform
    terraform destroy
```
