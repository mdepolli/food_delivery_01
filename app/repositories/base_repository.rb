require "csv"

class BaseRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @elements = []
    @next_id = 1
    load_csv
  end

  def add(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    save_to_csv
  end

  def all
    return @elements
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      @elements << build_element(row)
      @next_id += 1
    end
  end

  def save_to_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << @elements.first.class.headers
      @elements.each do |element|
        csv << element.row_for_csv
      end
    end
  end
end
