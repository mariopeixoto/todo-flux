'use strict';

React = require 'react'
ChatStore = require '../stores/chat_store'
Chat2Store = require '../stores/chat2_store'
Chat2Actions = require '../actions/chat2_actions'
ChatActions = require '../actions/chat_actions'

Chat = React.createClass

  _handleSubmit: (e) ->
    e.preventDefault()
    ChatActions.addMessage(@refs.message.getDOMNode().value)

  render: () ->
    <form onSubmit={@_handleSubmit}>
      <MessageList />
      <input type='text' ref='message' />
      <input type='submit' />
    </form>

MessageList = React.createClass
  getInitialState: ->
    messages: ChatStore.getMessages()

  componentDidMount: () ->
    ChatStore.addChangeListener(@_onChange)

  componentWillUnmount: () ->
    ChatStore.removeChangeListener(@_onChange)

  _onChange: () ->
    @setState
      messages: ChatStore.getMessages()

  render: () ->
    messageItems = @state.messages.map (message) ->
      <li>{message}</li>

    <ul>
      {messageItems}
    </ul>


module.exports = Chat