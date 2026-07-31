return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- The `master` branch is locked to Nvim 0.11. On 0.12 its markdown
        -- injections query calls `#set-lang-from-info-string!`, a directive that
        -- reads `match[id]` as a single node -- since 0.11 that is a list of
        -- nodes, so the directive throws and highlighting dies buffer-wide.
        branch = "main",
        lazy = false, -- `main` does not support lazy-loading
        build = ":TSUpdate",
        config = function()
            local nts = require("nvim-treesitter")

            local ensure_installed = {
                "bash",
                "c",
                "css",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "rust",
                "tcl",
                "typescript",
                "yaml",
            }

            nts.setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            -- True once a parser for `lang` can be loaded, whether it was
            -- installed here or ships with Neovim (c, lua, markdown, vim, ...).
            local function has_parser(lang)
                return vim.treesitter.language.add(lang) == true
            end

            local function start(buf, lang)
                if lang and vim.api.nvim_buf_is_valid(buf) and has_parser(lang) then
                    vim.treesitter.start(buf, lang)
                end
            end

            -- `main` dropped the `highlight` and `auto_install` options, so both
            -- are done by hand: highlighting is started per buffer, and a parser
            -- that is missing but available upstream is fetched on first use.
            local attempted = {}

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
                callback = function(ev)
                    local lang = vim.treesitter.language.get_lang(ev.match)
                    if not lang then
                        return
                    end

                    if has_parser(lang) then
                        vim.treesitter.start(ev.buf, lang)
                        return
                    end

                    -- Only ever evaluate a given language once per session.
                    if attempted[lang] then
                        return
                    end
                    attempted[lang] = true

                    if vim.list_contains(nts.get_available(), lang) then
                        nts.install(lang):await(function()
                            vim.schedule(function()
                                start(ev.buf, lang)
                            end)
                        end)
                    end
                end,
            })

            -- `install` is a no-op when everything is present, but it runs
            -- asynchronously -- so on a first launch the buffers opened before it
            -- finishes need highlighting kicked off after the fact.
            nts.install(ensure_installed):await(function()
                vim.schedule(function()
                    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                        local ft = vim.bo[buf].filetype
                        if ft ~= "" then
                            start(buf, vim.treesitter.language.get_lang(ft))
                        end
                    end
                end)
            end)
        end,
    },
}
