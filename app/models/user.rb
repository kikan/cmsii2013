class User < ActiveRecord::Base
  
  def self.method_missing(nom_methode)
    if nom_methode[/^trouve_/]
      login = nom_methode.to_s.split("_").last
      where(login: login).first
    end
  end
  
end
