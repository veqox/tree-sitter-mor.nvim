local function setup()
    vim.filetype.add({
        extension = {
            mo = "mo"
        }
    })

    vim.treesitter.language.register("mor", "mo")
end

local function build()
    local source_repo = vim.fn.stdpath("data") .. "/lazy/tree-sitter-mor.nvim/queries/"
    local dest_dir = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/queries/mor/"

    if vim.fn.isdirectory(dest_dir) == 0 then
        vim.fn.mkdir(dest_dir, "p")
    end

    local files = vim.fn.glob(source_repo .. "*", false, true)

    for _, file in ipairs(files) do
        if vim.fn.filereadable(file) == 1 then
            local dest_file = dest_dir .. vim.fn.fnamemodify(file, ":t")
            local result = vim.fn.system({ "cp", file, dest_file })

            if vim.v.shell_error ~= 0 then
                vim.notify("Failed to copy file: " .. file .. "\n" .. result, vim.log.levels.ERROR)
            end
        end
    end

    if vim.v.shell_error ~= 0 then
        vim.notify("Failed to copy Tree-sitter queries: " .. result, vim.log.levels.ERROR)
    end
end


return {
    setup = setup,
    build = build,
}
