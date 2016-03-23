require "simple_spreadsheets/version"
require "simple_spreadsheets/rendering"
require "simple_spreadsheets/document"
require "active_support/dependencies/autoload"
require "active_support/core_ext"

module SimpleSpreadsheets
  def self.render(name)
    document = Document.new(name)
    yield(document)
    document.render
  end
end
