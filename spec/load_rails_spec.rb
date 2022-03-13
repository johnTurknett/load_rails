# frozen_string_literal: true

require "fileutils"

RSpec.describe LoadRails do
  it "has a version number" do
    expect(LoadRails::VERSION).not_to be nil
  end

  describe "self.load" do
    context "when not in a rails project" do
      it "responds with an error" do
        expect do
          LoadRails.load
        end.to raise_error LoadRails::RailsNotFound
      end
    end

    context "when in a rails project" do
      before do
        FileUtils.cd(File.expand_path(__dir__))

        `rails new --skip-bundle --force dummy`
      end

      it "has access to 'Rails'" do
        FileUtils.cd(::File.join("dummy", "app", "models"))

        LoadRails.load
        expect(Rails).to be
      end
    end
  end
end
