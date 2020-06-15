*** Settings ***
Resource          ..//resource/ResourceWeb.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Cases ***
Cenario 01 produto encontrado
    Dado que estou na pagina Home 
    Quando pesquisar pelo produto "Blouse"
    Então deve ser listado o produto

Cenario 02 produto inexistnte
    Dado que estou na pagina Home 
    Quando pesquisar pelo produto "ItemNãoExistente"
    Então deve ser exibido a mensagem "No results were found for your search "ItemNãoExistente""

Cenario 03 Ao realizar uma pesquisa, deve ser exibido o total de resultados
    Dado que estou na pagina Home 
    Quando pesquisar pelo produto "DRESS"
    Entao o total de itens foi exibido

Cenario 04 quando pesquisar produto deve ser exibido resultados em formato de grid e lista
    Dado que estou na pagina Home 
    Quando pesquisar pelo produto "DRESS"
    Então deve ser alterado para Lista  
    E alterado para grid novamente

cenario 05 Deve ser exibido o total de itens e quantidade por página
    Dado que estou na pagina Home 
    Quando pesquisar pelo produto "DRESS"
    Entao o total de itens foi exibido
    E quantidade de produtos por pagina