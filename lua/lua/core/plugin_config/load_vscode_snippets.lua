-- load_vscode_snippets.lua

local M = {}

function M.load_vscode_snippets()
  local current_file = vim.fn.expand('%:p')
  local vscode_snippet_file = vim.fn.findfile('.vscode/snippets.code-snippets', current_file)

  if not vscode_snippet_file or vscode_snippet_file == '' then
    print('Error: Unable to find vscode snippets file')
    return
  end

  local snippet_file = io.open(vscode_snippet_file, 'r')
  if not snippet_file then
    print('Error: Unable to open snippet file')
    return
  end

  local snippet_data = vim.fn.json_decode(snippet_file:read('*a'))
  snippet_file:close()

  -- Register the snippets using CocSnippetAdd
  for name, data in pairs(snippet_data) do
    local prefix = data.prefix
    local body = data.body

    -- Convert the body to a string
    local snippet_body = table.concat(body, '\n')

    -- Register the snippet using CocSnippetAdd
    vim.fn.CocSnippetAdd(prefix, { snippet_body })
  end

  print('Visual Studio Code snippets loaded successfully!')
end

return M
