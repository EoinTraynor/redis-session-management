const express = require("express");
const session = require("express-session");
const bodyParser = require("body-parser");
const RedisStore = require('connect-redis')(session);
const knex = require("knex");
const passport = require("passport");
const authRoutes = require("./routes/auth");
const postsRoutes = require("./routes/posts");
const db = require("./db")
require("./passport");

express()
    .set("view engine", "hjs")
    .use(bodyParser.json())
    .use(bodyParser.urlencoded({extended: false}))
    .use(session({
        store: new RedisStore(),        
        secret: "cool cool", 
        resave: false, 
        saveUninitialized: false
    }))
    .use(passport.initialize())
    .use(passport.session())
    .use(authRoutes)
    .use(postsRoutes)
    .get("/", (req, res, next) =>{
        res.render('login')
    })    
    .listen(3000)
