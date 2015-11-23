# == Schema Information
#
# Table name: etablissements
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Etablissement < ActiveRecord::Base
  def Etablissement.all_etablissement_name
		etablissements_names =[]
    Etablissement.all.each{|e| etablissements_names << e.name} 
		etablissements_names.to_json.html_safe
  end
end
