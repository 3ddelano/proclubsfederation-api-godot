extends Control

var http_client: PCFHTTPClient
var ws_client: PCFWebsocketClient

var res = "Uncomment one of the methods"
func _ready() -> void:
#	print("Ready!")

	http_client = PCFHTTPClient.new()
	ws_client = PCFWebsocketClient.new()
	add_child(http_client)
	add_child(ws_client)

	var token = Token.new().from_json({
		access_token = Env.get_var("ACCESS_TOKEN")
	})
	http_client.set_auth(token)
	ws_client.set_token(token)


#	var create_club_params = CreateClubParams.new()
#	create_club_params.name = "Club to Delete"
#	create_club_params.description = "Test description"
#	res = yield(http_client.create_club(create_club_params), "completed")

#	var modify_club_params = ModifyClubParams.new()
#	modify_club_params.name = "Anothername"
#	modify_club_params.description = "Edited desc"
#	modify_club_params.money = 1514545454
#	res = yield(http_client.modify_club(34882886260117504, modify_club_params), "completed")

	res = yield(http_client.get_clubs(), "completed")
#	res = yield(http_client.get_club(34881100694585344), "completed")
#	res = yield(http_client.delete_club(34881100694585344), "completed")


#	res = yield(http_client.get_members(31032476856385536), "completed")
#	res = yield(http_client.get_member(31032476856385536, 31401998687694848), "completed")
#	res = yield(http_client.get_member_slots(31032476856385536), "completed")

#	var create_user_params = CreateUserParams.new()
#	create_user_params.name = "DelanoTest1"
#	create_user_params.email = "delanotest1@gmail.com"
#	create_user_params.password = "12345"
#	res = yield(http_client.create_user(create_user_params), "completed")

#	res = yield(http_client.get_users(), "completed")
#	res = yield(http_client.get_user(34685299879870464), "completed")
#	res = yield(http_client.get_user_clubs(26741616421277696), "completed")
#	res = yield(http_client.get_user_awards(26741616421277696), "completed")
#	res = yield(http_client.get_user_award(26741616421277696, -1), "completed")

#	res = yield(http_client.get_items(), "completed")
#	res = yield(http_client.get_item(-1), "completed")

#	res = yield(http_client.get_transactions("seller", -1), "completed")
#	res = yield(http_client.get_transaction(-1), "completed")

#	res = yield(http_client.get_invites(), "completed")
#	res = yield(http_client.get_awards(), "completed")
#	res = yield(http_client.get_award(-1), "completed")


#	var auth_params = AuthorizeParams.new()
#	auth_params.email_id = "sairam2021@gmail.com"
#	auth_params.password = "sairam134_123"
#	res = yield(http_client.authorize(auth_params), "completed")

#	yield(http_client.revoke(), "completed")


#	print(res)

func _on_req_complete(data):
	print("Data: ", data)
