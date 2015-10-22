var React = require('react');
var ReactDOM = require('react-dom');
var Gravatar = React.createFactory(require('../dist/index.js'));

ReactDOM.render(
  <div>
    <h2 dangerouslySetInnerHTML={{__html: "<Gravatar email='mathews.kyle@gmail.com' />"}}/>
    <Gravatar email='mathews.kyle@gmail.com' />
    <h2 dangerouslySetInnerHTML={{__html: "<Gravatar email='mathews.kyle@gmail.com' size={100} />"}} />
    <Gravatar email='mathews.kyle@gmail.com' size={100} />
    <h2>For emails without a gravatar, use the retro default. You can override this by passing in a different 'default' prop. See https://en.gravatar.com/site/implement/images/ for options.</h2>
    <Gravatar email="blah@blah.com" />
  </div>,
  document.body
)
