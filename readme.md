This NodeJS application demonstrates the use of Redis to manage user sessions.
In Redis, all operations and storage are performed in memory.
Redis allows us to retain a user's session even if the application server crashes or is interrupted. 

## Requirements
[NodeJS](https://nodejs.org)
[MySQL](https://www.mysql.com/)
[Redis](https://redis.io/)
[Docker](https://www.docker.com/) (optional)

# Download the mysql docker container
docker run -d --name test-mysql -p 3307:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_DATABASE=test mysql

# import sample db


# Spin up docker container for SQL
docker start test-mysql

# Run Redis as background process
redis-server --daemonize yes

# Confirm Redis is running
ps aux | grep redis-server

# install node dependancies
npm install

# run application
nodemon server

# login with a user 
Email: joe@test.test Password: test

# Restart the node server
rs 

# Reload the page and notice that you are still logged in and 