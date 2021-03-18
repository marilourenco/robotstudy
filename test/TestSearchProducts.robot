*** Settings ***
Resource        ../resource/Resource.robot
Test setup      Abrir Navegador
Test teardown   Fechar Navegador

*** Test Case ***
Cenario 01: Search Existing Products
    Given that I'm on the home page of the site
    When I search for the product "Blouse"
    Then the product "Blouse" must be listed on the search results page

# Cenario 02: Search for non-existent products
#     Given that I'm on the home page of the site
#     When I search for the product "Produto Inexistente"
#     Then the page should display the message "No results were found for your search "Produto Inexistente""
*** Keywords ***
