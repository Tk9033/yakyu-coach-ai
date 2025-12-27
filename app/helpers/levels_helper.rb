module LevelsHelper
  def level_label(level)
    Ai::LevelDefinition.label(level)
  end
end
