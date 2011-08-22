module DummyText
  class Railtie < Rails::Railtie
    initializer 'dummy_text.insert' do
      ActionView::Base.send(:include, DummyText::Base)
    end
  end
end
