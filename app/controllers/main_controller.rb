class MainController < ApplicationController
  def index
    @for_spell = for_spell.first(100)
    @for_format = for_format.first(100)
    @spell_results = `echo #{@for_spell} | aspell -a` unless @for_spell == ""
    @format_results = self.for_format.gsub(/\s\([^)]*\)/, "") if self.for_format
  end

  def for_spell
    @for_spell = params[:for_spell].first(100)
  end

  def for_format
    @for_format = params[:for_format].first(100)
  end
end
