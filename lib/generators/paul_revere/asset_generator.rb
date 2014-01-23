require 'rails/generators'
require 'rails/generators/active_record'

module PaulRevere
  class AssetGenerator < ActiveRecord::Generators::Base

    argument :name, type: :string, default: 'announcements'
    source_root File.join(File.dirname(__FILE__), 'templates')

    def install
      copy_javascript if needs_js_copied?
      migration_template 'migration.rb', 'db/migrate/create_announcements.rb'
    end

    private

    def copy_javascript
      copy_file File.join(javascript_path, 'announcements.js'), js_destination
    end

    def javascript_path
      File.join(%w(.. .. .. .. app assets javascripts))
    end

    def needs_js_copied?
      ::Rails.version < '3.1' || !::Rails.application.config.assets.enabled
    end

    def js_destination
      'public/javascripts/announcements.js'
    end
  end
end
