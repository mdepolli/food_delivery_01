require "csv"

class BaseRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @elements = []
    @next_id = 1
    load_csv
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  private

  def load_csv
    return unless File.exist?(@csv_file_path)
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
