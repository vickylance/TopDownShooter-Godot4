extends Node

const DEFAULT_PORT := 28960
const MAX_CLIENTS := 6

var server: ENetMultiplayerPeer = null
var client: ENetMultiplayerPeer = null
var ip_address := ""

func _ready() -> void:
	var local_addresses := IP.get_local_addresses() as Array[String]
	if OS.get_name() == "Windows":
		ip_address = local_addresses[3]
	elif OS.get_name() == "Android":
		ip_address = local_addresses[0]
	else:
		ip_address = local_addresses[3]
	
	for ip in local_addresses:
		if ip.begins_with("192.168."):
			ip_address = ip
	
	multiplayer.server_disconnected.connect(_server_disconnected)
	multiplayer.connected_to_server.connect(_connected_to_server)

func create_server() -> void:
	server = ENetMultiplayerPeer.new()
	server.create_server(DEFAULT_PORT, MAX_CLIENTS)
	multiplayer.multiplayer_peer = server

func join_server() -> void:
	client = ENetMultiplayerPeer.new()
	client.create_client(ip_address, DEFAULT_PORT)
	multiplayer.multiplayer_peer = client


func _connected_to_server() -> void:
	print("Successfully connected to the server")

func _server_disconnected() -> void:
	print("Disconnected from the server")
