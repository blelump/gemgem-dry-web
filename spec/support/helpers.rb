module Helpers
  module_function

  def fixtures_path
    SPEC_ROOT.join('fixtures')
  end

  def container
    Simple::Container
  end

  def app
    Simple::Application.app
  end

  def db_conn
    container['persistence.config'].gateways[:default].connection
  end
end
