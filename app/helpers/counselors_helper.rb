module CounselorsHelper

	def unserialize(elem)
		elem.gsub(/[\[\]\"\'\,]/,'').split(' ').to_a
	end

	def show_counselor_avatar(counselor)
    counselor.image_url.to_s ? image_tag(counselor.image_url.to_s , class: "img-circle", size: "120x120" ) : image_tag('counselor.jpg', class: "img-circle", size: "120x120")  
	end

	def show_my_day_availabilities(counselor_day)
     counselor_day == [] ? content_tag(:div, "Aucune disponibilité ce jour"): content_tag(:div, show_my_day_office(counselor_day)) 	
	end

	def show_my_day_office(day)
		# [9,10,11]
		day.pop
		my_hours_offices = ""
	  day.each{ |hour| my_hours_offices += "#{hour.to_i}h - #{hour.to_i + 1}h | " }	
    my_hours_offices
	end
end
