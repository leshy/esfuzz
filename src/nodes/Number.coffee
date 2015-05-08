Node = require '../node'
{oneOf} = require '../combinators'
{randomInt, randomElement} = require '../random'

class Number_ extends Node
  type: 'Literal'
  constructor: ->
    (oneOf [
      =>
        @value = 0
        do @formatInt
      =>
        @value = randomInt 1000
        do @formatInt
      =>
        @value = randomInt 100 * 1000
        do @formatInt
    ])()
  formatInt: ->
    switch randomInt 10
      when 0 then @raw = "#{randomElement ['0', '00', '000', '0000']}#{@value.toString 8}"
      when 1 then @raw = "0#{randomElement ['x', 'X']}#{@value.toString 16}"
      when 3 then @raw = "#{@value}."

module.exports = -> new Number_
