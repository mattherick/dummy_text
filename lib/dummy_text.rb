require "rails" if defined?(Rails)
require 'dummy_text/base'
require 'dummy_text/template'

module DummyText
  
  class Railtie < Rails::Railtie
    initializer 'dummy_text.insert' do
      ActionView::Base.send(:include, DummyText::Base)
    end
  end

end