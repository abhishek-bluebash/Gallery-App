require_relative "boot"

require "rails/all"


Bundler.require(*Rails.groups)

module Galery
  class Application < Rails::Application
    config.load_defaults 6.1
    config.active_storage.replace_on_assign_to_many=false

end
end