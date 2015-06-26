require "spec_helper"
require "nokogiri"

describe SimpleSpreadsheets do
  describe "#render" do
    let(:expected) { File.read(File.expand_path("../fixtures/spreadsheet.xls", __FILE__)) }
    let(:actual) do
      described_class.render("Title") do |xls|
        xls.row do |row|
          row.string "Row 1 title"
          row.string "Row 2 title"
          row.string "Row 3 title"
        end
        xls.row do |row|
          row.string "Row 1 value"
          row.string "Row 2 value"
          row.number 10
        end
      end
    end

    it "builds a valid XLS file" do
      expect(normalize(actual)).to eq normalize(expected)
    end

    def normalize(xml)
      xml.gsub(/\n|\s\s/, "")
    end
  end
end
