var Gravatar = require('../dist/index.js');
var React = require('react');

React.renderComponent(
  React.DOM.div(null,
                [
                  React.DOM.h2(null, "<Gravatar email='mathews.kyle@gmail.com' />"),
                  Gravatar({email: 'mathews.kyle@gmail.com'}),
                  React.DOM.h2(null, "<Gravatar email='mathews.kyle@gmail.com' size=100 />"),
                  Gravatar({email: 'mathews.kyle@gmail.com', size: 100}),
                  React.DOM.h2(null, "For non-existant emails, defaults to using the monsterid backup. You can override this by passing in a different 'default' prop. See https://en.gravatar.com/site/implement/images/ for options."),
                  Gravatar({email: 'blah@blah.com'}),
                ]), document.body);
