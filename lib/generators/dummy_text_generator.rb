module Rails
  module Generators
    class DummyTextGenerator < Rails::Generators::Base
      source_root File.expand_path("../../dummy_text/template", __FILE__)
      
      def generate_template
        copy_file "text_template.txt", "config/dummy_text/text_template.txt"
      end

    end
  end
end