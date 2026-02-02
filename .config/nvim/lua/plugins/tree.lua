return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",  -- アイコン表示用
    },
    config = function()
        -- nvim-tree の設定
        require("nvim-tree").setup({
            -- 基本設定
            sort_by = "case_sensitive",
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = false,  -- dotfiles を表示
            },
        })
        
        -- キーマップ
        vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
        -- <leader>e でツリーと編集画面をトグル
        vim.keymap.set('n', '<leader>e', function()
            if vim.bo.filetype == 'NvimTree' then
                vim.cmd('wincmd p')  -- 前のウィンドウに戻る
            else
                require('nvim-tree.api').tree.focus()
            end
        end, { silent = true })

  	-- nvim起動時にnvim-treeを自動で開く
    	vim.api.nvim_create_autocmd("VimEnter", {
      	    callback = function()
                -- 引数なしでnvimを起動した場合のみ
                if vim.fn.argc() == 0 then
                    require("nvim-tree.api").tree.open()
                end
	    end,
	})
    end,
} 
