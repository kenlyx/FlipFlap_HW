# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []
    lines = tsv.split("\n")
    keys = lines[0].split("\t").map!(&:chomp)
    # keys.map!(&:chomp)
    lines.shift
    lines.each do |line|
      values = line.split("\t")
      record = {}
      keys.each_index { |index| record[keys[index]] = values[index].chomp }
      @data.push(record)
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    # deal with title
    tsv_string = ''
    keys_array = @data[0].keys
    keys_array.each { |title| tsv_string << "#{title}\t" }
    tsv_string.chop! << "\n"
    # deal with content
    (1..@data.size).to_a.each do |count|
      value_array = @data[count - 1].values
      value_array.each do |value|
        tsv_string << "#{value}\t"
      end
      tsv_string.chop! << "\n"
    end
    return tsv_string
  end
end
