class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.split(":",2)[1].strip
  end

  def log_level
    @line.split(":")[0].downcase.tr('[]', '')
  end

  def reformat
    "#{message} (#{log_level})"
  end
end

#前後の空白を削除→"".strip"
#分割：.split
#小文字：.downcase
#文字列の順番を入れ替える→.reverse


