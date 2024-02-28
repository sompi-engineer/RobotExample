*** Variables ***
# WEB VARIABLES
${URL} =                        https://www.saucedemo.com/
${BROWSER} =                    chrome

# Login Data
&{USER}                         User=standard_user    Password=secret_sauce
&{UNREGISTERED_USER}            User=notregistered  Password=TestPassword!  ExpectedErrorMessage=Epic sadface: Username and password do not match any user in this service
&{ONLY_USER}                    User=standard_user    Password=#BLANK     ExpectedErrorMessage=Epic sadface: Password is required
&{ONLY_PASSWORD}                User=#BLANK    Password=secret_sauce     ExpectedErrorMessage=Epic sadface: Username is required
&{BLANK_CREDENTIALS_USER}       User=#BLANK  Password=#BLANK  ExpectedErrorMessage=Epic sadface: Username is required

# Customer Data
&{CUSTOMER1}                    FirstName=Joulu     LastName=Pukki       Zip=99999


# API VARIABLES
${URL_API} =                    https://reqres.in/api
${ALIAS} =                      reqres

${API_USERS} =                  /users
${API_USERS_2} =                /users/2
${API_USERS_2_FIRSTNAME} =      Janet
${API_USERS_LIST} =             {"page":1,"per_page":6,"total":12,"total_pages":2,"data":[{"id":1,"email":"george.bluth@reqres.in","first_name":"George","last_name":"Bluth","avatar":"https://reqres.in/img/faces/1-image.jpg"},{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},{"id":3,"email":"emma.wong@reqres.in","first_name":"Emma","last_name":"Wong","avatar":"https://reqres.in/img/faces/3-image.jpg"},{"id":4,"email":"eve.holt@reqres.in","first_name":"Eve","last_name":"Holt","avatar":"https://reqres.in/img/faces/4-image.jpg"},{"id":5,"email":"charles.morris@reqres.in","first_name":"Charles","last_name":"Morris","avatar":"https://reqres.in/img/faces/5-image.jpg"},{"id":6,"email":"tracey.ramos@reqres.in","first_name":"Tracey","last_name":"Ramos","avatar":"https://reqres.in/img/faces/6-image.jpg"}],"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}

${API_USER_ADD} =               {"name": "Joulu Pukki", "movies": ["Die Hard", "Batman Returns"]}
${API_USER_UPDATE} =            {"name": "Joulupukki Updated"}

${STATUS_200} =                 200
${STATUS_201} =                 201
${STATUS_204} =                 204