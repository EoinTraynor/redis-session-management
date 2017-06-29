const knex = require("knex");
const bcrypt = require("bcrypt-nodejs");
const passport = require("passport");
const localStrategy = require("passport-local").Strategy;
const GitHubStrategy = require('passport-github').Strategy;
const db = require("./db")

passport.use(new localStrategy(authenticate));
passport.use("local-register", new localStrategy({passReqToCallback: true}, register));

/*
passport.use(new GitHubStrategy({
    // include your GitHub application credentials
    clientID: "",
    clientSecret: "",
    callbackURL: "http://localhost:3000/auth/github/callback"
  },
  function(accessToken, refreshToken, profile, done) {
    // console.log(profile);
    db("users")
        .where("oauth_provider", "github")
        .where("oauth_id", profile.id)
        .first()
        .then((user) => {
            if (user) {
                return done(null, user)
            }
            
            const newUser = {
                oauth_provider: "github",
                oauth_id: profile.id,                
            }

            return db("users")
            .insert(newUser)
            .then((ids) => {
                newUser.id = ids[0]
                done(null, newUser)
            })
        })
  }
));
*/

function authenticate(email, password, done) {
    db("users")
    .where("email", email)
    .first()
    .then((user) => {
        if (!user && bcrypt.compareSync(password, user.password)) {
            return done(null, false, {message: "username or password incorrect"});
        }
        done(null, user);
    }, done)
}

function register(req, email, password, done) {
    db("users")
    .where("email", email)
    .first()
    .then((user) => {
        if(user){
            return done(null, false, {message: "an account with that email has already in use"})
        }
        if(password !== req.body.password2){
            return done(null, false, {message: "passwords dont match"});
        }
        const newUser = {
            first_name: req.body.first_name,
            last_name: req.body.last_name,
            email: email,
            password: bcrypt.hashSync(password)
        }
        db("users")
        .insert(newUser)
        .then((ids) => {
            newUser.id = ids[0]
            done(null, newUser)
        })
    })
}

passport.serializeUser(function(user, done) {
    done(null, user.id)
})

passport.deserializeUser(function(id, done) {
    db("users")
    .where("id", id)
    .first()
    .then((user) => {
        done(null, user)
    }, done)
})