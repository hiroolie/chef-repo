# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "hiroolie"
client_key               "#{current_dir}/hiroolie.pem"
validation_client_name   "czs-validator"
validation_key           "#{current_dir}/czs-validator.pem"
chef_server_url          "https://chef01.mini.com/organizations/czs"
cookbook_path            ["#{current_dir}/../cookbooks"]
