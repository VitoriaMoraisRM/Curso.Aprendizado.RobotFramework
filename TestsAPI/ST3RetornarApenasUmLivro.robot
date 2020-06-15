*** Settings ***
Documentation       Documentação da API:        https://fakerestapi.azurewebsites.net/swagger/ui/index#/Books
Resource            ..//resource/ResourceAPI.robot
Suite Setup         Conectar a minha API

*** Test Cases ***
Buscar um livro especifico (GET em um livro especifico)
    Requisitar o livro "15"
    Conferir o Status code      200
    Conferir o reason       OK
    Conferir se retorna todos os dados corretos do livro 15