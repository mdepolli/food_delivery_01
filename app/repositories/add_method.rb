module AddMethod
  def add(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    save_to_csv
  end
end
