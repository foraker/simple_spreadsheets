module SimpleSpreadsheets
  module Rspec
    module Matcher
      RSpec::Matchers.define :be_valid_xls do |expected|
        match do |page|
          parsed = Nokogiri::XML(page.body.sub("<?xml version=\"1.0\"?>", ""))
          root   = parsed.xpath('/*').first

          parsed.errors.none? &&
          root.name == "Workbook" &&
          root.namespace.href == "urn:schemas-microsoft-com:office:spreadsheet"
        end
      end
    end
  end
end
