*** Settings ***
Documentation       Documentação da API:        https://fakerestapi.azurewebsites.net/swagger/ui/index#/Books
Resource            ..//resource/ResourceAPI.robot
Suite Setup         Conectar a minha API

*** Test Cases ***
Cadastrar um novo livro (POST)
    Cadastrar um novo livro
    Conferir se retorna todos os dados cadastrados para o novo livro
