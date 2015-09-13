require 'cell'

class Grid
    attr_reader :rows, :columns

    def initialize(rows, columns)
        @rows = rows
        @columns = columns
        @grid = prepare_grid
        configure_cells
    end

    def prepare_grid
        Array.new(rows) do |row|
            Array.new(columns) do |column|
                Cell.new(row, column)
            end
        end
    end

    def configure_cells
        each_cell do |cell|
            row, col = cell.row, cell.column
            cell.north = self[row - 1, col]
            cell.south = self[row + 1, col]
            cell.west = self[row, col - 1]
            cell.east = self[row, col + 1]
        end
    end

    def [](row, column)
        return nil unless row.between?(0, @rows - 1)
        return nil unless column.between?(0, @grid[row].count - 1)
        @grid[row][column]
    end

    def random_cell
        row = rand(@rows)
        column = rand(@grid[row].count)
        self[row, column]
    end

    def size
        @rows * @columns
    end

    def each_row
        @grid.each do |row|
            yield row
        end
    end

    def each_cell
        each_row do |row|
            row.each do |cell|
                yield cell if cell
            end
        end
    end

  def to_s
    output = "+" + "---+" * columns + "\n"

    each_row do |row|
      top = "|"
      bottom = "+"

      row.each do |cell|
        cell = cell.new(-1, -1) unless cell

        body = "   " # <-- that's THREE (3) spaces!
        east_boundary = (cell.linked?(cell.east) ? " " : "|")
        top << body << east_boundary

        # three spaces below, too >>-------------->> >...<
        south_boundary = (cell.linked?(cell.south) ? "   " : "---")
        corner = "+"
        bottom << south_boundary << corner
      end

      output << top << "\n"
      output << bottom << "\n"
    end

    output
  end
end
