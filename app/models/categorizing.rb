# == Schema Information
#
# Table name: categorizings
#
#  id                 :integer          not null, primary key
#  category_id        :integer
#  categorizable_id   :integer
#  categorizable_type :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class Categorizing < ActiveRecord::Base
  belongs_to :category
  belongs_to :categorizable, polymorphic: true
end
