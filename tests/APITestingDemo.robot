*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}        http://216.10.245.166
${book_id}
${book_name}        RobotFramework
${aisle}            4321

*** Test Cases ***
Add Book into Library Database
    [Tags]    API
    &{req_body}=    Create Dictionary    name=${book_name}    isbn=cruds    aisle=${aisle}    author=John foe
    ${response}=    POST    ${base_url}/Library/Addbook.php        json=${req_body}    expected_status=200
    log    ${response.json()}
    Dictionary Should Contain Key    ${response.json()}    ID
    ${book_id}=    Get From Dictionary    ${response.json()}    ID
    Set Global Variable    ${book_id}
    Log    ${book_id}
    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
    Status Should Be    200    ${response}

Get the Book Details which got added
    [Tags]    API
    ${get_response}=    GET        ${base_url}/Library/GetBook.php    params=ID=${book_id}    expected_status=200
    log    ${get_response.json()}
    #[{'book_name': 'RobotFramework', 'isbn': 'cruds', 'aisle': '1432', 'author': 'John foe'}]
    Should Be Equal As Strings    RobotFramework    ${get_response.json()}[0][book_name]

Delete the Book from database
    [Tags]    API
    &{delete_req}=    Create Dictionary    ID=${book_id}
    ${delete_response}=    POST    ${base_url}/Library/DeleteBook.php    json=${delete_req}    expected_status=200
    Log    ${delete_response.json()}[msg]
    Should Be Equal As Strings    book is successfully deleted        ${delete_response.json()}[msg]
