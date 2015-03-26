react-gravatar
==============

React component for rendering a gravatar profile image. Adjusts automatically to HiDPI displays.

## Demo
http://kyleamathews.github.io/react-gravatar/examples/

## Install
`npm install react-gravatar`

## Usage
See https://en.gravatar.com/site/implement/images/ for documentation on
all the options.

### Defaults
* 50x50 image
* g rated photos
* http
* retro backup faces for emails without profiles
* `react-gravatar` css class

### Use defaults
`<Gravatar email="mathews.kyle@gmail.com" />`

### Override all defaults
`<Gravatar
	email="mathews.kyle@gmail.com"
	size=100
	rating="pg"
	https
	default="monsterid"
	className="CustomAvatar-image"
/>`
