<<<<<<< HEAD
The chef-repo
===============
All installations require a central workspace known as the chef-repo. This is a place where primitive objects--cookbooks, roles, environments, data bags, and chef-repo configuration files--are stored and managed.

The chef-repo should be kept under version control, such as [git](http://git-scm.org), and then managed as if it were source code.

Knife Configuration
-------------------
Knife is the [command line interface](https://docs.chef.io/knife.html) for Chef. The chef-repo contains a .chef directory (which is a hidden directory by default) in which the Knife configuration file (knife.rb) is located. This file contains configuration settings for the chef-repo.

The knife.rb file is automatically created by the starter kit. This file can be customized to support configuration settings used by [cloud provider options](https://docs.chef.io/plugin_knife.html) and custom [knife plugins](https://docs.chef.io/plugin_knife_custom.html).

Also located inside the .chef directory are .pem files, which contain private keys used to authenticate requests made to the Chef server. The USERNAME.pem file contains a private key unique to the user (and should never be shared with anyone). The ORGANIZATION-validator.pem file contains a private key that is global to the entire organization (and is used by all nodes and workstations that send requests to the Chef server).

More information about knife.rb configuration options can be found in [the documentation for knife](https://docs.chef.io/config_rb_knife.html).

Cookbooks
---------
A cookbook is the fundamental unit of configuration and policy distribution. A sample cookbook can be found in `cookbooks/starter`. After making changes to any cookbook, you must upload it to the Chef server using knife:

    $ knife upload cookbooks/starter

For more information about cookbooks, see the example files in the `starter` cookbook.

Roles
-----
Roles provide logical grouping of cookbooks and other roles. A sample role can be found at `roles/starter.rb`.

Getting Started
-------------------------
Now that you have the chef-repo ready to go, check out [Learn Chef](https://learn.chef.io/) to proceed with your workstation setup. If you have any questions about Chef you can always ask [our support team](https://www.chef.io/support/) for a helping hand.
=======
This directory contains the cookbooks used to configure systems in your infrastructure with Chef.

Knife needs to be configured to know where the cookbooks are located with the `cookbook_path` setting. If this is not set, then several cookbook operations will fail to work properly.

    cookbook_path ["./cookbooks"]

This setting tells knife to look for the cookbooks directory in the present working directory. This means the knife cookbook subcommands need to be run in the `chef-repo` directory itself. To make sure that the cookbooks can be found elsewhere inside the repository, use an absolute path. This is a Ruby file, so something like the following can be used:

    current_dir = File.dirname(__FILE__)
    cookbook_path ["#{current_dir}/../cookbooks"]

Which will set `current_dir` to the location of the knife.rb file itself (e.g. `~/chef-repo/.chef/knife.rb`).

Configure knife to use your preferred copyright holder, email contact and license. Add the following lines to `.chef/knife.rb`.

    cookbook_copyright "Example, Com."
    cookbook_email     "cookbooks@example.com"
    cookbook_license   "apachev2"

Supported values for `cookbook_license` are "apachev2", "mit","gplv2","gplv3",  or "none". These settings are used to prefill comments in the default recipe, and the corresponding values in the metadata.rb. You are free to change the the comments in those files.

Create new cookbooks in this directory with Knife.

    knife cookbook create COOKBOOK

This will create all the cookbook directory components. You don't need to use them all, and can delete the ones you don't need. It also creates a README file, metadata.rb and default recipe.

You can also download cookbooks directly from the Opscode Cookbook Site. There are two subcommands to help with this depending on what your preference is.

The first and recommended method is to use a vendor branch if you're using Git. This is automatically handled with Knife.

    knife cookbook site install COOKBOOK

This will:

* Download the cookbook tarball from cookbooks.opscode.com.
* Ensure its on the git master branch.
* Checks for an existing vendor branch, and creates if it doesn't.
* Checks out the vendor branch (chef-vendor-COOKBOOK).
* Removes the existing (old) version.
* Untars the cookbook tarball it downloaded in the first step.
* Adds the cookbook files to the git index and commits.
* Creates a tag for the version downloaded.
* Checks out the master branch again.
* Merges the cookbook into master.
* Repeats the above for all the cookbooks dependencies, downloading them from the community site

The last step will ensure that any local changes or modifications you have made to the cookbook are preserved, so you can keep your changes through upstream updates.

If you're not using Git, use the site download subcommand to download the tarball.

    knife cookbook site download COOKBOOK

This creates the COOKBOOK.tar.gz from in the current directory (e.g., `~/chef-repo`). We recommend following a workflow similar to the above for your version control tool.
>>>>>>> origin/master
