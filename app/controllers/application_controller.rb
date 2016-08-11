class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with :name => ENV['SPELL_USER'], :password => ENV['SPELL_USER']
end
