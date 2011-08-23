$ ->
	$("#follow").live 'click', (event) => 
		$.ajax "/relations",
			type: "POST"
			dataType: "json"
			data: { "relation[receiver_id]": $("#follow").attr("data-id"), token: $("#follow").attr("data-token") }
			success: (data) -> 
				$("#follow").attr "id", "cancel_follow"; $("#cancel_follow").text "取消关注"; $("#cancel_follow").attr "data-id", data["relation_id"]
	
	$("#cancel_follow").live 'click', (event) => 
		$.ajax "/relations/"+$('#cancel_follow').attr('data-id'),
			type: "DELETE"
			dataType: "json"
			data: { token: $("#cancel_follow").attr("data-token") }
			success:	(data) -> 
				$("#cancel_follow").attr "id", "follow"; $("#follow").text "关注"; $("#follow").attr "data-id", data["sogoke_id"]
