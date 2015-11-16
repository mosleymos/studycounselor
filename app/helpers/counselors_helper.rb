module CounselorsHelper

	def unserialize(elem)
		elem.gsub(/[\[\]\"\'\,]/,'').split(' ').to_a
	end

	def show_counselor_avatar(counselor)
    counselor.image_url ? image_tag(counselor.image_url.to_s , class: "img-circle", size: "120x120" ) : image_tag('counselor.jpg', class: "img-circle", size: "120x120")  
	end

end
