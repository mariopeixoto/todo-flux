Link = require('react-router').Link
RouteHandler = require('react-router').RouteHandler

# Provides global navigation for app e.g. the "Hello | Styleguide" at the top.
module.exports = React.createClass
  displayName: 'App'
  render: ->
    <div>
      <header><Link to="hello">Hello</Link></header>
      <RouteHandler/>
    </div>
