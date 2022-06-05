extends Control

var client: PCFClient

var res = "Uncomment one of the methods"
func _ready() -> void:
	print("Ready!")

	client = PCFClient.new()
	add_child(client)

	var token = Token.new().from_json({
		access_token = Env.get_var("ACCESS_TOKEN")
	})
	client.set_auth(token)


#	var create_club_params = CreateClubParams.new()
#	create_club_params.name = "Club to Delete"
#	create_club_params.description = "Test description"
#	res = yield(client.create_club(create_club_params), "completed")

#	var modify_club_params = ModifyClubParams.new()
#	modify_club_params.name = "Anothername"
#	modify_club_params.description = "Edited desc"
#	modify_club_params.money = 1514545454
#	res = yield(client.modify_club(34882886260117504, modify_club_params), "completed")

	res = yield(client.get_clubs(), "completed")
#	res = yield(client.get_club(34881100694585344), "completed")
#	res = yield(client.delete_club(34881100694585344), "completed")


#	res = yield(client.get_members(31032476856385536), "completed")
#	res = yield(client.get_member(31032476856385536, 31401998687694848), "completed")
#	res = yield(client.get_member_slots(31032476856385536), "completed")

#	var create_user_params = CreateUserParams.new()
#	create_user_params.name = "DelanoTest1"
#	create_user_params.email = "delanotest1@gmail.com"
#	create_user_params.password = "12345"
#	res = yield(client.create_user(create_user_params), "completed")

#	res = yield(client.get_users(), "completed")
#	res = yield(client.get_user(34685299879870464), "completed")
#	res = yield(client.get_user_clubs(26741616421277696), "completed")
#	res = yield(client.get_user_awards(26741616421277696), "completed")
#	res = yield(client.get_user_award(26741616421277696, -1), "completed")

#	res = yield(client.get_items(), "completed")
#	res = yield(client.get_item(-1), "completed")

#	res = yield(client.get_transactions("seller", -1), "completed")
#	res = yield(client.get_transaction(-1), "completed")

#	res = yield(client.get_invites(), "completed")
#	res = yield(client.get_awards(), "completed")
#	res = yield(client.get_award(-1), "completed")


#	var auth_params = AuthorizeParams.new()
#	auth_params.email_id = "sairam2021@gmail.com"
#	auth_params.password = "sairam134_123"
#	res = yield(client.authorize(auth_params), "completed")

#	yield(client.revoke(), "completed")


	print(res)

func _on_req_complete(data):
	print("Data: ", data)
