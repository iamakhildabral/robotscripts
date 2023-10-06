*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${page}                     api/users?page=2
${baseurl}                  https://reqres.in/
${single_user}              /api/users/2
${create_single_user}       api/users


*** Test Cases ***
GetAllUsers
    Create Session    session1    ${baseurl}
    ${response}=    GET On Session    session1    ${page}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    # Validation
    ${status_code}=    convert to string    ${response.status_code}
    Should Be Equal    ${status_code}    200

    ${responsebody}=    Convert To String    ${response.content}
    Should Contain    ${responsebody}    lindsay.ferguson@reqres.in

    ${contenttype}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Contain    ${contenttype}    application/json

# GetSingleUser
#    ${single_user_response}=    GET On Session    session1    ${single_user}
#    Log To Console    ${single_user_response.content}

create_single_user
