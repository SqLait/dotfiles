return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = {'~/Documents/orgfiles/**/*', '~/Documents/OrgRoamFiles/**/*'},  -- Adjusted to include subdirectories
      org_default_notes_file = '~/Documents/orgfiles',  -- A specific file for default notes
    })
  end,
}

