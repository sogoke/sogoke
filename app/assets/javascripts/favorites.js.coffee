$ ->
	$("#like").live 'click', (event) => 
		$.ajax "/favorites",
			type: "POST"
			dataType: "json"
			data: { "favorite[favorite_id]": $("#like").attr("data-id"), token: $("#like").attr("data-token") }
			success: (data) -> 
				$("#like").attr "id", "unlike"; $("#unlike").text "取消喜欢"; $("#unlike").attr "data-id", data["favorite_id"]
	
	$("#unlike").live 'click', (event) => 
		$.ajax "/favorites/"+$('#unlike').attr('data-id'),
			type: "DELETE"
			dataType: "json"
			data: { token: $("#unlike").attr("data-token") }
			success:	(data) -> 
				$("#unlike").attr "id", "like"; $("#like").text "喜欢"; $("#like").attr "data-id", data["sogoke_id"]
