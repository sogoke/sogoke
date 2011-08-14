$ ->
	$("#like").live 'click', (event) => 
		$.post(
			"/favorites"
			"favorite[favorite_id]": $("#like").attr("data-id")
			token: $("#like").attr("data-token")
			(data) -> $("#like").attr "id", "unlike"; $("#unlike").text "取消喜欢"; $("#unlike").attr "data-id", data["favorite_id"]
			'json'
		)
	
	$("#unlike").live 'click', (event) => 
		$.post(
			"/favorites"
			id: $("#unlike").attr("data-id")
			token: $("#like").attr("data-token")
			(data) -> $("#unlike").attr "id", "like"; $("#like").text "喜欢"; $("#like").attr "data-id", data["sogoke_id"]
			'json'
		)