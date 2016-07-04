import React from 'react'
import md5 from 'md5'
import querystring from 'query-string'
import isRetina from 'is-retina'

class Gravatar extends React.Component {
  static displayName = 'Gravatar'
  static propTypes = {
    email: React.PropTypes.string,
    md5: React.PropTypes.string,
    size: React.PropTypes.number,
    rating: React.PropTypes.string,
    https: React.PropTypes.bool,
    default: React.PropTypes.string,
    className: React.PropTypes.string,
    style: React.PropTypes.object,
  }
  static defaultProps = {
    size: 50,
    rating: 'g',
    https: false,
    default: 'retro',
  }

  render() {
    let base
    if (this.props.https) {
      base = 'https://secure.gravatar.com/avatar/'
    } else {
      base = 'http://www.gravatar.com/avatar/'
    }

    const query = querystring.stringify({
      s: this.props.size,
      r: this.props.rating,
      d: this.props.default,
    })

    const retinaQuery = querystring.stringify({
      s: this.props.size * 2,
      r: this.props.rating,
      d: this.props.default,
    })

    let hash
    if (this.props.md5) {
      hash = this.props.md5
    } else if (this.props.email) {
      hash = md5(this.props.email)
    } else {
      console.warn(
        'Gravatar image can not be fetched. Either the "email" or "md5" prop must be specified.'
      )
      return (<script />)
    }

    const src = `${base}${hash}?${query}`
    const retinaSrc = `${base}${hash}?${retinaQuery}`

    let modernBrowser = true  // server-side, we render for modern browsers

    if (typeof window !== 'undefined') {
      // this is not NodeJS
      modernBrowser = 'srcset' in document.createElement('img')
    }

    let className = 'react-gravatar'
    if (this.props.className) {
      className = `${className} ${this.props.className}`
    }

    // Clone this.props and then delete Component specific props so we can
    // spread the rest into the img.
    let { ...rest } = this.props
    delete rest.https
    delete rest.md5
    delete rest.email
    delete rest.rating
    delete rest.size
    delete rest.style
    delete rest.className
    delete rest.default
    if (!modernBrowser && isRetina()) {
      return (
        <img
          alt={`Gravatar for ${this.props.email}`}
          style={this.props.style}
          src={retinaSrc}
          height={this.props.size}
          width={this.props.size}
          {...rest}
          className={className}
        />
      )
    }
    return (
      <img
        alt={`Gravatar for ${this.props.email}`}
        style={this.props.style}
        src={src}
        srcSet={`${retinaSrc} 2x`}
        height={this.props.size}
        width={this.props.size}
        {...rest}
        className={className}
      />
    )
  }
}


module.exports = Gravatar
