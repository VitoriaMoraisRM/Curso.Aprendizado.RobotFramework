*** Settings ***
Resource          ..//resource/ResourceWeb.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Cases ***

Cenario 01 Quando o carrinho estiver vazio, deve ser exibida a mensagem: “Your shopping cart is empty”
    Dado que estou na pagina Home
    Quando clicar em cart
    Entao deve ser exibido a mensagem "Your shopping cart is empty."

Cenario 02 Ao adicionar um produto ao carrinho, o usuário deve ser questionado se deseja continuar comprando ou finalizar a compra
    Dado que estou na pagina do Produto "Blouse" a ser comprado
    Quando clicar em add to cart
    Entao deve ser questionado se deseja continuar comprando ou finalizar a compra

Cenario 03 Ao acessar o carrinho, deve ser possível excluir os produtos
    Dado que estou na pagina do Carrinho que contem produto "Blouse"
    Quando clicar em Excluir produto
    Entao deve ser exibido a mensagem "Your shopping cart is empty."

Cenario 04 No carrinho deve ser exibido o preço unitário do produto, total e a quantidade;
    Dado que estou na pagina do Carrinho que contem produto "Blouse"
    Quando o carrinho conter produtos
    Entao deve ser exibido o preço unitário do produto, total e a quantidade

Cenario 05 Deve ser exibido o total da compra
    Dado que estou na pagina do Carrinho que contem produto "Blouse"
    Quando o carrinho conter produtos
    Entao deve ser exibido o total da compra



