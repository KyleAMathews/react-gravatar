React = require 'react'
md5 = require 'md5'
querystring = require 'querystring'

# Algorithm borrowed from retina.js https://github.com/imulus/retinajs/blob/3337987b400396055e8eb331beddc6199de11e88/src/retina.js#L53-L65
isRetina = ->
  if window?
    mediaQuery = "(-webkit-min-device-pixel-ratio: 1.5), (min--moz-device-pixel-ratio: 1.5), (-o-min-device-pixel-ratio: 3/2), (min-resolution: 1.5dppx)"
    return true if window.devicePixelRatio > 1
    return true if window.matchMedia and window.matchMedia(mediaQuery).matches

  return false

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
      s: if isRetina() then @props.size * 2 else @props.size
      r: @props.rating
      d: @props.default
    })

    src = base + md5.digest_s(@props.email) + "?" + query

    return(
      <img src={src} alt={@props.email} height={@props.size} width={@props.size} />
    )
