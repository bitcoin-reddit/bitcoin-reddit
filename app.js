var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var jwt = require('jsonwebtoken');
var app = express();
require('dotenv').load();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');


// uncomment after placing your favicon in /public
//app.use(favicon(__dirname + '/public/favicon.ico'));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


app.use(function(req, res, next) {
  // find token in a cookie
  var token = req.cookies.token

  // if we find a token we try and verify it
  if (token) {

    // verifies secret and checks exp
    jwt.verify(token, process.env.JWT_SECRET, function(err, user) {

      // if everything is good, save to request for use in other routes
      if (user) req.user = user;
      // if token has been messed with we show a failiure message
      else return res.json({ success: false, message: 'Failed to authenticate token.' });

      next();

    });
  } else {
    next();
  }
});

app.use('/', require('./routes/index'));
app.use('/u', require('./routes/user'));
app.use('/p', require('./routes/post'));


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

app.use(require('./lib/errors/handler'));

process.addListener('uncaughtException', function(err) {
    console.error('Uncaught error in server.js', {
        err: err,
        stack: err.stack
    });
    // TODO some sort of notification
    process.exit(1);
});

module.exports = app;
