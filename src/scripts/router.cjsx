# Load css first thing. It gets injected in the <head> in a <style> element by
# the Webpack style-loader.
require '../../public/main.css'

React = require 'react'
# Assign React to Window so the Chrome React Dev Tools will work.
window.React = React

Router = require('react-router')
Route = Router.Route

# Require route components.
HelloWorld = require './views/hello_world'
App = require './views/app'

routes = (
  <Route handler={App}>
    <Route name="hello" handler={HelloWorld} path="/" />
  </Route>
)
Router.run(routes, (Handler) ->
  React.render <Handler/>, document.body
)
