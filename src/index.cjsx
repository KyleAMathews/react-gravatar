React = require 'react'
md5 = require 'md5'
querystring = require 'querystring'

module.exports = React.createClass
  displayName: 'Gravatar'

  propTypes:
    size: React.PropTypes.number.isRequired
    rating: React.PropTypes.string.isRequired
    https: React.PropTypes.bool.isRequired
    default: React.PropTypes.string.isRequired
    email: React.PropTypes.string.isRequired

  getDefaultProps: ->
    size: 50
    rating: 'g'
    https: false
    default: "retro"

  render: ->
    base = if @props.https
      "https://secure.gravatar.com/avatar/"
    else
      'http://www.gravatar.com/avatar/'

    query = querystring.stringify({
      s: @props.size
      r: @props.rating
      d: @props.default
    })

    src = base + md5.digest_s(@props.email) + "?" + query

    return(
      <img src={src} alt={@props.email} height={@props.size} width={@props.size} />
    )
