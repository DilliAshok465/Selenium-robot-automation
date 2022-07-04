*** Settings ***
Documentation  Testing
Library  SeleniumLibrary


*** Variables ***
${URL}      https://www.shoppersdrugmart.ca/en/home
${BROWSER}  chrome

*** Keywords ***
Begin web test
    open browser  ${URL}  ${BROWSER}
    maximize browser window
Begin web test1
    Click Element   xpath://button[text()='Close']
    mouse over      xpath://a[@title='Health & Pharmacy']
    set selenium implicit wait  20s
    Click Element   xpath://a[@href='https://cannabis.shoppersdrugmart.ca/en_CA']
    set selenium implicit wait  20s
    switch window   Buy Medical Cannabis In Canada | Medical Cannabis by Shoppers
    set selenium implicit wait  20s
    Click Element   xpath://button[@name='age-gate-secondary']
    page should contain   The content in this website is for those who are 19 years of age or older
    reload page
    Click Element   xpath://button[@name='age-gate-primary']
    ${title}=  Get Title
    log   ${title}
    close browser



