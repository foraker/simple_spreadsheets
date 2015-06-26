module SimpleSpreadsheets
  module Rendering
    def render
      ERB.new(template).result(binding)
    end

    def template
      File.read(File.expand_path("../templates/#{template_file}.xml.erb", __FILE__))
    end

    def template_file
      self.class.name.demodulize.downcase
    end
  end
end
