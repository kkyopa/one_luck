module LucksHelper
    def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_lucks_path
    elsif action_name == 'edit'
      luck_path
    end
    end
end
