class AddRepresentativeToSchools < ActiveRecord::Migration
  def change
    add_reference :schools, :representative, index: true
  end
end
