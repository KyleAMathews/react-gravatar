React = require 'react'
md5 = require 'md5'
querystring = require 'querystring'
isRetina = require 'is-retina'

module.exports = React.createClass
  displayName: 'Gravatar'

  propTypes:
    email: React.PropTypes.string.isRequired
    size: React.PropTypes.number
    rating: React.PropTypes.string
    https: React.PropTypes.bool
    default: React.PropTypes.string
    className: React.PropTypes.string

  getDefaultProps: ->
    size: 50
    rating: 'g'
    https: false
    default: "retro"
    email: ''
    className: ""

  render: ->
    base = if @props.https
      "https://secure.gravatar.com/avatar/"
    else
      'http://www.gravatar.com/avatar/'

    query = querystring.stringify({
      s: if isRetina() then @props.size * 2 else @props.size
      r: @props.rating
      d: @props.default
    })

    src = base + md5.digest_s(@props.email) + "?" + query

    return(
      <img
        {...@props}
        className={"react-gravatar " + @props.className}
        src={src}
        alt={@props.email}
        height={@props.size}
        width={@props.size} />
    )
