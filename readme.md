# Session Management with Redis
This NodeJS application demonstrates the use of Redis to manage user sessions.
In Redis, all operations and storage are performed in memory.
Redis allows us to retain a user's session even if the application server crashes or is interrupted. 

## Requirements
* [NodeJS](https://nodejs.org)
* [MySQL](https://www.mysql.com/)
* [Redis](https://redis.io/)
* [Docker](https://www.docker.com/) (optional)

## Instructions
 1. **Clone and enter the reop**
    ```bash
    git clone https://github.com/EoinTraynor/redis-session-management && cd redis-session-management
    ``` 

    <br>
 2. **Install Node Modules**
    ```bash
    npm install
    ```

    <br>
 3. **Setting up a test database**
    Start and connect to your mysql database and import 'sampledb.sql'. Ensure the config file 'db.js' matches your running database (i.e. port 3307).
    
    __Optional*__  Use docker to launch a mysql container and expose on port 3307. You will still need to import 'sampledb.sql'
    ```bash
    docker run -d --name node-mysql -p 3307:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_DATABASE=test mysql
    ```
    
    <br>
 4. **Start Redis as a background process**
    ```bash
    redis-server --daemonize yes
    ```
    Confirm redis is running
    ```bash
    ps aux | grep redis-server
    ```

    __Optional*__  Use docker to launch a redis container and expose on port 6379.
    ```bash
    docker run -d --name node-redis -p 6379:6379 redis
    ```

    <br>
 5. **Test the application**
    Run our node app
    ```bash
    nodemon server
    ```
    
    Visit your browser on localhost:3000 and login with __Email__: eoin@test.test __Password__: test.
    You should see an authorized page, which can only be accessed by a user who are logged in.

    Reset the node server
    ```bash
    rs
    ```

    Reload your browser and note that we are still logged in, accessing the authorized page.
    Even though our server has been restarted our session has been retained and we are not required to log back in.  