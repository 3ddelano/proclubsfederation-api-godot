extends Control

var client: PCFClient
var res = "Uncomment one of the methods"

func _ready() -> void:
	print("Ready!")
	client = PCFClient.new()
	add_child(client)
#	client.set_debug(true)
#	return _local_test()

	var token = Token.new()
	token.access_token = Env.get_var("ACCESS_TOKEN")
	client.set_token(token)

	var rest_client = client.get_rest_client()
	_setup_ws_client()

#   -- rest --
#	var create_club_params = CreateClubParams.new()
#	create_club_params.name = "Test club 007"
#	create_club_params.description = "Test description"
#	res = yield(rest_client.create_club(create_club_params), "completed")

#	var modify_club_params = ModifyClubParams.new()
#	modify_club_params.name = "Anothername"
#	modify_club_params.description = "Edited desc"
#	modify_club_params.money = 1514545454
#	res = yield(rest_client.modify_club("34882886260117504", modify_club_params), "completed")

#	res = yield(rest_client.get_clubs(), "completed")
#	res = yield(rest_client.get_club("31032476856385536"), "completed")
#	res = yield(rest_client.delete_club("34881100694585344"), "completed")

#	res = yield(rest_client.get_members("31032476856385536"), "completed")
#	res = yield(rest_client.get_member("31032476856385536", "31401998687694848"), "completed")
#	res = yield(rest_client.get_member_slots("31032476856385536"), "completed")

#	var create_user_params = CreateUserParams.new()
#	create_user_params.name = "TestUser007"
#	create_user_params.email = "name@domain.com"
#	create_user_params.password = "12345"
#	res = yield(rest_client.create_user(create_user_params), "completed")

#	res = yield(rest_client.get_users(), "completed")
#	res = yield(rest_client.get_user("34685299879870464"), "completed")
#	res = yield(rest_client.get_user_clubs("26741616421277696"), "completed")
#	res = yield(rest_client.get_user_awards("26741616421277696"), "completed")
#	res = yield(rest_client.get_user_award("26741616421277696", "-1"), "completed")

#	res = yield(rest_client.get_items(), "completed")
#	res = yield(rest_client.get_item("-1"), "completed")

#	res = yield(rest_client.get_transactions("seller", "-1"), "completed")
#	res = yield(rest_client.get_transaction("-1"), "completed")

#	res = yield(rest_client.get_invites(), "completed")
#	res = yield(rest_client.get_awards(), "completed")
#	res = yield(rest_client.get_award("-1"), "completed")

#	var auth_params = AuthorizeParams.new()
#	# test account
#	auth_params.email_id = "sairam2021@gmail.com"
#	auth_params.password = "sairam134_123"
#	res = yield(rest_client.authorize(auth_params), "completed")

#	yield(rest_client.revoke(), "completed")

#	var club
#	var clubs = yield(rest_client.get_clubs(), "completed")
#	if typeof(clubs) == TYPE_ARRAY:
#		club = clubs[randi() % clubs.size()]

#	var create_application_params = CreateApplicationParams.new()
#	create_application_params.description = "test app"
#	create_application_params.application_type = "manager_application"
#	create_application_params.club_id = club.id
#	res = yield(rest_client.create_application(create_application_params), "completed")

#	res = yield(rest_client.get_applications(), "completed")
#	res = yield(rest_client.get_application("38173488451698688"), "completed")
	print(res)

# --- ws ---
func _setup_ws_client():
	var ws_client = client.get_ws_client()
	ws_client.init()
	ws_client.connect("client_ready", self, "_on_client_ready")
	ws_client.connect("client_resumed", self, "_on_client_resumed")
	ws_client.connect("club_create", self, "_on_club_create")
	ws_client.connect("club_update", self, "_on_club_update")
	ws_client.connect("club_delete", self, "_on_club_delete")
	ws_client.connect("club_member_create", self, "_on_club_member_create")
	ws_client.connect("club_member_update", self, "_on_club_member_update")
	ws_client.connect("club_member_delete", self, "_on_club_member_delete")
	ws_client.connect("award_create", self, "_on_award_create")
	ws_client.connect("award_update", self, "_on_award_update")
	ws_client.connect("award_delete", self, "_on_award_delete")
	ws_client.connect("item_create", self, "_on_item_create")
	ws_client.connect("item_update", self, "_on_item_update")
	ws_client.connect("item_delete", self, "_on_item_delete")
	ws_client.connect("transaction_create", self, "_on_transaction_create")
	ws_client.connect("user_update", self, "_on_user_update")
	ws_client.connect("user_award_create", self, "_on_user_award_create")
	ws_client.connect("user_award_update", self, "_on_user_award_update")
	ws_client.connect("user_award_delete", self, "_on_user_award_delete")
	ws_client.connect("invite_create", self, "_on_invite_create")
	ws_client.connect("invite_update", self, "_on_invite_update")
	ws_client.connect("invite_delete", self, "_on_invite_delete")
	ws_client.connect("application_create", self, "_on_application_create")
	ws_client.connect("application_delete", self, "_on_application_delete")

