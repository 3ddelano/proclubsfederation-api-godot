Pro Clubs Federation API Godot
=========================================

### Interact with the Pro Clubs Federation API from GDScript!

<br>
<img alt="Godot3" src="https://img.shields.io/badge/-Godot 3.3+-478CBF?style=for-the-badge&logo=godotengine&logoWidth=20&logoColor=white" />

Features
--------------

- Statically typed
- Error handling via HTTPResponse
- Uses Async/Await
- Supports Websockets (Basic)

Installation
--------------

This is a regular plugin for Godot.
Copy the contents of `addons/proclubsfederation-api-godot` into the `addons/` folder in the same directory as your project (There is **NO need** to activate the plugin in ProjectSettings).

Getting Started
----------

A basic example is given below:


```GDScript
extends Node

func _ready():
	var client: PCFClient = PCFHTTPClient.new()
	add_child(client)

	var clubs = yield(client.get_clubs(), "completed")
	print(clubs)
```

An example with authentication:


```GDScript
extends Node

func _ready():
	var client: PCFClient = PCFHTTPClient.new()
	add_child(client)

	var token = Token.new().from_json({
		access_token = "xxxxx_access_token_here_xxxxx"
	})
	client.set_auth(token)

	var user: User = yield(client.get_current_user(), "completed")
	print(user)
```

Example with websockets and authentication:
```GDScript
extends Node

func _ready():
	var http_client: PCFClient = PCFHTTPClient.new()
	var ws_client: PCFWebsocketClinet = PCFWebsocketClient.new()
	add_child(http_client)
	add_child(ws_client)

	var token = Token.new().from_json({
		access_token = "xxxxx_access_token_here_xxxxx"
	})
	http_client.set_auth(token)
	ws_client.set_token(token)
	ws_client.connect("client_ready", self, "_client_ready")

	var user: User = yield(client.get_current_user(), "completed")
	print(user)

func _client_ready(user: PartialUser):
	print("Ready!")
	print(user)
```

Contributing
-----------

This plugin is a non-profit project developed by voluntary contributors.

### Supporters

```
None, you can be the first one!
```

Support the project development
-----------
<a href="https://www.buymeacoffee.com/3ddelano" target="_blank"><img height="41" width="174" src="https://cdn.buymeacoffee.com/buttons/v2/default-red.png" alt="Buy Me A Coffee" width="150" ></a>

Want to support in other ways? Contact me on Discord: `@3ddelano#6033`

For help / suggestions join: [3ddelano Cafe](https://discord.gg/FZY9TqW)

#### Disclaimer: This project is not affiliated nor endorsed by Pro Clubs Federation
