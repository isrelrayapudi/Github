*** Settings ***
Library    DateTime
Library    OperatingSystem
Library    SSHLibrary
Library    Collections
Library    JSONLibrary
Library    JsonValidator

*** Variables ***
@{items}=    Apple    Banana    Cat    Dog    Elephant

*** Test Cases ***
Get current date and time
    [Tags]    sanity
    ${date_time}=    Get Current Date
    Log    ${date_time}

Get system version
    [Tags]    Regression
    ${expected_length}=    Set Variable    ${20} 
    ${date}=    Get Current Date
    ${date_length}=    Get Length    ${date}
    Log    ${date_length}
    ${ret}=    Evaluate    ${date_length}==${expected_length}
    Sleep    2s
To get data
    [Tags]    sanity
    ${msg}=    Set Variable    Wait for physical inventory update finished event, and updated
    Log To Console    Received NATS message:    ${msg}
    Log    ${msg}
    ${result}=    Should Contain    ${msg}    updated
    Run Keyword If    ${result}    Log    Successfully Updated
    ${count_list}=    Get Length    ${items}
    Log    ${count_list}
    Sleep    2s
Onu Serial Numbers
    [Tags]    sanity
    ${msg}=    Set Variable    "io.leitstand.actor.events.diagnosis.NspOntResetResponse"
    ${output}=    Set Variable    ENABLED
    Should Be Equal As Strings    ENABLED    ${output}
    Sleep    2s
Get all values match
    [Tags]    Regression
    ${msg}=    Set Variable    "io.leitstand.actor.events.diagnosis.NspOntResetResponse"
    ${output}=    Set Variable    io.leitstand.actor.events.diagnosis.NspOntResetResponse successfully produced the event.
    Should Contain    ${output}    successfully produced the event
    Log    ${output}
Get Onu Serial Numbers
    [Tags]    sanity
    ${msg}=    Set Variable    "io.leitstand.actor.events.diagnosis.NspOntResetResponse"
    ${output}=    Set Variable    ENABLED
    Log    ${output}
    Sleep    2s

Test
    [Tags]    sanity
    ${msg}=    Set Variable    "io.leitstand.actor.events.diagnosis.NspOntResetResponse"
    ${output}=    Set Variable    ENABLED
    Log    ${output}
    Sleep    2s



    
    

       





        
    
    
