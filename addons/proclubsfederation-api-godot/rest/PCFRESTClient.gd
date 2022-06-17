# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PCFRESTClient
extends Node

func set_token(token: Token) -> void:
	_auth_header = "Authorization: Bearer %s" % token.access_token

func get_clubs() -> Array:
	var data = yield(_send_request(ENDPOINTS.CLUBS), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	var res = []
	for partial_club_data in data:
		res.append(PartialClub.new().from_json(partial_club_data))
	return res

func create_club(params: CreateClubParams) -> Club:
	var data = yield(_send_post_request(ENDPOINTS.CLUBS, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Club.new().from_json(data)

func get_club(club_id: String) -> Club:
	var data = yield(_send_request(ENDPOINTS.CLUB % club_id), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Club.new().from_json(data)

func delete_club(club_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.CLUB % club_id, {}), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error") and not data.is_no_content():
		return data

	return true

func modify_club(club_id, params: ModifyClubParams) -> Club:
	var data = yield(_send_patch_request(ENDPOINTS.CLUB % club_id, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Club.new().from_json(data)

func get_members(club_id: String) -> Array:
	var data = yield(_send_request(ENDPOINTS.CLUB_MEMBERS % club_id), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	var res = []
	for partial_club_member_data in data:
		res.append(PartialClubMember.new().from_json(partial_club_member_data))
	return res

func create_member(club_id: String, params: CreateMemberParams) -> ClubMember:
	var data = yield(_send_post_request(ENDPOINTS.CLUB_MEMBERS % club_id, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return ClubMember.new().from_json(data)

func get_member(club_id: String, member_id: String) -> ClubMember:
	var data = yield(_send_request(ENDPOINTS.CLUB_MEMBER % [club_id, member_id]), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return ClubMember.new().from_json(data)

func delete_member(club_id: String, member_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.CLUB_MEMBER % [club_id, member_id], {}), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error") and not data.is_no_content():
		return data

	return true

func modify_member(club_id: String, member_id: String, params: ModifyMemberParams) -> ClubMember:
	var data = yield(_send_patch_request(ENDPOINTS.CLUB_MEMBER % [club_id, member_id], params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return ClubMember.new().from_json(data)

func get_member_slots(club_id: String) -> ClubSlots:
	var data = yield(_send_request(ENDPOINTS.CLUB_MEMBER_SLOTS % club_id), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return ClubSlots.new().from_json(data)

func modify_member_slots(club_id: String, params: ModifyMemberSlotsParams) -> ClubSlots:
	var data = yield(_send_request(ENDPOINTS.CLUB_MEMBER_SLOTS % club_id, params.to_dict(), HTTPClient.METHOD_PUT), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return ClubSlots.new().from_json(data)

func get_users(only_free = false) -> Array:
	var query_str = ""
	if only_free:
		query_str += "?agents=free"
	var data = yield(_send_request(ENDPOINTS.USERS + query_str), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	var res = []
	for partial_user_data in data:
		res.append(PartialUser.new().from_json(partial_user_data))
	return res

func create_user(params: CreateUserParams) -> User:
	var data = yield(_send_post_request(ENDPOINTS.USERS, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return User.new().from_json(data)

func get_current_user() -> User:
	var data = yield(_send_request(ENDPOINTS.CURRENT_USER), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return User.new().from_json(data)

func get_user(user_id: String) -> User:
	var data = yield(_send_request(ENDPOINTS.USER % user_id), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return User.new().from_json(data)

func delete_user(user_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.USER % user_id, {}), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error") and not data.is_no_content():
		return data

	return true

func modify_user(user_id: String, params: ModifyUserParams) -> User:
	var data = yield(_send_patch_request(ENDPOINTS.USER % user_id, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return User.new().from_json(data)

func get_user_clubs(user_id: String) -> Array:
	var data = yield(_send_request(ENDPOINTS.USER_CLUBS % user_id), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	var res = []
	for partial_club_data in data:
		res.append(PartialClub.new().from_json(partial_club_data))
	return res

func join_club(user_id: String, params: JoinClubParams) -> PartialClub:
	var data = yield(_send_post_request(ENDPOINTS.USER_CLUBS % user_id, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return PartialClub.new().from_json(data)

func leave_club(user_id: String, club_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.USER_CLUB % [user_id, club_id], {}), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error") and not data.is_no_content():
		return data

	return true

func get_permissions(user_id: String) -> UserPermissions:
	var data = yield(_send_request(ENDPOINTS.USER_PERMISSIONS % user_id), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return UserPermissions.new().from_json(data)

func change_permissions(user_id: String, params: ChangePermissionsParams) -> UserPermissions:
	var data = yield(_send_request(ENDPOINTS.USER_PERMISSIONS % user_id, params.to_dict(), HTTPClient.METHOD_PUT), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return UserPermissions.new().from_json(data)

func get_user_awards(user_id: String) -> Array:
	var data = yield(_send_request(ENDPOINTS.USER_AWARDS % user_id), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	var res = []
	for partial_user_award_data in data:
		res.append(PartialUserAward.new().from_json(partial_user_award_data))
	return res

func give_award(user_id: String, params: GiveAwardParams) -> UserAward:
	var data = yield(_send_post_request(ENDPOINTS.USER_AWARDS % user_id, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return UserAward.new().from_json(data)

func get_user_award(user_id: String, award_id: String) -> UserAward:
	var data = yield(_send_request(ENDPOINTS.USER_AWARD % [user_id, award_id]), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return UserAward.new().from_json(data)

func take_award(user_id: String, award_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.USER_AWARD % [user_id, award_id], {}), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error") and not data.is_no_content():
		return data

	return true

func get_items() -> Array:
	var data = yield(_send_request(ENDPOINTS.ITEMS), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	var res = []
	for partial_item_data in data:
		res.append(PartialItem.new().from_json(partial_item_data))
	return res

func create_item(params: CreateItemParams) -> Item:
	var data = yield(_send_post_request(ENDPOINTS.ITEMS, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Item.new().from_json(data)

func get_item(item_id: String) -> Item:
	var data = yield(_send_request(ENDPOINTS.ITEM % item_id), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Item.new().from_json(data)

func delete_item(item_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.ITEM % item_id, {}), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error") and not data.is_no_content():
		return data

	return true

func modify_item(item_id: String, params: ModifyItemParams) -> Item:
	var data = yield(_send_patch_request(ENDPOINTS.ITEM % item_id, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Item.new().from_json(data)

func get_transactions(filter_by: String, object_id: String) -> Array:
	if not filter_by in ["seller", "buyer"]:
		print("Invalid filter_by in get_transactions()")
		return null
	var data = yield(_send_request(ENDPOINTS.TRANSACTIONS + "?filter_by=%s&object_id=%s%" % [filter_by, object_id]), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	var res = []
	for transaction_data in data:
		res.append(Transaction.new().from_json(transaction_data))
	return res

func create_transaction(params: CreateTransactionParams) -> Transaction:
	var data = yield(_send_post_request(ENDPOINTS.TRANSACTIONS, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Transaction.new().from_json(data)

func get_transaction(transaction_id: String) -> Transaction:
	var data = yield(_send_request(ENDPOINTS.TRANSACTION % transaction_id), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Transaction.new().from_json(data)

func authorize(params: AuthorizeParams) -> Token:
	var data = yield(_send_post_request(ENDPOINTS.AUTHORIZE, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Token.new().from_json(data)

func revoke() -> bool:
	var data = yield(_send_post_request(ENDPOINTS.REVOKE, {}), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return true

func get_invites() -> Array:
	var data = yield(_send_request(ENDPOINTS.INVITES), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	var res = []
	for partial_invite_data in data:
		res.append(PartialInvite.new().from_json(partial_invite_data))
	return res

func create_invite(params: CreateInviteParams) -> Invite:
	var data = yield(_send_post_request(ENDPOINTS.INVITES, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Invite.new().from_json(data)

func delete_invite(invite_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.INVITE % invite_id, {}), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error") and not data.is_no_content():
		return data

	return true

func accept_invite(invite_id: String):
	var data = yield(_send_post_request(ENDPOINTS.INVITE_ACCEPT % invite_id, {}), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error") and not data.is_no_content():
		return data

	return PartialClubMember.new().from_json(data)

func get_awards() -> Array:
	var data = yield(_send_request(ENDPOINTS.AWARDS), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	var res = []
	for partial_award_data in data:
		res.append(PartialAward.new().from_json(partial_award_data))
	return res

func create_award(params: CreateAwardParams) -> Award:
	var data = yield(_send_post_request(ENDPOINTS.AWARDS, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Award.new().from_json(data)

func get_award(award_id: String) -> Award:
	var data = yield(_send_request(ENDPOINTS.AWARD % award_id), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Award.new().from_json(data)

func delete_award(award_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.AWARD % award_id, {}), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error") and not data.is_no_content():
		return data

	return true

func modify_award(award_id: String, params: ModifyAwardParams) -> Award:
	var data = yield(_send_patch_request(ENDPOINTS.AWARD % award_id, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Award.new().from_json(data)

func get_applications(filter_application: String = "all") -> Array:
	if not filter_application in ["club", "manager", "all"]:
		print("Invalid filter_by in get_transactions()")
		return null
	var data = yield(_send_request(ENDPOINTS.APPLICATIONS + "?filter_application=%s" % [filter_application]), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	var res = []
	for partial_application_data in data:
		res.append(PartialApplication.new().from_json(partial_application_data))
	return res

func create_application(params: CreateApplicationParams) -> Application:
	var data = yield(_send_post_request(ENDPOINTS.APPLICATIONS, params.to_dict()), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Application.new().from_json(data)

func get_application(application_id: String) -> Application:
	var data = yield(_send_request(ENDPOINTS.APPLICATION % application_id), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error"):
		return data

	return Application.new().from_json(data)

func delete_application(application_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.APPLICATION % application_id, {}), "completed")
	if typeof(data) == TYPE_OBJECT and data.has_method("is_error") and not data.is_no_content():
		return data

	return true

func update_url():
	if debug:
		_base_url = PCFMetadata.REST_URL_LOCAL
	else:
		_base_url = PCFMetadata.REST_URL % PCFMetadata.REST_VERSION


# ---------- Privates ----------


const ENDPOINTS: Dictionary = {
	# Clubs
	CLUBS = "/clubs/",
	CLUB = "/clubs/%s/",
	CLUB_MEMBERS = "/clubs/%s/members/",
	CLUB_MEMBER = "/clubs/%s/members/%s/",
	CLUB_MEMBER_SLOTS = "/clubs/%s/slots/",

	# Users
	USERS = "/users/",
	CURRENT_USER = "/users/@me/",
	USER = "/users/%s/",
	USER_CLUBS = "/users/%s/clubs/",
	USER_CLUB = "/users/%s/clubs/%s/",
	USER_PERMISSIONS = "/users/%s/permissions/",
	USER_AWARDS = "/users/%s/awards/",
	USER_AWARD = "/users/%s/award/%s/",

	# Items
	ITEMS = "/marketplace/items/",
	ITEM = "/marketplace/items/%s/",

	# Transactions
	TRANSACTIONS = "/transactions/",
	TRANSACTION = "/transactions/%s/",

	# Invites
	INVITES = "/invites/",
	INVITE = "/invites/%s/",
	INVITE_ACCEPT = "/invites/%s/accept/",

	# Awards
	AWARDS = "/awards/",
	AWARD = "/awards/%s/",

	# Authorization
	AUTHORIZE = "/auth/authorize/",
	REVOKE = "/auth/revoke/",

	APPLICATIONS = "/applications/",
	APPLICATION = "/applications/%s/",
}

var debug = false
var _base_url: String
var _auth_header = ""
var _headers = [
	"User-Agent: https://github.com/3ddelano/proclubfederation-api-wrapper | Godot " + Engine.get_version_info()["string"]
]

func _init() -> void:
	name = "PCFRESTClient"
	pause_mode = PAUSE_MODE_PROCESS

func _ready() -> void:
	update_url()

func get_class() -> String:
	return "PCFRESTClient"

func _to_string() -> String:
	return "[%s:%d]" % [self.get_class(), self.get_instance_id()]

func _send_post_request(slug: String, payload: Dictionary):
	return _send_request(slug, payload, HTTPClient.METHOD_POST)

func _send_patch_request(slug: String, payload: Dictionary):
	return _send_request(slug, payload, HTTPClient.METHOD_PATCH)

func _send_delete_request(slug: String, payload: Dictionary):
	return _send_request(slug, payload, HTTPClient.METHOD_DELETE)

func _send_request(slug: String, payload := {}, method := HTTPClient.METHOD_GET) -> HTTPResponse:
	var headers = _headers.duplicate(true)

	if not _auth_header == "":
		headers.append(_auth_header)

	if not payload.empty():
		headers.append("Content-Type: application/json")

	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.call_deferred("request", _base_url + slug, headers, true, method, JSON.print(payload))

	var data = yield(http_request, "request_completed")
	http_request.queue_free()

	# Check for errors
	var res := HTTPResponse.new(data[0], data[1], data[2], data[3])

	if res.is_error() or res.is_no_content():
		# Got some error or 204
		return res

	var json = res.get_json()
	return json
