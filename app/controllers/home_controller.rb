class HomeController < ApplicationController
  def main
		@counselors = Counselor.last(3)
  end
  def connexion
    
  end
  
  def test
    
  end
end
