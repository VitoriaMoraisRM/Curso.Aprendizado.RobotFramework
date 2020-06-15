*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}    firefox
${URL}        http://automationpractice.com

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser  about:blank  ${BROWSER}

Fechar navegador
    Close Browser

### Tests
####ST1: Consultar produtos no site.
Dado que estou na pagina Home 
    Go To              ${URL}
    Title Should Be    My Store

Quando pesquisar pelo produto "${PRODUTO}"
    Input Text  name=search_query  ${PRODUTO}
    Click Element   name=submit_search

Então deve ser listado o produto
    Wait Until Element Is Visible   css=#center_column > h1
    Title Should Be                 Search - My Store
    Page Should Contain Image       xpath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img
    Page Should Contain Link        xpath=//*[@id="center_column"]/ul/li/div/div[2]/h5/a

Então deve ser exibido a mensagem "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible   //*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be          //*[@id="center_column"]/p[@class='alert alert-warning']  ${MENSAGEM_ALERTA}

Então deve ser alterado para Lista
    Click Element       xpath=//*[@id="list"]/a/i

E alterado para grid novamente
    Click Element       xpath=//*[@id="grid"]

Entao o total de itens foi exibido
    Page Should Contain Element     xpath=//*[@id="center_column"]/h1/span[2]

E quantidade de produtos por pagina
    Page Should Contain Element     xpath=//*[@id="center_column"]/div[1]/div[2]/div[2]


####Utilizar o carrinho de compras para adicionar e remover produtos.

Quando clicar em cart
    Click Element       xpath=//*[@id="header"]/div[3]/div/div/div[3]/div/a

Entao deve ser exibido a mensagem "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible   //*[@id="center_column"]/p
    Element Text Should Be          //*[@id="center_column"]/p  ${MENSAGEM_ALERTA}

Dado que estou na pagina do Produto "${PRODUTO}" a ser comprado
    Dado que estou na pagina Home
    Quando pesquisar pelo produto "${PRODUTO}"
    Click Element       xpath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img

Quando clicar em add to cart
    Click Element       name=Submit

Entao deve ser questionado se deseja continuar comprando ou finalizar a compra
    Page Should Contain Element     xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/span
    Page Should Contain Element     xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a

Dado que estou na pagina do Carrinho que contem produto "Blouse"
    Dado que estou na pagina do Produto "Blouse" a ser comprado
    Quando clicar em add to cart
    Wait Until Element Is Visible       xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/span
    Go To              ${URL}
    Quando clicar em cart

Quando clicar em Excluir produto
    Click Element       xpath=//*[@id="2_7_0_0"]
    
Quando o carrinho conter produtos
    Page Should Contain Element     xpath=//*[@id="cart_summary"]/thead/tr/th[1]

Entao deve ser exibido o preço unitário do produto, total e a quantidade
    Page Should Contain Element     xpath=//*[@id="product_price_2_7_0"]/span
    Page Should Contain Element     xpath=//*[@id="total_product_price_2_7_0"]
    Page Should Contain Element     xpath=//*[@id="product_2_7_0_0"]/td[5]/input[2]

Entao deve ser exibido o total da compra
    Page Should Contain Element        id=total_price

####ST3: Exibir as categorias de produtos no menu da página inicial.

Quando a pagina estiver carregada
    Title Should Be    My Store

Então o Menu deve ser exibido com as opções
    Page Should Contain Element     xpath=//*[@id="block_top_menu"]/ul/li[1]/a
    Page Should Contain Element     xpath=//*[@id="block_top_menu"]/ul/li[2]/a
    Page Should Contain Element     xpath=//*[@id="block_top_menu"]/ul/li[3]/a

Quando Passar o mouse no menu Woman
    Set Focus To Element        xpath=//*[@id="block_top_menu"]/ul/li[1]/a

Então os submenus serão exibidos
    Page Should Contain Element     xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[1]/ul/li[1]/a
    Page Should Contain Element     xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[1]/ul/li[2]/a
    Page Should Contain Element     xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[1]/a
    Page Should Contain Element     xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[2]/a
    Page Should Contain Element     xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a


Quando Passar o mouse no menu de categoria "DRESSES"
    Set Focus To Element        xpath=//*[@id="block_top_menu"]/ul/li[2]/a
    

Então sera exibida as categorias CASUAL DRESSES EVENING DRESSES SUMMER DRESSES
    Page Should Contain Element     xpath=//*[@id="block_top_menu"]/ul/li[2]/ul/li[1]/a
    Page Should Contain Element     xpath=//*[@id="block_top_menu"]/ul/li[2]/ul/li[2]/a
    Page Should Contain Element     xpath=//*[@id="block_top_menu"]/ul/li[2]/ul/li[3]/a

Quando eu Clicar no menu de categoria "DRESSES"
    Click Element   xpath=//*[@id="block_top_menu"]/ul/li[2]/a

Então os produtos da Sub-categoria "DRESSES" serão mostrados na pagina
    Page Should Contain Element     id=subcategories
    Page Should Contain Element     xpath=//*[@id="subcategories"]/ul/li[1]/h5/a
    Page Should Contain Element     xpath=//*[@id="subcategories"]/ul/li[2]/h5/a
    Page Should Contain Element     xpath=//*[@id="subcategories"]/ul/li[3]/h5/a

