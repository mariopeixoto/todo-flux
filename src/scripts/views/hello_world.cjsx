'use strict';

Link = require('react-router').Link
AppDispatcher = require('../dispatcher/app_dispatcher')

module.exports = React.createClass
  displayName: 'HelloWorld'
  render: ->
    <div>
      <a>Hello world!</a>
    </div>
