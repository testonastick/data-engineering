module OrdersHelper
  @@expected_headings = [
      "purchaser name",
      "item description",
      "item price",
      "purchase count",
      "merchant address",
      "merchant name"
  ]
  def can_process?(file_cont)
    lines = file_cont.lines
    headings = lines[0].chomp.split("\t")
    @@expected_headings == headings
  end

  def remove_tsv_header(data)
    full = data.split("\n")
    full[1, (full.length - 1)]
  end

  def map_line(line)
    entries = line.split("\t")
    ret = {}
    entries.each_index{ |i|
      ret[@@expected_headings[i]] = entries[i]
    }
    return ret
  end
end
