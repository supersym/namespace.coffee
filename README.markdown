# namespace.coffee

A lean namespace implementation for CoffeeScript and JavaScript written in [CoffeeScript](http://coffeescript.com/).

# Examples

## Defining a Value or Class within a Namespace

```coffeescript
	(namespace 'MyApp').VERSION = 1.0
	
	namespace 'MyApp.enum.UserRole'
		SUBSCRIBER:   0
		CONTRIBUTOR:  128
		AUTHOR:       2048
		EDITOR:       16384 
		ADMIN:        32768
```

## Defining or Extending a Class within a Namespace

```coffeescript
	class (namespace 'MyApp.model').AbstractModel
		constructor: (@id) ->
			return @
		...
		
	class (namespace 'MyApp.model').UserModel extends (namespace 'MyApp.model').AbstractModel 
		constructor: (@firstName, @lastName, @role = (namespace 'MyApp.enum').UserRole.SUBSCRIBER ) ->
			return super()
		...
```

## Referencing a Namespaced Value

```coffeescript
	console.log("MyApp - Version: #{(namespace 'MyApp').VERSION}")
```

```coffeescript
	isAdmin = user.role is (namespace 'MyApp.enum.UserRole').ADMIN
```

or

```coffeescript
	UserRole = (namespace 'MyApp.enum.UserRole')
	isAdmin = user.role is UserRole.ADMIN
```

## Referencing a Namespaced Class

```coffeescript
	user = new (namespace 'MyApp.model.UserModel')
```

or

```coffeescript
	UserModel = (namespace 'MyApp.model.UserModel')
	user = new UserModel()
```

# License

Copyright (c) 2011-2012 [CodeCatalyst, LLC](http://www.codecatalyst.com/)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.