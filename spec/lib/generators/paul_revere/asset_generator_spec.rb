require 'spec_helper'
require 'generator_spec'

describe PaulRevere::AssetGenerator do
  destination File.expand_path("../../../../../tmp", __FILE__)

  before(:all) do
    prepare_destination
    run_generator
  end

  it 'Copies the javascript file' do
    expect(destination_root).to have_structure {
      directory 'public' do
        directory 'javascripts' do
          file 'announcements.js' do
            contains 'hideAnnouncement'
          end
        end
      end
    }
  end

  it 'Copies the migration file' do
    expect(destination_root).to have_structure {
      directory 'db' do
        directory 'migrate' do
          migration 'create_announcements' do
            contains 'class CreateAnnouncements'
          end
        end
      end
    }
  end

end
