module VotingsHelper
  def next_event(status)
    mappings = {
      open: :vote,
      voting: :close,
      reviewing: :publish,
      published: :reopen
    }

    mappings[status.to_sym]
  end

  def change_event_btn_text(status)
    mappings = {
      open: 'Start voting',
      voting: 'Close voting',
      reviewing: 'Publish voting',
      published: 'Reopen voting'
    }

    mappings[status.to_sym]
  end

  def voting_template(status)
    mappings = {
      open: 'new_items_form',
      voting: 'voting_form'
    }

    mappings[status.to_sym]
  end
end
