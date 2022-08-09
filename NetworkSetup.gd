extends Control

@onready
var multiplayer_config_ui := $MultiplayerConfigure
@onready
var setver_ip_address := $MultiplayerConfigure/VBoxContainer/ServerIPAddress
@onready
var device_ip_address := $CanvasLayer/DeviceIPAddress

func _ready() -> void:
	multiplayer.peer_connected.connect(_player_connected)
	multiplayer.peer_disconnected.connect(_player_disconnected)
	device_ip_address.text = Network.ip_address
	pass

func _player_connected(id: int) -> void:
	print("Player " + str(id) + " connected")
	pass

func _player_disconnected(id: int) -> void:
	print("Player " + str(id) + " disconnected")
	pass

func _on_create_server_pressed() -> void:
	multiplayer_config_ui.hide()
	Network.create_server()


func _on_join_server_pressed() -> void:
	if setver_ip_address.text != "":
		multiplayer_config_ui.hide()
		Network.ip_address = setver_ip_address.text
		Network.join_server()


