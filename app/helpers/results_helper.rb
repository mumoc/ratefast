module ResultsHelper
  def results_template(voting)
    if voting.reviewing?
      'draggable'
    else
      'table'
    end
  end
end
