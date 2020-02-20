class ActiveRecord::Errors
  # 指定したカラムのエラーを削除
  def delete(column)
    @errors.delete(column.to_s)
  end
end

module ActiveRecord::Validations
  # 指定したカラムのみをvalid?
  def valid_columns?(*columns)
    valid?
    cols = columns.flatten.collect(&:to_s)
    errors.keys.each do |k|
      errors.delete(k) unless cols.include?(k.to_s)
    end
    errors.empty?
  end
end