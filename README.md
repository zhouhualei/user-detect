# user-detect

### Features
    1. collect login time of guest user or member
    2. provide RESTFul API for user statistics

## Design
    * user will be created in users table after signup
    * associate every loged user with every session
    * A guest session will be defined when it can not be associated with any user, otherwise, it will be a member session
    * also handle the scenario that many sessions handle by one user

### RESTFul API
    GET /users/number