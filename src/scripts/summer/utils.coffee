'use strict';

module.exports =
  capitalize: (string) ->
    string.charAt(0).toUpperCase() + string.slice(1)

  isObject: (obj) ->
    type = typeof obj;
    type == 'function' or type == 'object' and not not obj

  extend: (obj) ->
    if @isObject(obj)
      for source, i in arguments
        if i > 0
          obj[prop] = functor for prop, functor of source
    obj