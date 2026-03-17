module BookmarksHelper
  def level_label(level)
    case level
    when "beginner"
      "初級"
    when "intermediate"
      "中級"
    when "advanced"
      "上級"
    else
      level
    end
  end
end
