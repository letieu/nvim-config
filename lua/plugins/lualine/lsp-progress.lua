return {
  'lsp_progress',
  colors = {
    title = "#076678",
    spinner = "#427b58",
    lsp_client_name = "#b8bb26",
    use = true,
  },
  separators = {
    component = ' ',
    progress = ' | ',
    message = { pre = '(', post = ')' },
    percentage = { pre = '', post = '%% ' },
    title = { pre = '', post = ': ' },
    lsp_client_name = { pre = '[', post = ']' },
    spinner = { pre = '', post = '' },
  },
  only_show_attached = true,
  display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
  timer = {
    progress_enddelay = 500,
    spinner = 1000,
    lsp_client_name_enddelay = 1000,
    attached_delay = 3000,
  },
  spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
  message = { initializing = 'Init ..', commenced = 'Start ..', completed = 'OK' },
  max_message_length = 30,
}
