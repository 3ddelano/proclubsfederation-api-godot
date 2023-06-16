Pro Clubs Federation API Godot
=========================================

### Interact with the Pro Clubs Federation API from GDScript!
<img src="https://raw.githubusercontent.com/3ddelano/proclubsfederation-api-godot/main/icon.png" height="250px">
<br>
<img alt="Godot3" src="https://img.shields.io/badge/-Godot 3.3+-478CBF?style=for-the-badge&logo=godotengine&logoWidth=20&logoColor=white" />

Features
--------------

- Statically typed
- Error handling via HTTPResponse
- Async using yield()
- REST + Websockets

> Note: Call the PCFWSClient.init() method to start the websocket connection

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
	var client: PCFClient = PCFClient.new()
	add_child(client)

	var clubs = yield(client.get_rest_client().get_clubs(), "completed")
	print(clubs)
```

An example with authentication:

```GDScript
extends Node

func _ready():
	var client: PCFClient = PCFClient.new()
	add_child(client)

	var token = Token.new()
	token.access_token = "xxxxx_access_token_here_xxxxx"
	client.set_token(token)

	var rest_client: PCFRESTClient = client.get_rest_client()
	var user: User = yield(rest_client.get_current_user(), "completed")
	print(user)
```

An example with websockets:

```GDScript
extends Node

func _ready():
	var client: PCFClient = PCFClient.new()
	add_child(client)
	
	var token = Token.new()
	token.access_token = "xxxxx_access_token_here_xxxxx"
	client.set_token(token)

	var ws_client: PCFWSClient = client.get_ws_client()
	ws_client.init() # Starts the websocket connection 
	ws_client.connect("client_ready", self, "_on_client_ready")
	ws_client.connect("club_create", self, "_on_club_create")

func _on_client_ready(user: PartialUser):
	print("Client ready: ", user)

func _on_club_create(club: PartialClub):
	print("Club create: ", club)
```

Support the project development
-----------
<a href="https://www.buymeacoffee.com/3ddelano" target="_blank"><img height="41" width="174" src="https://cdn.buymeacoffee.com/buttons/v2/default-red.png" alt="Buy Me A Coffee" width="150" ></a>

Want to support in other ways? Contact me on Discord: `@3ddelano`

You can also contact `@sairam` for more details.

For help / suggestions join: [3ddelano Cafe](https://discord.gg/FZY9TqW)

#### Disclaimer: This project is affiliated and endorsed by Pro Clubs Federation
