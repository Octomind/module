$(document).ready(function () {
    $('#read').val(getRandomInRange(1, 5));
    setInterval(function () {
		var rand = getRandomInRange(1, 5)
        $('#read').val(rand);
		$('#all').val(parseInt($('#all').val()) + rand)
    }, 3000);
});


function getRandomInRange(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

$(function () {
	$("#search").keyup(function () {
		var search = $("#search").val();
		$.ajax({
			type: "POST",
			url: "/tag/search/",
			data: {"search": search},
			cache: false,
			success: function (response) {
				$("#resSearch").html(response);
			}
		});
	return false;
	});
});

$(document).ready(function(){
    $(".banner").mouseenter(function(){
        $(this).find('p > span').css("color", "blue");
		$(this).find('p > span').css("fontSize", parseFloat($(this).find('p > span').css('fontSize')) * 2);
		$(this).find('p > span').html($(this).find('p > span').html() * 0.9);
    });
    $(".banner").mouseleave(function(){
        $(this).find('p > span').css("color", "");
		$(this).find('p > span').css("fontSize", "");
		$(this).find('p > span').html($(this).find('p > span').html()/0.9);
    });

	$(".banner >p>a").click(function () {
    var id = $(this).parent().attr("id");
    $.post("/", {promotion_id: id});
	});
});



$(document).ready(function () {
    $("#comment_form").submit(function (event) {
        event.preventDefault();
        var $form = $(this).prev();
        var id_parent = $form.find('#id_comment').val();
        var id_news = $(this).find('#id_news').val();
        var comment = $(this).find('textarea').val();
        $.post("/comments/page/", {comment: comment, id_parent: id_parent, id_news: id_news},
		 function (data) {
             
                var data = $(data);
                var elements = data.find('.panel');
                $('.panel').remove();
                $('#comment_form textarea').val('');
                var comments = '';
                elements.each(function (index) {
                    comments += ( elements.get(index).outerHTML );
                });
                $('#comment_form').after(comments);
            });
    });
});
$(document).on('click', '.panel-footer #answer', function () {
    var panel_info = $(this).closest('.panel');
    $(panel_info).after($('#comment_form'));
    $("button:reset").click(function () {
        $('.panel').eq(0).before($('#comment_form'));
    });
});

$(document).ready(function () {
    $(document).on('click', 'button#like', function () {$(this).find('span').html(parseInt($(this).find('span').html())+1);alert($(this).find('span').html());
        like('like', $(this));
    });

    $(document).on('click', 'button#dislike', function () {
		$(this).find('span').html(parseInt($(this).find('span').html())-1);alert($(this).find('span').html());
        like('dislike', $(this));
    });

});

function like(type, element) {
    var temp = element.parent();
    var id_comment = temp.find('#id_comment').val();
    var id_parent = temp.find('#id_parent').val();
    $.ajax({type: "POST", url: "/comments/page", data: {
            'id_comment': id_comment,
            'type': type
        }, dataType: "json", success: function (data) {alert('Голос засчитан');}
    });
}

$('.col-sm-push-8 > .banner').attr('data-placement', 'left');
$('.banner').tooltip();