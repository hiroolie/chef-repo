# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
<<<<<<< HEAD
node_name                "admin"
client_key               "#{current_dir}/admin.pem"
validation_client_name   "cwp-validator"
validation_key           "#{current_dir}/cwp-validator.pem"
chef_server_url          "https://chef-server/organizations/cwp"
=======
node_name                "hiroolie"
client_key               "#{current_dir}/hiroolie.pem"
validation_client_name   "czs-validator"
validation_key           "#{current_dir}/czs-validator.pem"
chef_server_url          "https://chef01.mini.com/organizations/czs"
>>>>>>> origin/tamachi
cookbook_path            ["#{current_dir}/../cookbooks"]
