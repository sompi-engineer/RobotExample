*** Variables ***
# WEB VARIABLES
${URL} =                    https://www.saucedemo.com/
${BROWSER} =                chrome

# Login Data
&{USER}                     User=standard_user    Password=secret_sauce
&{UNREGISTERED_USER}        User=notregistered  Password=TestPassword!  ExpectedErrorMessage=Epic sadface: Username and password do not match any user in this service
&{ONLY_USER}                User=standard_user    Password=#BLANK     ExpectedErrorMessage=Epic sadface: Password is required
&{ONLY_PASSWORD}            User=#BLANK    Password=secret_sauce     ExpectedErrorMessage=Epic sadface: Username is required
&{BLANK_CREDENTIALS_USER}   User=#BLANK  Password=#BLANK  ExpectedErrorMessage=Epic sadface: Username is required

# Customer Data
&{CUSTOMER1}                FirstName=Joulu     LastName=Pukki       Zip=99999


# API VARIABLES
${URL_API} =                    https://reqres.in/api
${ALIAS} =                      reqres

${API_USERS} =                  /users
${API_USERS_2} =                /users/2
${API_USERS_2_FIRSTNAME} =      Janet

${API_USER_ADD} =               {"name": "Joulu Pukki", "movies": ["Die Hard", "Batman Returns"]}
${API_USER_UPDATE} =            {"name": "Joulupukki Updated"}

${STATUS_200} =                 200
${STATUS_201} =                 201
${STATUS_204} =                 204