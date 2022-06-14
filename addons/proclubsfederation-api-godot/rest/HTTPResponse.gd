# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name HTTPResponse
extends Reference

var result: int
var response_code: int
var headers: PoolStringArray
var body: PoolByteArray

func is_no_content():
	return response_code == 204 and result == OK

func is_not_found_error():
	return response_code == 404 and result == OK

func is_validation_error():
	return response_code == 422 and result == OK

func is_unauthorized_error():
	return response_code == 401 and result == OK

func is_internal_server_error():
	return response_code == 500 and result == OK

func is_error():
	return response_code < 200 or response_code > 299 or result != OK

func get_json() -> Dictionary:
	return parse_json(get_string())

func get_string() -> String:
	return body.get_string_from_utf8()

func get_class() -> String:
	return "HTTPResponse"

func _to_string() -> String:
	var body_str = body.get_string_from_utf8()
	if is_validation_error():
		return "HTTPResponse::ValidationError(" +  JSON.print(parse_json(body_str)["detail"], "\t") + ")"

	elif is_not_found_error():
		return "HTTPResponse::NotFoundError(" +  JSON.print(parse_json(body_str)["detail"], "\t") + ")"

	elif is_unauthorized_error():
		var json = parse_json(body_str)
		var ret = json
		if "detail" in json:
			ret = json["detail"]
		return "HTTPResponse::UnauthorizedError(" +  JSON.print(ret, "\t") + ")"

	elif is_internal_server_error():
		return "HTTPResponse::InternalServerError()"

	return "HTTPResponse(result=%s, response_code=%s, headers=%s, body=%s)" % [result, response_code, headers, body.get_string_from_utf8()]

func _init(p_result, p_response_code, p_headers, p_body) -> void:
	result = p_result
	response_code = p_response_code
	headers = p_headers
	body = p_body
