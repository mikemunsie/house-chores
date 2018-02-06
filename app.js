const express = require('express');
const path = require('path');
const logger = require('morgan');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const graphqlHTTP = require('express-graphql');
const { buildSchema } = require('graphql');

const resolvers = {
  chore: require('./resolvers/chore')
};

const schema = buildSchema(`
  type Query {
    getChore(id: Int): Chore,
    createChore(
      name: String,
      description: String,
      frequency: Int,
      frequency_interval: String,
      recurring: Boolean,
      date: Int
    ) : Chore
  },

  type Chore {
    id: Int,
    name: String,
    description: String,
    frequency: Int,
    frequencyInterval: String,
    recurring: Boolean,
    date: Int
  }
`);

const root = {
  getChore: resolvers.chore.get,
  createChore: resolvers.chore.create
};

const app = express();

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());

app.use('/graphql', graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: true,
}));

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  const err = new Error('Not Found');
  res.status(404)
    .json({
      response: 'notFound'
    });
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.json({ response: 'unexpected error.'});
});

module.exports = app;