func _on_client_ready(user: PartialUser):
	print("ws on client_ready:: ", user)

func _on_club_create(club: PartialClub):
	print("ws on club_create:: ", club)

func _on_club_update(club: PartialClub):
	print("ws on club_update:: ", club)

func _on_club_delete(club: PartialClub):
	print("ws on club_delete:: ", club)

func _on_club_member_create(club_member: PartialClubMember):
	print("ws on club_member_create:: ", club_member)

func _on_club_member_update(club_member: PartialClubMember):
	print("ws on club_member_update:: ", club_member)

func _on_club_member_delete(club_member: PartialClubMember):
	print("ws on club_member_delete:: ", club_member)

func _on_item_create(item: PartialItem):
	print("ws on item_create:: ", item)

func _on_item_update(item: PartialItem):
	print("ws on item_update:: ", item)

func _on_item_delete(item: PartialItem):
	print("ws on item_delete:: ", item)

func _on_transaction_create(transaction: Transaction):
	print("ws on transaction_create:: ", transaction)

func _on_user_update(user: PartialUser):
	print("ws on user_update:: ", user)

func _on_user_award_create(award: PartialUserAward):
	print("ws on user_award_create:: ", award)

func _on_user_award_update(award: PartialUserAward):
	print("ws on user_award_update:: ", award)

func _on_user_award_delete(award: PartialUserAward):
	print("ws on user_award_delete:: ", award)

func _on_invite_create(invite: PartialInvite):
	print("ws on invite_create:: ", invite)

func _on_invite_update(invite: PartialInvite):
	print("ws on invite_update:: ", invite)

func _on_invite_delete(invite: PartialInvite):
	print("ws on invite_delete:: ", invite)

func _on_application_create(application: PartialApplication):
	print("ws on application_create:: ", application)

func _on_application_delete(application: PartialApplication):
	print("ws on application_delete:: ", application)



# Used for dev testing the API
func _local_test():
	var rest_client: PCFRESTClient = client.get_rest_client()

#	var create_user_params = CreateUserParams.new()
#	create_user_params.email = "user1@domain.com"
#	create_user_params.password = "12345"
#	create_user_params.name = "Test User"
#	var user = yield(rest_client.create_user(create_user_params), "completed")
#	print(user)

	var auth_params = AuthorizeParams.new()
	auth_params.email_id = "user1@domain.com"
	auth_params.password = "12345"
	var token = yield(rest_client.authorize(auth_params), "completed")
#	print(token)

	client.set_token(token)

	var current_user = yield(rest_client.get_current_user(), "completed")

#	var create_club_params = CreateClubParams.new()
#	create_club_params.name = "Test Club Name"
#	create_club_params.description = "Club Description"
#	create_club_params.public = true
#	var club = yield(rest_client.create_club(create_club_params), "completed")
#	print(club)

#	var create_application_params = CreateApplicationParams.new()
#	create_application_params.description = "hey"
#	create_application_params.application_type = "club_application"
#	create_application_params.club_id = "39221934499962880"
#	var application = yield(rest_client.create_application(create_application_params), "completed")
#	print(application)

#	var create_invite_params = CreateInviteParams.new()
#	create_invite_params.user_id = "39397523957239808"
#	create_invite_params.club_id = "39395008981655552"
#	var invite = yield(rest_client.create_invite(create_invite_params), "completed")
#	print(invite)

	print(yield(rest_client.accept_invite("39399086381731840"), "completed"))
