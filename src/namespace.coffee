# [namespace.coffee](http://github.com/CodeCatalyst/namespace) v1.0.0  
# Copyright (c) 2011 [CodeCatalyst, LLC](http://www.codecatalyst.com/).  
# Open source under the [MIT License](http://en.wikipedia.org/wiki/MIT_License).

# A lean namespace implementation for JavaScript written in [CoffeeScript](http://coffeescript.com/).

# *Export the specified value(s) to the specified package name.*
namespace = ( name, values ) ->
	# Export to `exports` for node.js or `window` for the browser.
	target = exports ? window
	# Nested packages may be specified using dot-notation, and are automatically created as needed.
	if name.length > 0
		target = target[ subpackage ] ||= {} for subpackage in name.split( '.' ) 
	# Export each value in the specified values Object to the specified package name by the value's key.
	target[ key ] = value for key, value of values

# *Export the namespace function to global scope, using itself.*
namespace( "", namespace: namespace )
