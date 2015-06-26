module SimpleSpreadsheets
  class Document
    include Rendering

    def self.render(title)
      instance = new(title)
      yield instance
      instance.render
    end

    def initialize(title)
      @title = title
      @rows = []
    end

    def row
      row = Row.new
      yield(row)
      rows << row
    end

    private

    attr_accessor :rows

    def render_rows
      rows.map(&:render).join("\n")
    end

    class Row
      include Rendering

      def initialize
        @cells = []
      end

      def string(value)
        append_cell("String", value)
      end

      def number(value)
        append_cell("Number", value)
      end

      private

      def append_cell(type, value)
        cells << Cell.new(type, value)
      end

      attr_accessor :cells

      def render_cells
        cells.map(&:render).join("\n")
      end

      class Cell
        include Rendering

        def initialize(type, value)
          @type, @value = type, value
        end

        private

        attr_reader :type, :value
      end
    end
  end
end
