*** Settings ***
Resource          ..//resource/ResourceWeb.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Cases ***
Cenario 01 Devem ser exibidos os menus: Woman, Dress e T-shirts
    Dado que estou na pagina Home
    Quando a pagina estiver carregada
    Então o Menu deve ser exibido com as opções

Cenario 02 No menu Woman, devem ser exibidos os submenus Tops, com as categorias T-shirts e Blouses, e Dresses, com as categorias Casual Dresses, Evening
    Dado que estou na pagina Home
    Quando Passar o mouse no menu Woman
    Então os submenus serão exibidos 

Cenario 03 No menu Dresses devem ser exibidas as categorias CASUAL DRESSES EVENING DRESSES SUMMER DRESSES
    Dado que estou na pagina Home
    Quando Passar o mouse no menu de categoria "DRESSES"
    Então sera exibida as categorias CASUAL DRESSES EVENING DRESSES SUMMER DRESSES

Cenario 04 Os menus devem ser clicáveis e ao acessá-los os produtos da categoria devem ser exibidos
    Dado que estou na pagina Home
    Quando eu Clicar no menu de categoria "DRESSES"
    Então os produtos da Sub-categoria "DRESSES" serão mostrados na pagina



