*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${URL}       http://automationpractice.com
${BROWSER}   chrome

*** Keywords ***

### setup and teardown
Abrir Navegador
    Open Browser   about:blank  ${BROWSER}

Fechar Navegador
    Close Browser

### steps
Given that I'm on the home page of the site
    Go To             ${URL}
    Title Should Be   My Store

When I search for the product ${PRODUCT}
    Input Text     name=search_query  ${PRODUCT}
    Click Element  name=submit_search

Then the product ${PRODUCT} must be listed on the search results page
    Wait until Element Is Visible  css=#center_column > h1
    Title Should Be                Search - My Store
    Page Should Contain Image      //*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link       //*[@id="center_column"]//a[@class="product-name"][contains(text(),"Blouse")]

Then the page should display the message ${MENSAGEM_ALERTA}
    Wait Until Element Is Visible   //*[@id="center_column"]/p
    Element Text Should Be          //*[@id="center_column"]/p  ${MENSAGEM_ALERTA}
