# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

set :public_folder, File.join(APP_ROOT, "public")

set :app_folder, (APP_ROOT)

run Sinatra::Application
