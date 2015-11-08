module ResultsHelper
  def results_template(voting)
    if voting.reviewing?
      'draggable'
    elsif voting.published?
      'published'
    else
      'table'
    end
  end
end
