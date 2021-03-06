# frozen_string_literal: true

require_relative "lib/load_rails/version"

Gem::Specification.new do |spec|
  spec.name = "load_rails"
  spec.version = LoadRails::VERSION
  spec.authors = ["John Turknett"]
  spec.email = ["load_rails@johnturknett.com"]

  spec.summary = "Loads the Rails environment."
  spec.description = "Load the Rails environment for access in your application."
  spec.homepage = "https://johnturknett.github.io/load_rails/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/johnTurknett/load_rails"
  spec.metadata["changelog_uri"] = "https://github.com/johnTurknett/load_rails"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rails", "7.0.2.3"
  spec.add_development_dependency "rspec", "3.11.0"
  spec.add_development_dependency "rubocop", "1.26.0"
  spec.add_development_dependency "yard", "0.9.27"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
