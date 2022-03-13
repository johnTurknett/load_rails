# frozen_string_literal: true

require "fileutils"
require_relative "load_rails/version"
require_relative "load_rails/exceptions/rails_not_found"

module LoadRails
  RAILS_ENVIRONMENT_PATH = ::File.join("config", "environment.rb").freeze

  # Determines if the current directory is the root of a Rails project.
  #
  # @returns [Boolean]
  def self.environment?
    File.exist?(RAILS_ENVIRONMENT_PATH)
  end

  # Finds the closes Rails application and requires it.
  # @return [nil]
  def self.load
    loop do
      if environment?
        require_rails!
        break
      else
        parent!
      end
    end
  end

  # Attempts to change directories to the parent of the current directory
  #
  # @raise [RailsNotFound] if root directory reached and a Rails environment
  #        file was not found
  # @return [nil]
  def self.parent!
    current_directory = Dir.pwd
    FileUtils.cd("..")

    raise RailsNotFound if current_directory == Dir.pwd
  end

  # Uses Ruby `require` to require the Rails environment for the current directory.
  #
  # @return [nil]
  def self.require_rails!
    require(::File.expand_path(RAILS_ENVIRONMENT_PATH, Dir.pwd))
    Rails.application.eager_load!
  end
end
