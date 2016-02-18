React = require 'react'
md5 = require 'md5'
querystring = require 'querystring'
isRetina = require 'is-retina'

module.exports = React.createClass
  displayName: 'Gravatar'

  propTypes:
    email: React.PropTypes.string
    md5: React.PropTypes.string
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

    retinaQuery = querystring.stringify({
      s: @props.size * 2
      r: @props.rating
      d: @props.default
    })

    if @props.md5
      hash = @props.md5
    else if @props.email
      hash = md5(@props.email)
    else
      console.warn('Gravatar image can not be fetched. Either the "email" or "md5" prop must be specified.')
      return(<script/>)

    src = base + hash + "?" + query
    retinaSrc = base + hash + "?" + retinaQuery

    modernBrowser = true  # server-side, we render for modern browsers

    if window?
      # this is not NodeJS
      modernBrowser = 'srcset' of document.createElement('img')

    if not modernBrowser and isRetina()
      <img
        style={@props.style}
        className={"react-gravatar " + @props.className}
        src={retinaSrc}
        height={@props.size}
        width={@props.size}
        {...@props}
      />
    else
      <img
        style={@props.style}
        className={"react-gravatar " + @props.className}
        src={src}
        srcSet={retinaSrc + " 2x"}
        height={@props.size}
        width={@props.size}
        {...@props}
      />
