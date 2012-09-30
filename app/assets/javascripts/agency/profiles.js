$(document).ready(function(){

	if ($('#file-uploader').exists()) {
		createUploader();
	}

	attachClickToPhotos();
});

function createUploader() {
	var uploader = new qq.FileUploader({
		element: $('#file-uploader').get(0),
		multiple: false,
		action: '/profile/logos',
		params: {	authenticity_token: $('input[name=authenticity_token]').val()	},
		onComplete: function(id, fileName, responseJSON){
			resetJcropImage(responseJSON);
			updatePhotosList(responseJSON);
		}
	});
	uploader._button._options.onChange = function(input) {
		$("ul.qq-upload-list").html("");
		uploader._onInputChange(input);
	}
}

function resetJcropImage(image) {
  // FIXME: onImageClick -- destroy Jcrop, change the image, reload Jcrop
  $img = $('.crop_container img.js-jcrop')
  $img.src = image.url;
  $img.width = image.w;
  $img.height = image.h;
}

function updatePhotosList(image) {
	var img = $("<img/>").attr("src", image.thumb_url);
	var a = $("<a></a>")
					.attr("href", "#")
					.attr("data-url", image.url)
					.attr("data-width", image.w)
					.attr("data-height", image.h)
					.append(img);
	var li = $("<li></li>").css("display", "none").append(a);
	$(".photos ul").append(li)
	li.show(800);
	attachClickToPhotos();
}

function attachClickToPhotos() {
  $(".photos ul li a").unbind('click');
  $(".photos ul li a").bind('click', function(event) {
    var image = new Object();
    image.url = $(this).attr("data-url");
    image.w = $(this).attr("data-width");
    image.h = $(this).attr("data-height");
    resetJcropImage(image);
    event.preventDefault();
  });
}