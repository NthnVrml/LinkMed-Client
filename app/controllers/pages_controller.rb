class PagesController < ApplicationController
  def home
      @titre = "Accueil"
  end
  def about
      @titre = "A propos de nous"
  end
  def contact	
         @titre = "Contact"
  end
end
