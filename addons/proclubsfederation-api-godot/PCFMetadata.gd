# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PCFMetadata
extends Reference


const REST_URL: String = "https://api.proclubsfederation.com/v%d"
const REST_VERSION: int = 2
const GATEWAY_URL: String = "wss://gateway.proclubsfederation.com/v%d"
const GATEWAY_VERSION: int = 1


const REST_URL_LOCAL: String = "http://127.0.0.1:8000"
const GATEWAY_URL_LOCAL: String = "ws://127.0.0.1:8000/gateway/websocket/"


const LIBRARY: String = "proclubsfederation_godot_api_wrapper"
const LIBRARY_URL: String = "https://github.com/3ddelano"
const LIBRARY_VERSION: String = "1.0.1"
