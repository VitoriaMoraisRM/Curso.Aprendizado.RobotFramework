*** Settings ***
Documentation       Documentação da API:        https://fakerestapi.azurewebsites.net/swagger/ui/index#/Books
Resource            ..//resource/ResourceAPI.robot
Suite Setup         Conectar a minha API

*** Test Cases ***
Buscar a listagem de todos os livros (GET em todos os livros)
    Requisitar todos os livros
    Conferir o Status code      200
    Conferir o reason       OK
    Conferir se retorna uma lista com "200" livros