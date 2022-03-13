module LoadRails
    class RailsNotFound < Exception
      MSG = "Rails not found. Please execute in a Rails project."

      def self.exit_with_message
        puts RailsNotFound::MSG
        exit 1
      end
    end
end
