-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'szw/vim-maximizer',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>')
    end,
  },
  {
    'chrisbra/Colorizer',
    event = 'VeryLazy',
  },
  {
    'Exafunction/codeium.vim',
  },
  {
    'wuelnerdotexe/vim-astro',
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
  {
    'michaelrommel/nvim-silicon',
    event = 'VeryLazy',
    cmd = 'Silicon',
    config = function()
      local function get_home_directory()
        local user = vim.fn.expand '$USER'
        return '/home/' .. user
      end

      require('nvim-silicon').setup {
        font = 'JetBrains Mono NF=34;Noto Color Emoji=34',
        theme = 'Dracula',
        background_image = get_home_directory() .. '/.config/silicon/bg.jpg',
        no_line_number = true,
        language = function()
          if vim.bo.filetype == 'astro' then
            return 'jsx'
          end
          return vim.bo.filetype
        end,
        shadow_blur_radius = 16,
        shadow_offset_x = 8,
        shadow_offset_y = 8,
        shadow_color = '#100808',
        gobble = true,
        window_title = function()
          return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ':t')
        end,
        output = function()
          return './silicon_' .. os.date '!%Y-%m-%dT%H-%M-%S' .. '_code.png'
        end,
      }
    end,
  },
  {
    'f-person/git-blame.nvim',
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      vim.keymap.set('n', '<leader>x', ':bdelete<CR>')
      vim.keymap.set('n', '<C-x>', ':bdelete<CR>')
      vim.keymap.set('n', 'H', ':bprevious<CR>')
      vim.keymap.set('n', 'L', ':bnext<CR>')

      require('bufferline').setup {
        options = {
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'File Explorer',
              highlight = 'Directory',
              text_align = 'left',
            },
          },
        },
      }
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    event = 'VimEnter',
    config = function()
      require('toggleterm').setup {
        size = 10,
      }
      -- exit terminal mode in the builtin terminal with a shortcut that is a bit easier
      vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
      vim.keymap.set('t', 'jj', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

      vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { desc = 'Toggle floating terminal' })
      vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { desc = 'Toggle horizontal terminal' })
      vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { desc = 'Toggle vertical terminal' })
    end,
  },
  {
    'nvim-flutter/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    opts = {},
  },
  {
    'nvim-java/nvim-java',
    config = function()
      vim.keymap.set('n', '<leader>jc', ':JavaBuildCleanWorkspace<CR>', { desc = 'Clean java workspace' })
      vim.keymap.set('n', '<leader>jb', ':JavaBuildBuildWorkspace', { desc = 'Build java workspace' })
      vim.keymap.set('n', '<leader>jr', ':JavaRunnerRunMain<CR>', { desc = 'Run java main application' })
    end,
  },
}
