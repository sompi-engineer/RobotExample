*** Variables ***
# Configuration
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
