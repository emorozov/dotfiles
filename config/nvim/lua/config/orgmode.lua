local orgmode = require 'orgmode'
orgmode.setup {
  org_agenda_files = { '~/org/*' },
  org_default_notes_file = '~/org/todo.org',
  org_todo_keywords = { 'WAITING(w)', 'TODO(t)', 'IN-PROGRESS(p)', '|', 'DONE(d)', 'CANCELED(c)' },
  org_highlight_latex_and_related = 'entities',
}

orgmode.setup_ts_grammar()
